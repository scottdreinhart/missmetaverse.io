# Vault Inventory Script
# Generates comprehensive inventory of .obsidian-vault/specs/ files

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$maintenanceDir = "d:\Projects\missmetaverse.io\.obsidian-vault\_maintenance"

Write-Host "=== Vault Inventory Script ===" -ForegroundColor Cyan
Write-Host "Vault: $specsDir" -ForegroundColor Yellow
Write-Host ""

# 1. Inventory all .md files
Write-Host "[1/8] Inventorying files..." -ForegroundColor Green
$files = Get-ChildItem $specsDir -Filter "*.md" -Recurse | Where-Object { -not $_.Name.StartsWith('.') }
Write-Host "  Total .md files: $($files.Count)"

# 2. Calculate statistics
Write-Host "[2/8] Calculating statistics..." -ForegroundColor Green
$totalLines = 0
$totalSize = 0
$filesWithSlugs = 0
$filesWithSources = 0
$filesWithTags = 0
$filesWithDates = 0

foreach ($file in $files) {
    $totalSize += $file.Length
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ($content) {
        $lines = ($content -split "`n").Count
        $totalLines += $lines
        
        if ($content -match '^slug:\s*\S+' -or $content -match 'slug:\s*["'']') { $filesWithSlugs++ }
        if ($content -match '^sources:' -or $content -match 'sources:\s*\[') { $filesWithSources++ }
        if ($content -match '^tags:' -or $content -match 'tags:\s*\[') { $filesWithTags++ }
        if ($content -match '^date:' -or $content -match 'date:\s*\d{4}') { $filesWithDates++ }
    }
}

Write-Host "  Total lines: $totalLines"
Write-Host "  Total size: $([math]::Round($totalSize / 1KB, 2)) KB"
Write-Host "  Files with slugs: $filesWithSlugs"
Write-Host "  Files with sources: $filesWithSources"
Write-Host "  Files with tags: $filesWithTags"
Write-Host "  Files with dates: $filesWithDates"

# 3. Detect broken links
Write-Host "[3/8] Detecting broken links..." -ForegroundColor Green
$brokenLinks = @()
$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse | Where-Object { -not $_.Name.StartsWith('.') }

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ($content) {
        # Find wikilinks [[...]]
        $wikilinks = [regex]::Matches($content, '\[\[([^\]]+)\]\]')
        foreach ($match in $wikilinks) {
            $link = $match.Groups[1].Value
            # Extract path (before |)
            $path = $link -split '\|' | Select-Object -First 1
            # Remove fragment (#heading)
            $path = $path -split '#' | Select-Object -First 1
            # Remove block reference (^block-id)
            $path = $path -split '\^' | Select-Object -First 1
            
            if ($path -and $path -notmatch '^\^' -and $path -notmatch '^http') {
                # Check if file exists
                $targetPath = Join-Path $specsDir "$path.md"
                if (-not (Test-Path $targetPath)) {
                    $brokenLinks += "$($file.Name) -> $path"
                }
            }
        }
    }
}

Write-Host "  Broken wikilinks found: $($brokenLinks.Count)"
if ($brokenLinks.Count -le 20) {
    foreach ($bl in $brokenLinks) { Write-Host "    - $bl" -ForegroundColor Red }
}

# 4. Detect orphan files (no inbound links)
Write-Host "[4/8] Detecting orphan files..." -ForegroundColor Green
$allContent = @()
foreach ($f in $allFiles) {
    $c = Get-Content $f.FullName -Raw -ErrorAction SilentlyContinue
    if ($c) { $allContent += "$($f.Name)|$c" }
}

$orphanFiles = @()
foreach ($file in $allFiles) {
    $fileName = $file.Name -replace '\.md$', ''
    $hasInbound = $false
    
    foreach ($entry in $allContent) {
        $parts = $entry -split '\|', 2
        $sourceName = $parts[0]
        $sourceContent = $parts[1]
        
        if ($sourceName -ne $file.Name) {
            # Check if this file is referenced
            if ($sourceContent -match "\[\[$fileName\]\]" -or 
                $sourceContent -match "\[\[$fileName\|" -or
                $sourceContent -match "\[\[.*$fileName.*\]\]") {
                $hasInbound = $true
                break
            }
        }
    }
    
    if (-not $hasInbound) {
        $orphanFiles += $file.Name
    }
}

Write-Host "  Orphan files (no inbound links): $($orphanFiles.Count)"
if ($orphanFiles.Count -le 20) {
    foreach ($of in $orphanFiles) { Write-Host "    - $of" -ForegroundColor Yellow }
}

# 5. Detect duplicate slugs
Write-Host "[5/8] Detecting duplicate slugs..." -ForegroundColor Green
$slugMap = @{}
$duplicateSlugs = @()

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ($content) {
        $slugMatch = [regex]::Match($content, '^slug:\s*(.+)$', 'Multiline')
        if ($slugMatch.Success) {
            $slug = $slugMatch.Groups[1].Value.Trim()
            if ($slugMap.ContainsKey($slug)) {
                $existingFile = $slugMap[$slug]
                $duplicateSlugs += ("${slug}: " + $existingFile + " and " + $file.Name)
            } else {
                $slugMap[$slug] = $file.Name
            }
        }
    }
}

Write-Host "  Duplicate slugs: $($duplicateSlugs.Count)"
foreach ($ds in $duplicateSlugs) { Write-Host "    - $ds" -ForegroundColor Red }

# 6. Detect duplicate titles
Write-Host "[6/8] Detecting duplicate titles..." -ForegroundColor Green
$titleMap = @{}
$duplicateTitles = @()

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ($content) {
        # Check frontmatter title
        $titleMatch = [regex]::Match($content, '^title:\s*["'']?(.+?)["'']?$')
        if ($titleMatch.Success) {
            $title = $titleMatch.Groups[1].Value.Trim()
            if ($titleMap.ContainsKey($title)) {
                $existingFile = $titleMap[$title]
                $duplicateTitles += ("${title}: " + $existingFile + " and " + $file.Name)
            } else {
                $titleMap[$title] = $file.Name
            }
        } else {
            # Check first H1
            $h1Match = [regex]::Match($content, '^#\s+(.+)$', 'Multiline')
            if ($h1Match.Success) {
                $title = $h1Match.Groups[1].Value.Trim()
                if ($titleMap.ContainsKey($title)) {
                    $existingFile = $titleMap[$title]
                    $duplicateTitles += ("${title}: " + $existingFile + " and " + $file.Name)
                } else {
                    $titleMap[$title] = $file.Name
                }
            }
        }
    }
}

Write-Host "  Duplicate titles: $($duplicateTitles.Count)"
foreach ($dt in $duplicateTitles) { Write-Host "    - $dt" -ForegroundColor Red }

# 7. List folder structure
Write-Host "[7/8] Listing folder structure..." -ForegroundColor Green
$folders = Get-ChildItem $specsDir -Directory -Recurse | Where-Object { -not $_.Name.StartsWith('.') }
Write-Host "  Total folders: $($folders.Count)"
foreach ($folder in $folders) {
    $fileCount = (Get-ChildItem $folder.FullName -Filter "*.md" -Recurse | Where-Object { -not $_.Name.StartsWith('.') }).Count
    $folderName = $folder.FullName -replace "$specsDir\\", ""
    Write-Host "    $folderName/ ($fileCount files)"
}

# 8. Generate summary
Write-Host "[8/8] Generating summary..." -ForegroundColor Green
Write-Host ""
Write-Host "=== Summary ===" -ForegroundColor Cyan
Write-Host "Total .md files: $($files.Count)"
Write-Host "Total lines: $totalLines"
Write-Host "Total size: $([math]::Round($totalSize / 1KB, 2)) KB"
Write-Host "Files with slugs: $filesWithSlugs ($([math]::Round($filesWithSlugs / $files.Count * 100, 1))%)"
Write-Host "Files with sources: $filesWithSources"
Write-Host "Files with tags: $filesWithTags"
Write-Host "Broken wikilinks: $($brokenLinks.Count)"
Write-Host "Orphan files: $($orphanFiles.Count)"
Write-Host "Duplicate slugs: $($duplicateSlugs.Count)"
Write-Host "Duplicate titles: $($duplicateTitles.Count)"
Write-Host "Total folders: $($folders.Count)"

# Save summary to file
$summary = @"
# Vault Inventory Summary
**Generated**: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
**Vault**: $specsDir

## Statistics
- Total .md files: $($files.Count)
- Total lines: $totalLines
- Total size: $([math]::Round($totalSize / 1KB, 2)) KB
- Files with slugs: $filesWithSlugs ($([math]::Round($filesWithSlugs / $files.Count * 100, 1))%)
- Files with sources: $filesWithSources
- Files with tags: $filesWithTags
- Files with dates: $filesWithDates

## Issues
- Broken wikilinks: $($brokenLinks.Count)
- Orphan files: $($orphanFiles.Count)
- Duplicate slugs: $($duplicateSlugs.Count)
- Duplicate titles: $($duplicateTitles.Count)
- Total folders: $($folders.Count)

## Top Folders by File Count
"@

$folderCounts = $folders | ForEach-Object {
    $count = (Get-ChildItem $_.FullName -Filter "*.md" -Recurse | Where-Object { -not $_.Name.StartsWith('.') }).Count
    [PSCustomObject]@{ Folder = $_.FullName -replace "$specsDir\\", ""; Files = $count }
} | Sort-Object Files -Descending

$summary += $folderCounts | Format-Table -AutoSize | Out-String

$summaryPath = Join-Path $maintenanceDir "inventory-summary.md"
Set-Content $summaryPath $summary -Encoding UTF8
Write-Host ""
Write-Host "Summary saved to: $summaryPath" -ForegroundColor Green
