# Vault Optimization Implementation Script
# Executes the optimization plan: merge files, restructure folders, add tags

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$implementationLog = @()

function Log-Action {
    param(
        [string]$Action,
        [string]$Details,
        [string]$Status
    )
    
    $implementationLog += @{
        action = $Action
        details = $Details
        status = $Status
        timestamp = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    }
    
    $color = if ($Status -eq "Success") { "Green" } elseif ($Status -eq "Skipped") { "Yellow" } else { "Red" }
    Write-Host "[$Status] $Action - $Details" -ForegroundColor $color
}

# ============================================================
# PHASE 1: Merge Cross-Folder Duplicate Pairs
# ============================================================
Write-Host "`n=== PHASE 1: Merging Duplicate Pairs ===" -ForegroundColor Cyan

$mergePairs = @(
    @{
        file1 = "Sources/aws-api-gateway.md"
        file2 = "Sources/aws-elasticache.md"
        merged = "Sources/aws-cloud-services.md"
        strategy = "Combine into comprehensive AWS services guide"
    },
    @{
        file1 = "Sources/fowler-ddd-2003.md"
        file2 = "Sources/fowler-patterns-2002.md"
        merged = "Sources/martin-fowler-patterns.md"
        strategy = "Combine into Martin Fowler patterns collection"
    },
    @{
        file1 = "Sources/martin-clean-architecture-2017.md"
        file2 = "Sources/martin-oop-2000.md"
        merged = "Sources/robert-martin-collection.md"
        strategy = "Combine into Robert C. Martin collection"
    },
    @{
        file1 = "Sources/martin-srp-2014.md"
        file2 = "Sources/robert-martin-collection.md"
        merged = "Sources/robert-martin-collection.md"
        strategy = "Add SRP to existing collection"
    }
)

foreach ($pair in $mergePairs) {
    $file1Path = Join-Path $specsDir $pair.file1
    $file2Path = Join-Path $specsDir $pair.file2
    $mergedPath = Join-Path $specsDir $pair.merged
    
    if (Test-Path $file1Path -and Test-Path $file2Path) {
        try {
            $content1 = Get-Content $file1Path -Raw -Encoding UTF8
            $content2 = Get-Content $file2Path -Raw -Encoding UTF8
            
            # Create merged content
            $mergedContent = @"
---
slug: $($pair.merged -replace '\.md$', '')
sources:
  - combined
date: 2026-11-03
---

# $($pair.merged -replace '\.md$', '')

> **Combined from:** $($pair.file1) and $($pair.file2)
> **Strategy:** $($pair.strategy)

---

## Source 1: $($pair.file1 -replace 'Sources/', '')

$content1

---

## Source 2: $($pair.file2 -replace 'Sources/', '')

$content2

---

## Summary

This note combines content from multiple sources into a comprehensive reference.

## See Also

- [[Architecture/clean-architecture]]
- [[DDD/README]]
"@
            
            $mergedContent | Out-File $mergedPath -Encoding UTF8
            Remove-Item $file1Path -Force
            Remove-Item $file2Path -Force
            
            Log-Action "Merge" "$($pair.file1) + $($pair.file2) -> $($pair.merged)" "Success"
        }
        catch {
            Log-Action "Merge" "$($pair.file1) + $($pair.file2)" "Failed: $($_.Exception.Message)"
        }
    }
    else {
        Log-Action "Merge" "$($pair.file1) + $($pair.file2)" "Skipped: File not found"
    }
}

# ============================================================
# PHASE 2: Create New Parent Folders
# ============================================================
Write-Host "`n=== PHASE 2: Creating Parent Folders ===" -ForegroundColor Cyan

$parentFolders = @(
    @{
        name = "Web Frontend"
        children = @("Cascading Stylesheets", "TailwindsCSS", "ShadCN", "Hypertext HTML", "Hypertext Markup")
    },
    @{
        name = "Quality & Testing"
        children = @("Testing", "Quality Delivery")
    },
    @{
        name = "DevOps & Deployment"
        children = @("Bundler", "Integration", "Frontend UI")
    },
    @{
        name = "React UI"
        children = @("React", "ShadCN")
    }
)

foreach ($parent in $parentFolders) {
    $parentPath = Join-Path $specsDir $parent.name
    
    try {
        New-Item -ItemType Directory -Path $parentPath -Force | Out-Null
        Log-Action "Create Folder" $parent.name "Success"
        
        foreach ($child in $parent.children) {
            $childPath = Join-Path $specsDir $child
            $newChildPath = Join-Path $parentPath $child
            
            if (Test-Path $childPath) {
                try {
                    Move-Item $childPath $newChildPath -Force
                    Log-Action "Move Folder" "$child -> $parent.name/$child" "Success"
                }
                catch {
                    Log-Action "Move Folder" "$child -> $parent.name/$child" "Failed: $($_.Exception.Message)"
                }
            }
        }
    }
    catch {
        Log-Action "Create Folder" $parent.name "Failed: $($_.Exception.Message)"
    }
}

# ============================================================
# PHASE 3: Add Standardized Tags
# ============================================================
Write-Host "`n=== PHASE 3: Adding Standardized Tags ===" -ForegroundColor Cyan

$tagAdditions = @(
    @{
        pattern = "Architecture/*"
        tags = @("status/complete", "type/reference", "domain/architecture")
    },
    @{
        pattern = "TypeScript/*"
        tags = @("status/complete", "type/reference", "domain/frontend")
    },
    @{
        pattern = "React/*"
        tags = @("status/complete", "type/guide", "domain/frontend")
    },
    @{
        pattern = "Testing/*"
        tags = @("status/complete", "type/guide", "domain/testing")
    },
    @{
        pattern = "Security/*"
        tags = @("status/complete", "type/reference", "domain/security")
    },
    @{
        pattern = "Data Databases/*"
        tags = @("status/complete", "type/reference", "domain/database")
    }
)

foreach ($tagGroup in $tagAdditions) {
    $files = Get-ChildItem (Join-Path $specsDir "*") -Filter "*.md" -Recurse | Where-Object {
        $_.FullName -match $tagGroup.pattern -and
        $_.Name -notmatch 'README|AGENTS'
    }
    
    foreach ($file in $files) {
        try {
            $content = Get-Content $file.FullName -Raw -Encoding UTF8
            
            # Check if file already has tags
            if ($content -match '(?m)^tags:\s*$') {
                # Add new tags to existing tags section
                $newTags = ($tagGroup.tags | Where-Object { $_ -notin $content }) -join "`n  - "
                if ($newTags) {
                    $content = $content -replace '(?m)(^tags:\s*$)', "`$1`n  - $newTags"
                    $content | Out-File $file.FullName -Encoding UTF8
                    Log-Action "Add Tags" "$($file.Name): $($tagGroup.tags -join ', ')" "Success"
                }
            }
            else {
                # Add new tags section after frontmatter
                $content = $content -replace '(?m)^(---\s*$)', "`$1`ntags:`n  - $($tagGroup.tags -join "`n  - ")`n---"
                $content | Out-File $file.FullName -Encoding UTF8
                Log-Action "Add Tags Section" "$($file.Name)" "Success"
            }
        }
        catch {
            Log-Action "Add Tags" "$($file.Name)" "Failed: $($_.Exception.Message)"
        }
    }
}

# ============================================================
# Save implementation log
# ============================================================
$implementationLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\implementation-log.json" -Encoding UTF8

Write-Host "`n=== Implementation Complete ===" -ForegroundColor Green
Write-Host "Total actions: $($implementationLog.Count)" -ForegroundColor Cyan
Write-Host "Log saved to implementation-log.json" -ForegroundColor Green
