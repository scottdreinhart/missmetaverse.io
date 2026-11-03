# Missing Notes Backlog Script
# Identifies all broken wikilinks and creates a backlog

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse
$allFileNames = @{}

# Collect all existing file names
foreach ($file in $allFiles) {
    $fileName = $file.Name -replace '\.md$', ''
    $allFileNames[$fileName] = $file.FullName
}

$brokenLinks = @{}

# Find all broken wikilinks
foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $links = [regex]::Matches($content, '\[\[([^\]|]+)(?:\|[^]]+)?\]\]')
    
    foreach ($link in $links) {
        $linkTarget = $link.Groups[1].Value -replace '\.md$', ''
        
        # Check if target exists
        if (-not $allFileNames.ContainsKey($linkTarget)) {
            # Skip intentional references (to files outside specs folder)
            if ($linkTarget -match '^\.\./|^\.\./\.\./|Sources/|daily/|inbox/|decisions/|bugs/|retro/') {
                continue
            }
            
            if (-not $brokenLinks.ContainsKey($linkTarget)) {
                $brokenLinks[$linkTarget] = @{
                    referenced_from = @()
                    context = @()
                }
            }
            
            $brokenLinks[$linkTarget].referenced_from += $file.Name -replace '\.md$', ''
            
            # Get context (line containing the link)
            $lines = $content -split "`n"
            for ($i = 0; $i -lt $lines.Count; $i++) {
                if ($lines[$i] -match [regex]::Escape($link.Groups[1].Value)) {
                    $brokenLinks[$linkTarget].context += "Line $($i+1): $($lines[$i].Trim())"
                    if ($brokenLinks[$linkTarget].context.Count -ge 3) { break }
                    break
                }
            }
        }
    }
}

Write-Host "`n=== Missing Notes Backlog ===" -ForegroundColor Cyan
Write-Host "Total missing notes: $($brokenLinks.Count)" -ForegroundColor Cyan

# Save backlog
$backlog = @{
    total_missing = $brokenLinks.Count
    missing_notes = @{}
}

foreach ($note in $brokenLinks.Keys) {
    $backlog.missing_notes[$note] = @{
        referenced_from_count = $brokenLinks[$note].referenced_from.Count
        referenced_from = $brokenLinks[$note].referenced_from | Select-Object -First 5
        context = $brokenLinks[$note].context | Select-Object -First 3
    }
}

$backlog | ConvertTo-Json -Depth 3 | Out-File "$PWD\missing-notes-backlog.json" -Encoding UTF8
Write-Host "Backlog saved to missing-notes-backlog.json" -ForegroundColor Green

# Display top 20 most referenced missing notes
Write-Host "`n=== Top 20 Most Referenced Missing Notes ===" -ForegroundColor Yellow
$topMissing = $brokenLinks.GetEnumerator() | Sort-Object { $_.Value.referenced_from.Count } -Descending | Select-Object -First 20
foreach ($note in $topMissing) {
    Write-Host "  $($_.Key) (referenced $($note.Value.referenced_from.Count) times)" -ForegroundColor White
}
