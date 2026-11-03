# Comprehensive Vault Optimization Script
# Analyzes structure, identifies merge opportunities, suggests new categories/tags

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

Write-Host "`n=== COMPREHENSIVE VAULT OPTIMIZATION AUDIT ===" -ForegroundColor Cyan

# ============================================================
# 1. Current Structure Analysis
# ============================================================
Write-Host "`n--- 1. Current Folder Structure ---" -ForegroundColor Yellow

$folders = Get-ChildItem $specsDir -Directory | Sort-Object Name
$folderStats = @()

foreach ($folder in $folders) {
    $files = Get-ChildItem $folder.FullName -Filter "*.md" -Recurse | Where-Object { 
        $_.Name -notmatch 'README|AGENTS' 
    }
    $totalLines = 0
    $totalSize = 0
    foreach ($f in $files) {
        $content = Get-Content $f.FullName -Raw -Encoding UTF8
        $totalLines += ($content -split "`n").Count
        $totalSize += $f.Length
    }
    
    $folderStats += @{
        name = $folder.Name
        files = $files.Count
        lines = $totalLines
        size_kb = [math]::Round($totalSize / 1KB, 2)
        avg_size_kb = [math]::Round(($totalSize / 1KB) / $files.Count, 2)
    }
}

Write-Host "Total folders: $($folders.Count)" -ForegroundColor White
Write-Host "Total files: $($folderStats | Measure-Object files -Sum).Sum" -ForegroundColor White

# Sort by file count
$folderStats | Sort-Object files -Descending | Select-Object name, files, lines, size_kb | ForEach-Object {
    Write-Host "  $($_.name): $($_.files) files, $($_.lines) lines, $($_.size_kb) KB" -ForegroundColor Gray
}

# ============================================================
# 2. Content Overlap Analysis
# ============================================================
Write-Host "`n--- 2. Content Overlap Analysis ---" -ForegroundColor Yellow

$overlapOpportunities = @()

# Check for folders with similar content themes
$themeGroups = @{
    "Architecture Patterns" = @("Architecture", "DDD", "Coding Type Systems")
    "Web Technologies" = @("Cascading Stylesheets", "TailwindsCSS", "Hypertext HTML", "Hypertext Markup")
    "Testing & Quality" = @("Testing", "Quality Delivery")
    "DevOps & Deployment" = @("Bundler", "Integration", "Frontend UI")
    "Data & Storage" = @("Data Databases", "Data-Driven Approaches")
    "Security" = @("Security")
    "APIs & Systems" = @("APIs Distributed Systems")
    "Package Management" = @("Package Manager")
    "Commit Management" = @("Commit Management")
    "React Ecosystem" = @("React", "ShadCN")
    "TypeScript" = @("TypeScript")
    "Sources" = @("Sources")
}

foreach ($theme in $themeGroups.Keys) {
    $foldersInTheme = $themeGroups[$theme]
    $totalFiles = 0
    foreach ($folderName in $foldersInTheme) {
        $folderPath = Join-Path $specsDir $folderName
        if (Test-Path $folderPath) {
            $files = Get-ChildItem $folderPath -Filter "*.md" -Recurse | Where-Object { 
                $_.Name -notmatch 'README|AGENTS' 
            }
            $totalFiles += $files.Count
        }
    }
    
    if ($foldersInTheme.Count -gt 1 -and $totalFiles -gt 10) {
        $overlapOpportunities += @{
            theme = $theme
            folders = $foldersInTheme -join ", "
            total_files = $totalFiles
            recommendation = "Consider consolidating or creating cross-reference index"
        }
    }
}

Write-Host "Content overlap themes found: $($overlapOpportunities.Count)" -ForegroundColor Cyan

# ============================================================
# 3. Merge Opportunities
# ============================================================
Write-Host "`n--- 3. Merge Opportunities ---" -ForegroundColor Yellow

$mergeOps = @()

# Find small files that could be merged
foreach ($folder in $folders) {
    $smallFiles = Get-ChildItem $folder.FullName -Filter "*.md" | Where-Object { 
        $_.Length -lt 2000 -and 
        $_.Name -notmatch 'README|AGENTS|index|_template|stub'
    }
    
    if ($smallFiles.Count -ge 3) {
        $mergeOps += @{
            type = "small_files"
            folder = $folder.Name
            count = $smallFiles.Count
            files = ($smallFiles | Select-Object -ExpandProperty Name) -join ", "
            recommendation = "Consider merging small files into parent topic"
        }
    }
}

# Find files with similar names across folders
$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse | Where-Object { 
    $_.Name -notmatch 'README|AGENTS|index|_template|stub' 
}

$similarPairs = @()
for ($i = 0; $i -lt $allFiles.Count; $i++) {
    for ($j = $i + 1; $j -lt $allFiles.Count; $j++) {
        $file1 = $allFiles[$i]
        $file2 = $allFiles[$j]
        
        $name1 = $file1.Name -replace '\.md$', ''
        $name2 = $file2.Name -replace '\.md$', ''
        
        # Check if names are very similar
        if ($name1 -like "$name2*" -or $name2 -like "$name1*" -or 
            ($name1 -replace '-.*$', '') -eq ($name2 -replace '-.*$', '')) {
            
            if ($file1.DirectoryName -ne $file2.DirectoryName) {
                $similarPairs += @{
                    file1 = "$($file1.DirectoryName -replace "$specsDir\\", '')/$($file1.Name)"
                    file2 = "$($file2.DirectoryName -replace "$specsDir\\", '')/$($file2.Name)"
                    recommendation = "Cross-folder duplicates - merge or differentiate"
                }
            }
        }
    }
}

Write-Host "Small file merge opportunities: $($mergeOps.Count)" -ForegroundColor Yellow
Write-Host "Cross-folder similar files: $($similarPairs.Count)" -ForegroundColor Yellow

# ============================================================
# 4. New Category Opportunities
# ============================================================
Write-Host "`n--- 4. New Category Opportunities ---" -ForegroundColor Yellow

$newCategories = @()

# Analyze file topics to suggest new categories
$topicAnalysis = @{}

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Extract key topics from content
    $topics = @()
    if ($content -match 'react|component|hook') { $topics += "React" }
    if ($content -match 'typescript|ts-') { $topics += "TypeScript" }
    if ($content -match 'css|tailwind|shadcn') { $topics += "Styling" }
    if ($content -match 'testing|vitest|playwright') { $topics += "Testing" }
    if ($content -match 'security|authentication|authorization') { $topics += "Security" }
    if ($content -match 'database|sql|nosql') { $topics += "Database" }
    if ($content -match 'api|rest|graphql') { $topics += "APIs" }
    if ($content -match 'devops|ci-cd|deployment') { $topics += "DevOps" }
    if ($content -match 'architecture|pattern|design') { $topics += "Architecture" }
    
    foreach ($topic in $topics) {
        if (-not $topicAnalysis.ContainsKey($topic)) {
            $topicAnalysis[$topic] = @()
        }
        $topicAnalysis[$topic] += "$($file.DirectoryName -replace "$specsDir\\", '')/$($file.Name)"
    }
}

# Suggest new categories for topics with scattered files
foreach ($topic in $topicAnalysis.Keys) {
    $files = $topicAnalysis[$topic]
    $folders = ($files | ForEach-Object { ($_ -split '/')[0] }) | Select-Object -Unique
    
    if ($folders.Count -gt 2 -and $files.Count -gt 5) {
        $newCategories += @{
            topic = $topic
            current_folders = $folders -join ", "
            file_count = $files.Count
            recommendation = "Create dedicated '$topic' folder and migrate files"
        }
    }
}

Write-Host "New category opportunities: $($newCategories.Count)" -ForegroundColor Cyan

# ============================================================
# 5. Tag Taxonomy Analysis
# ============================================================
Write-Host "`n--- 5. Tag Taxonomy Analysis ---" -ForegroundColor Yellow

$currentTags = @{}

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    if ($content -match '(?m)^tags:\s*$') {
        $tagMatches = [regex]::Matches($content, '(?m)^\s+-\s+(\S+)')
        foreach ($match in $tagMatches) {
            $tag = $match.Groups[1].Value
            if (-not $currentTags.ContainsKey($tag)) {
                $currentTags[$tag] = @()
            }
            $currentTags[$tag] += $file.Name
        }
    }
}

Write-Host "Total unique tags: $($currentTags.Count)" -ForegroundColor White

# Suggest tag improvements
$tagSuggestions = @()

# Group tags by theme
$tagThemes = @{
    "status" = @("draft", "complete", "review", "archived")
    "type" = @("concept", "pattern", "guide", "reference", "tutorial")
    "priority" = @("high", "medium", "low")
    "domain" = @("frontend", "backend", "devops", "database", "security")
}

foreach ($theme in $tagThemes.Keys) {
    $suggestedTags = $tagThemes[$theme]
    $existingTags = ($currentTags.Keys | Where-Object { $suggestedTags -contains $_ })
    
    if ($existingTags.Count -lt $suggestedTags.Count) {
        $missingTags = $suggestedTags | Where-Object { $_ -notin $existingTags }
        $tagSuggestions += @{
            theme = $theme
            existing = ($existingTags -join ", ")
            missing = ($missingTags -join ", ")
            recommendation = "Add missing tags: $($missingTags -join ", ")"
        }
    }
}

Write-Host "Tag taxonomy suggestions: $($tagSuggestions.Count)" -ForegroundColor Yellow

# ============================================================
# 6. Cross-Link Analysis
# ============================================================
Write-Host "`n--- 6. Cross-Link Analysis ---" -ForegroundColor Yellow

$crossLinks = @{}

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $links = [regex]::Matches($content, '\[\[([^\]|]+)')
    
    foreach ($link in $links) {
        $linkTarget = $link.Groups[1].Value
        
        # Check if link points to different folder
        if ($linkTarget -match '^\.\./|^\.\./\.\./') {
            $sourceFolder = $file.DirectoryName -replace "$specsDir\\", ''
            $targetFolder = "unknown"
            
            if (-not $crossLinks.ContainsKey($sourceFolder)) {
                $crossLinks[$sourceFolder] = @()
            }
            $crossLinks[$sourceFolder] += $linkTarget
        }
    }
}

Write-Host "Folders with cross-links: $($crossLinks.Count)" -ForegroundColor White

# ============================================================
# Save optimization report
# ============================================================
$optimizationReport = @{
    structure_analysis = @{
        total_folders = $folders.Count
        total_files = ($folderStats | Measure-Object files -Sum).Sum
        folder_details = $folderStats
    }
    content_overlap = $overlapOpportunities
    merge_opportunities = @{
        small_files = $mergeOps
        cross_folder_similar = $similarPairs
    }
    new_categories = $newCategories
    tag_taxonomy = @{
        current_tags = $currentTags.Count
        suggestions = $tagSuggestions
    }
    cross_links = $crossLinks
    audit_date = (Get-Date -Format "yyyy-MM-dd")
}

$optimizationReport | ConvertTo-Json -Depth 3 | Out-File "$PWD\vault-optimization-report.json" -Encoding UTF8
Write-Host "`n=== Optimization Audit Complete ===" -ForegroundColor Green
Write-Host "Report saved to vault-optimization-report.json" -ForegroundColor Green
