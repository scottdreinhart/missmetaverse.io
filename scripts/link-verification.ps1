# Link Verification Script
# Checks all wikilinks and reports broken links

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

Write-Host "`n=== LINK VERIFICATION ===" -ForegroundColor Cyan

$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse
$existingFiles = @{}

# Collect all existing file names
foreach ($file in $allFiles) {
    $fileName = $file.Name -replace '\.md$', ''
    $existingFiles[$fileName] = $file.FullName
}

$brokenLinks = @{}
$totalLinks = 0

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $links = [regex]::Matches($content, '\[\[([^\]|]+)')
    
    foreach ($link in $links) {
        $totalLinks++
        $linkTarget = $link.Groups[1].Value
        $targetName = $linkTarget -replace '\.md$', ''
        
        # Skip intentional broken links (external, parent folders, etc.)
        if ($linkTarget -match '^\.\./|^\.\./\.\./|https?://|Sources/|daily/|inbox/|decisions/|bugs/|retro/') {
            continue
        }
        
        if (-not $existingFiles.ContainsKey($targetName)) {
            if (-not $brokenLinks.ContainsKey($targetName)) {
                $brokenLinks[$targetName] = @()
            }
            $brokenLinks[$targetName] += $file.Name
        }
    }
}

Write-Host "Total links checked: $totalLinks" -ForegroundColor White
Write-Host "Broken links: $($brokenLinks.Count)" -ForegroundColor Red

# Display broken links
if ($brokenLinks.Count -gt 0) {
    Write-Host "`n=== Broken Links ===" -ForegroundColor Yellow
    $brokenLinks.GetEnumerator() | Sort-Object { $_.Value.Count } -Descending | Select-Object -First 20 | ForEach-Object {
        Write-Host "  $($_.Key) - referenced $($_.Value.Count) times" -ForegroundColor White
    }
}

# Save report
$report = @{
    total_links = $totalLinks
    broken_links = $brokenLinks.Count
    broken_link_details = $brokenLinks
    verification_date = (Get-Date -Format "yyyy-MM-dd")
}

$report | ConvertTo-Json -Depth 3 | Out-File "$PWD\link-verification-report.json" -Encoding UTF8
Write-Host "`nReport saved to link-verification-report.json" -ForegroundColor Green
