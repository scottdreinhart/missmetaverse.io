# Create Index Notes for Remaining Folders
# Creates 00-index.md for all folders that don't have one

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

Write-Host "`n=== CREATING INDEX NOTES ===" -ForegroundColor Cyan

$folders = Get-ChildItem $specsDir -Directory

foreach ($folder in $folders) {
    $indexPath = Join-Path $folder.FullName "00-index.md"
    
    if (Test-Path $indexPath) { continue }
    
    $files = Get-ChildItem $folder.FullName -Filter "*.md" | Where-Object {
        $_.Name -notmatch 'README|AGENTS|index|_template|stub'
    }
    
    if ($files.Count -lt 2) { continue }
    
    $folderName = $folder.Name
    $indexContent = "slug: $($folderName.ToLower() -replace '\s+', '-')-index`ntags:`n  - status/complete`n  - type/reference`n  - domain/architecture`n---`n`n# $($folderName) Index`n`n> **Purpose:** Overview of all concepts in this folder.`n> **Last Updated:** 2026-11-03`n`n---`n`n## Concepts`n`n| # | Concept | Note |`n|---|---------|------|`n"
    
    $counter = 1
    foreach ($file in ($files | Sort-Object Name)) {
        $fileName = $file.Name -replace '\.md$', ''
        $indexContent += "| $($counter.ToString('D2')) | $fileName | [$fileName]($fileName.md) |`n"
        $counter++
    }

    $indexContent += "`n---`n`n## Related`n`n- [[Architecture/00-architecture-index]]`n- [[Sources/README]]`n"

    $indexContent | Out-File $indexPath -Encoding UTF8
    Write-Host "Created: $folderName/00-index.md ($($files.Count) files)" -ForegroundColor Green
}

Write-Host "`n=== Complete ===" -ForegroundColor Green
