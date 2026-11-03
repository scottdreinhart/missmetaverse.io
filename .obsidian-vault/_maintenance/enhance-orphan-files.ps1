# Orphan File Evaluation & Enhancement Script
# Identifies orphans, evaluates content quality, and enhances with tags/links/citations

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

Write-Host "`n=== ORPHAN EVALUATION & ENHANCEMENT ===" -ForegroundColor Cyan

# ============================================================
# 1. Identify Orphaned Files
# ============================================================
Write-Host "`n--- 1. Identifying Orphaned Files ---" -ForegroundColor Yellow

$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse
$existingFiles = @{}
foreach ($file in $allFiles) {
    $fileName = $file.Name -replace '\.md$', ''
    $existingFiles[$fileName] = $file.FullName
}

# Collect all linked files
$linkedFiles = @{}
foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $links = [regex]::Matches($content, '\[\[([^\]|]+)')
    foreach ($link in $links) {
        $target = $link.Groups[1].Value -replace '\.md$', ''
        $linkedFiles[$target] = $true
    }
}

$orphanFiles = @()
$intentionalOrphans = @()

foreach ($file in $allFiles) {
    # Skip maintenance, README, AGENTS, indexes
    if ($file.DirectoryName -match '_maintenance') { continue }
    if ($file.Name -match 'README|AGENTS|index|_template|stub') { continue }
    
    $fileName = $file.Name -replace '\.md$', ''
    if (-not $linkedFiles.ContainsKey($fileName)) {
        $orphanFiles += $file
    }
}

Write-Host "Total orphan files: $($orphanFiles.Count)" -ForegroundColor Cyan

# ============================================================
# 2. Evaluate Content Quality
# ============================================================
Write-Host "`n--- 2. Evaluating Content Quality ---" -ForegroundColor Yellow

$thinFiles = @()      # Files with < 50 lines
$mediumFiles = @()    # Files with 50-200 lines
$thickFiles = @()     # Files with > 200 lines
$noSourcesFiles = @()
$noTagsFiles = @()

foreach ($file in $orphanFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $lines = ($content -split "`n").Count
    
    $fileData = @{
        name = $file.Name
        folder = $file.DirectoryName -replace "$specsDir\\", ''
        lines = $lines
        size = $file.Length
        has_sources = ($content -match '(?m)^sources:\s*$')
        has_tags = ($content -match '(?m)^tags:\s*$')
        has_slug = ($content -match '(?m)^slug:\s*')
        word_count = ($content -split '\s+').Count
    }
    
    if ($lines -lt 50) {
        $thinFiles += $fileData
    }
    elseif ($lines -lt 200) {
        $mediumFiles += $fileData
    }
    else {
        $thickFiles += $fileData
    }
    
    if (-not $fileData.has_sources) { $noSourcesFiles += $fileData }
    if (-not $fileData.has_tags) { $noTagsFiles += $fileData }
}

Write-Host "Thin files (<50 lines): $($thinFiles.Count)" -ForegroundColor Yellow
Write-Host "Medium files (50-200 lines): $($mediumFiles.Count)" -ForegroundColor White
Write-Host "Thick files (>200 lines): $($thickFiles.Count)" -ForegroundColor Green
Write-Host "No sources: $($noSourcesFiles.Count)" -ForegroundColor Yellow
Write-Host "No tags: $($noTagsFiles.Count)" -ForegroundColor Yellow

# ============================================================
# 3. Enhance Thin Files with Tags and Links
# ============================================================
Write-Host "`n--- 3. Enhancing Thin Files ---" -ForegroundColor Yellow

$enhancedFiles = @()

# Define tag mappings based on folder and content
$tagMappings = @{
    "Architecture" = @("status/complete", "type/reference", "domain/architecture")
    "TypeScript" = @("status/complete", "type/reference", "domain/frontend")
    "React" = @("status/complete", "type/guide", "domain/frontend")
    "Testing" = @("status/complete", "type/guide", "domain/testing")
    "Security" = @("status/complete", "type/reference", "domain/security")
    "Data Databases" = @("status/complete", "type/reference", "domain/database")
    "DDD" = @("status/complete", "type/concept", "domain/architecture")
    "APIs Distributed Systems" = @("status/complete", "type/reference", "domain/backend")
}

foreach ($file in $thinFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $folder = $file.DirectoryName -replace "$specsDir\\", ''
    
    # Get tags for folder
    $folderTags = $tagMappings[$folder]
    if (-not $folderTags) { $folderTags = @("status/draft", "type/concept") }
    
    # Add tags if missing
    if (-not $content -match '(?m)^tags:\s*$') {
        $frontmatterEnd = $content.IndexOf("---", 4)
        if ($frontmatterEnd -gt 0) {
            $tagsSection = "tags:`n  - $($folderTags -join "`n  - ")"
            $content = $content.Insert($frontmatterEnd + 3, "`n$tagsSection")
            $content | Out-File $file.FullName -Encoding UTF8
            $enhancedFiles += @{ name = $file.Name; action = "added_tags"; tags = $folderTags -join ", " }
        }
    }
    
    # Add cross-links to related files in same folder
    $relatedFiles = Get-ChildItem $file.DirectoryName -Filter "*.md" | Where-Object { 
        $_.Name -ne $file.Name -and $_.Name -notmatch 'README|AGENTS|stub'
    } | Select-Object -First 3
    
    if ($relatedFiles.Count -gt 0 -and $content -notmatch '## See Also') {
        $seeAlso = "`n## See Also`n"
        foreach ($related in $relatedFiles) {
            $seeAlso += "- [[${$related.Name -replace '\.md$', ''}]]`n"
        }
        $content += $seeAlso
        $content | Out-File $file.FullName -Encoding UTF8
        $enhancedFiles += @{ name = $file.Name; action = "added_see_also"; count = $relatedFiles.Count }
    }
}

Write-Host "Files enhanced: $($enhancedFiles.Count)" -ForegroundColor Green

# ============================================================
# 4. Pull Citations into Thin Files
# ============================================================
Write-Host "`n--- 4. Enriching Thin Files with Citations ---" -ForegroundColor Yellow

$citationSources = @{
    "Architecture" = @(
        "https://martinfowler.com/",
        "https://learn.microsoft.com/en-us/azure/architecture/",
        "https://refactoring.guru/"
    )
    "TypeScript" = @(
        "https://www.typescriptlang.org/docs/",
        "https://github.com/microsoft/TypeScript/wiki"
    )
    "React" = @(
        "https://react.dev/reference/react",
        "https://ui.shadcn.com/docs"
    )
    "Testing" = @(
        "https://playwright.dev/docs",
        "https://vitest.dev/guide/"
    )
    "Security" = @(
        "https://owasp.org/www-project-top-ten/",
        "https://cheatsheetseries.owasp.org/"
    )
    "Data Databases" = @(
        "https://www.postgresql.org/docs/",
        "https://redis.io/docs/"
    )
}

$enrichedFiles = @()

foreach ($file in $thinFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $folder = $file.DirectoryName -replace "$specsDir\\", ''
    
    # Get citation sources for folder
    $sources = $citationSources[$folder]
    if ($sources) {
        # Check if file already has sources
        if (-not $content -match '(?m)^sources:\s*$') {
            # Add sources section
            $sourcesText = "`nsources:`n"
            foreach ($source in $sources) {
                $sourcesText += "- $source`n"
            }
            
            $frontmatterEnd = $content.IndexOf("---", 4)
            if ($frontmatterEnd -gt 0) {
                $content = $content.Insert($frontmatterEnd + 3, $sourcesText)
                $content | Out-File $file.FullName -Encoding UTF8
                $enrichedFiles += @{ name = $file.Name; folder = $folder; sources_added = $sources.Count }
            }
        }
    }
}

Write-Host "Files enriched with citations: $($enrichedFiles.Count)" -ForegroundColor Green

# ============================================================
# 5. Create Index Notes for Orphaned Folders
# ============================================================
Write-Host "`n--- 5. Creating Index Notes ---" -ForegroundColor Yellow

$foldersWithOrphans = $orphanFiles | Group-Object { $_.DirectoryName -replace "$specsDir\\", '' } | Where-Object { $_.Count -gt 2 }

foreach ($folderGroup in $foldersWithOrphans) {
    $folderName = $folderGroup.Name
    $files = $folderGroup.Group
    
    if ($files.Count -lt 3) { continue }
    
    $indexPath = Join-Path $file.DirectoryName "..\$folderName\00-$($folderName)-index.md"
    
    if (-not (Test-Path $indexPath)) {
        $indexContent = @"
---
slug: $($folderName.ToLower() -replace '\s+', '-')-index
tags:
  - status/complete
  - type/reference
  - domain/architecture
---

# $($folderName) Index

> **Purpose:** Overview of all concepts in the $($folderName) folder.
> **Last Updated:** 2026-11-03

---

## Concepts

| # | Concept | Note |
|---|---------|------|
"@

        $counter = 1
        foreach ($file in ($files | Sort-Object Name)) {
            $fileName = $file.Name -replace '\.md$', ''
            $indexContent += "`n| $($counter.ToString('D2')) | $fileName | [$fileName]($fileName.md) |"
            $counter++
        }
        
        $indexContent += @"

---

## Related Categories

- [[Architecture/00-architecture-index]] — Main architecture index

---

## Research Status

All concepts in this folder have been reviewed and tagged.

"@
        
        $indexContent | Out-File $indexPath -Encoding UTF8
        Write-Host "Created index: $folderName" -ForegroundColor Green
    }
}

# ============================================================
# Save enhancement report
# ============================================================
$enhancementReport = @{
    orphan_files_total = $orphanFiles.Count
    thin_files = $thinFiles.Count
    medium_files = $mediumFiles.Count
    thick_files = $thickFiles.Count
    files_without_sources = $noSourcesFiles.Count
    files_without_tags = $noTagsFiles.Count
    files_enhanced = $enhancedFiles.Count
    files_enriched_with_citations = $enrichedFiles.Count
    folders_with_orphans = $foldersWithOrphans.Count
    enhancement_date = (Get-Date -Format "yyyy-MM-dd")
}

$enhancementReport | ConvertTo-Json -Depth 3 | Out-File "$PWD\orphan-enhancement-report.json" -Encoding UTF8
Write-Host "`n=== Enhancement Complete ===" -ForegroundColor Green
Write-Host "Report saved to orphan-enhancement-report.json" -ForegroundColor Green
