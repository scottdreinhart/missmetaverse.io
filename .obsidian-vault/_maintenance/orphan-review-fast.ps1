# Fast Orphan File Review Script
# Uses grep to find files with inbound links

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse
$linkedFiles = @{}

Write-Host "`n=== Scanning for Inbound Links ===" -ForegroundColor Cyan

# Collect all wikilinks from all files
foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $links = [regex]::Matches($content, '\[\[([^\]|]+)')
    foreach ($link in $links) {
        $linkName = $link.Groups[1].Value -replace '\.md$', ''
        $linkedFiles[$linkName] = $true
    }
}

Write-Host "Total unique links found: $($linkedFiles.Count)" -ForegroundColor Cyan

$orphanFiles = @()
$intentionalOrphans = @()
$needsReview = @()

foreach ($file in $allFiles) {
    # Skip maintenance, README, and index files
    if ($file.DirectoryName -match '_maintenance|templates') { continue }
    if ($file.Name -match 'README|AGENTS|index|README') { continue }
    
    $fileName = $file.Name -replace '\.md$', ''
    
    if (-not $linkedFiles.ContainsKey($fileName)) {
        $orphanFiles += $file
        
        # Categorize
        if ($file.Name -match 'stub|README|template|index|AGENTS|Research-Status|Project-Architecture-Mapping|Copilot-Consumption-Guide') {
            $intentionalOrphans += $file
        }
        else {
            $needsReview += $file
        }
    }
}

Write-Host "`nTotal orphan files: $($orphanFiles.Count)" -ForegroundColor Cyan
Write-Host "Intentional orphans: $($intentionalOrphans.Count)" -ForegroundColor Green
Write-Host "Need review: $($needsReview.Count)" -ForegroundColor Yellow

# Save report
$report = @{
    total_orphans = $orphanFiles.Count
    intentional_orphans = $intentionalOrphans.Count
    needs_review_count = $needsReview.Count
    intentional_names = $intentionalOrphans | ForEach-Object { $_.Name }
    review_needed_names = $needsReview | ForEach-Object { $_.Name }
    review_date = (Get-Date -Format "yyyy-MM-dd")
}

$report | ConvertTo-Json -Depth 3 | Out-File "$PWD\orphan-review.json" -Encoding UTF8
Write-Host "`nOrphan review saved to orphan-review.json" -ForegroundColor Green

# Display files needing review
if ($needsReview.Count -gt 0) {
    Write-Host "`n=== Files Needing Review ===" -ForegroundColor Yellow
    foreach ($file in $needsReview) {
        $folder = $file.DirectoryName -replace "$specsDir\\", ''
        Write-Host "  $folder/$($file.Name)" -ForegroundColor White
    }
}
