# Comprehensive Vault Audit Script
# Analyzes structure, content, links, and merge opportunities

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

Write-Host "`n=== COMPREHENSIVE VAULT AUDIT ===" -ForegroundColor Cyan

# ============================================================
# 1. Vault Structure Analysis
# ============================================================
Write-Host "`n--- 1. Vault Structure ---" -ForegroundColor Yellow

$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse
$totalFiles = $allFiles.Count
$totalFolders = (Get-ChildItem $specsDir -Directory -Recurse).Count
$totalLines = 0
$totalSize = 0

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $lines = ($content -split "`n").Count
    $totalLines += $lines
    $totalSize += $file.Length
}

Write-Host "Total files: $totalFiles" -ForegroundColor White
Write-Host "Total folders: $totalFolders" -ForegroundColor White
Write-Host "Total lines: $totalLines" -ForegroundColor White
Write-Host "Total size: $([math]::Round($totalSize / 1KB, 2)) KB" -ForegroundColor White

# ============================================================
# 2. Content Analysis
# ============================================================
Write-Host "`n--- 2. Content Analysis ---" -ForegroundColor Yellow

$filesWithSources = 0
$filesWithTags = 0
$filesWithSlugs = 0
$stubFiles = 0
$templateFiles = 0
$readmeFiles = 0

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    if ($content -match '(?m)^sources:\s*$') { $filesWithSources++ }
    if ($content -match '(?m)^tags:\s*$') { $filesWithTags++ }
    if ($content -match '(?m)^slug:\s*') { $filesWithSlugs++ }
    if ($file.Name -match '-stub\.md$') { $stubFiles++ }
    if ($file.Name -match 'template|_template') { $templateFiles++ }
    if ($file.Name -match 'README') { $readmeFiles++ }
}

Write-Host "Files with sources: $filesWithSources ($([math]::Round($filesWithSources/$totalFiles*100,1))%)" -ForegroundColor White
Write-Host "Files with tags: $filesWithTags ($([math]::Round($filesWithTags/$totalFiles*100,1))%)" -ForegroundColor White
Write-Host "Files with slugs: $filesWithSlugs ($([math]::Round($filesWithSlugs/$totalFiles*100,1))%)" -ForegroundColor White
Write-Host "Stub files: $stubFiles" -ForegroundColor White
Write-Host "Template files: $templateFiles" -ForegroundColor White
Write-Host "README files: $readmeFiles" -ForegroundColor White

# ============================================================
# 3. Link Analysis
# ============================================================
Write-Host "`n--- 3. Link Analysis ---" -ForegroundColor Yellow

$allLinks = @{}
$brokenLinks = @{}
$intentionalBroken = @()

# Collect all existing file names (without .md)
$existingFiles = @{}
foreach ($file in $allFiles) {
    $fileName = $file.Name -replace '\.md$', ''
    $existingFiles[$fileName] = $file.FullName
}

# Find all wikilinks
foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $links = [regex]::Matches($content, '\[\[([^\]|]+)(?:\|[^]]+)?\]\]')
    
    foreach ($link in $links) {
        $linkTarget = $link.Groups[1].Value
        
        if (-not $allLinks.ContainsKey($linkTarget)) {
            $allLinks[$linkTarget] = @()
        }
        $allLinks[$linkTarget] += $file.Name
        
        # Check if target exists
        $targetName = $linkTarget -replace '\.md$', ''
        if (-not $existingFiles.ContainsKey($targetName)) {
            # Check if it's intentional (external references)
            if ($linkTarget -notmatch '^\.\./|^\.\./\.\./|Sources/|daily/|inbox/|decisions/|bugs/|retro/|https?://') {
                if (-not $brokenLinks.ContainsKey($targetName)) {
                    $brokenLinks[$targetName] = @()
                }
                $brokenLinks[$targetName] += $file.Name
            }
            else {
                $intentionalBroken += "$($file.Name) -> $linkTarget"
            }
        }
    }
}

Write-Host "Total unique links: $($allLinks.Count)" -ForegroundColor White
Write-Host "Broken links: $($brokenLinks.Count)" -ForegroundColor Red
Write-Host "Intentional broken links: $($intentionalBroken.Count)" -ForegroundColor Yellow

# ============================================================
# 4. Duplicate Content Detection
# ============================================================
Write-Host "`n--- 4. Duplicate Content Detection ---" -ForegroundColor Yellow

# Group files by folder
$folderGroups = $allFiles | Group-Object DirectoryName | Sort-Object Count -Descending

$duplicatePairs = @()

foreach ($folder in $folderGroups | Select-Object -First 10) {
    $filesInFolder = Get-ChildItem $folder.Name -Filter "*.md" | Where-Object { 
        $_.Name -notmatch 'README|AGENTS|index' 
    }
    
    # Check for files with similar names
    for ($i = 0; $i -lt $filesInFolder.Count; $i++) {
        for ($j = $i + 1; $j -lt $filesInFolder.Count; $j++) {
            $file1 = $filesInFolder[$i]
            $file2 = $filesInFolder[$j]
            
            # Check if names are similar (one is prefix of other, or differ by suffix)
            $name1 = $file1.Name -replace '\.md$', ''
            $name2 = $file2.Name -replace '\.md$', ''
            
            if ($name1 -like "$name2*" -or $name2 -like "$name1*" -or 
                ($name1 -replace '-.*$', '') -eq ($name2 -replace '-.*$', '')) {
                $duplicatePairs += "$($file1.Name) <-> $($file2.Name) in $($folder.Name -replace "$specsDir\\", '')"
            }
        }
    }
}

Write-Host "Potential duplicate pairs: $($duplicatePairs.Count)" -ForegroundColor Yellow
if ($duplicatePairs.Count -gt 0) {
    foreach ($pair in $duplicatePairs | Select-Object -First 10) {
        Write-Host "  $pair" -ForegroundColor Gray
    }
}

# ============================================================
# 5. Orphan File Detection
# ============================================================
Write-Host "`n--- 5. Orphan File Detection ---" -ForegroundColor Yellow

$orphanFiles = @()
$linkedFiles = @{}

# Collect all linked files
foreach ($linkTarget in $allLinks.Keys) {
    $targetName = $linkTarget -replace '\.md$', ''
    $linkedFiles[$targetName] = $true
}

# Find files with no inbound links
foreach ($file in $allFiles) {
    if ($file.Name -match 'README|AGENTS|index|_template') { continue }
    
    $fileName = $file.Name -replace '\.md$', ''
    if (-not $linkedFiles.ContainsKey($fileName)) {
        $orphanFiles += $file
    }
}

Write-Host "Orphan files: $($orphanFiles.Count)" -ForegroundColor Yellow

# ============================================================
# 6. Folder Content Analysis
# ============================================================
Write-Host "`n--- 6. Folder Content Analysis ---" -ForegroundColor Yellow

$folderStats = @()
foreach ($folder in (Get-ChildItem $specsDir -Directory)) {
    $folderFiles = Get-ChildItem $folder.FullName -Filter "*.md" -Recurse | Where-Object { 
        $_.Name -notmatch 'README|AGENTS' 
    }
    $folderContent = @{
        folder = $folder.Name
        files = $folderFiles.Count
        size = [math]::Round(($folderFiles | Measure-Object Length -Sum).Sum / 1KB, 2)
    }
    $folderStats += $folderContent
}

$folderStats | Sort-Object files -Descending | Select-Object -First 10 | ForEach-Object {
    Write-Host "  $($_.folder): $($_.files) files, $($_.size) KB" -ForegroundColor Gray
}

# ============================================================
# Save audit report
# ============================================================
$auditReport = @{
    vault_structure = @{
        total_files = $totalFiles
        total_folders = $totalFolders
        total_lines = $totalLines
        total_size_kb = [math]::Round($totalSize / 1KB, 2)
    }
    content_analysis = @{
        files_with_sources = $filesWithSources
        files_with_tags = $filesWithTags
        files_with_slugs = $filesWithSlugs
        stub_files = $stubFiles
        template_files = $templateFiles
        readme_files = $readmeFiles
    }
    link_analysis = @{
        total_unique_links = $allLinks.Count
        broken_links = $brokenLinks.Count
        intentional_broken_links = $intentionalBroken.Count
    }
    duplicate_pairs = $duplicatePairs
    orphan_files_count = $orphanFiles.Count
    folder_stats = $folderStats
    audit_date = (Get-Date -Format "yyyy-MM-dd")
}

$auditReport | ConvertTo-Json -Depth 3 | Out-File "$PWD\comprehensive-vault-audit.json" -Encoding UTF8
Write-Host "`n=== Audit Complete ===" -ForegroundColor Green
Write-Host "Report saved to comprehensive-vault-audit.json" -ForegroundColor Green
