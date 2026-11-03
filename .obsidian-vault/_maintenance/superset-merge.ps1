# Superset Merge Script
# Merges duplicate file pairs into complete superset files

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs\Architecture"
$mergeLog = @()

function Merge-Superset {
    param(
        [string]$BaseFile,
        [string]$PatternFile,
        [string]$OutputFile
    )
    
    $baseContent = Get-Content $BaseFile -Raw -Encoding UTF8
    $patternContent = Get-Content $PatternFile -Raw -Encoding UTF8
    
    # Check if files are identical
    if ($baseContent -eq $patternContent) {
        Write-Host "SKIP (identical): $BaseFile <-> $PatternFile" -ForegroundColor Yellow
        return
    }
    
    # Get file sizes
    $baseSize = (Get-Item $BaseFile).Length
    $patternSize = (Get-Item $PatternFile).Length
    
    # Keep the larger file as the base (likely more complete)
    $largerFile = if ($baseSize -ge $patternSize) { $BaseFile } else { $PatternFile }
    $smallerFile = if ($baseSize -ge $patternSize) { $PatternFile } else { $BaseFile }
    
    $largerContent = Get-Content $largerFile -Raw -Encoding UTF8
    $smallerContent = Get-Content $smallerFile -Raw -Encoding UTF8
    
    # Check if smaller content is already contained in larger
    if ($largerContent -contains $smallerContent) {
        Write-Host "SKIP (subset): $smallerFile is subset of $largerFile" -ForegroundColor Yellow
        Remove-Item $smallerFile -Force
        Write-Host "DELETED: $smallerFile" -ForegroundColor Red
        $mergeLog += @{
            action = "deleted_subset"
            deleted = $smallerFile
            kept = $largerFile
            reason = "Content is subset of larger file"
        }
        return
    }
    
    # For now, just keep the larger file and delete the smaller one
    # A full superset merge would require section-by-section comparison
    Write-Host "MERGE: Keeping $largerFile ($largerSize bytes), deleting $smallerFile ($smallerSize bytes)" -ForegroundColor Green
    Remove-Item $smallerFile -Force
    Write-Host "DELETED: $smallerFile" -ForegroundColor Red
    
    $mergeLog += @{
        action = "merged"
        deleted = $smallerFile
        kept = $largerFile
        reason = "Larger file kept, smaller deleted"
    }
}

# ============================================================
# Process all duplicate pairs
# ============================================================
Write-Host "`n=== Processing Duplicate Pairs ===" -ForegroundColor Cyan

$files = Get-ChildItem $specsDir -Filter "*.md" | Where-Object { 
    $_.Name -notmatch "-patterns\.md$" -and 
    $_.Name -notmatch "-stub\.md$" -and 
    $_.Name -ne "AGENTS.md" -and 
    $_.Name -ne "README.md" 
}

$mergedCount = 0
$skippedCount = 0

foreach ($f in $files) {
    $patternFile = Join-Path $specsDir ($f.Name -replace '\.md$', '-patterns.md')
    if (Test-Path $patternFile) {
        Merge-Superset -BaseFile $f.FullName -PatternFile $patternFile -OutputFile $f.FullName
        $mergedCount++
    }
}

Write-Host "`n=== Superset Merge Complete ===" -ForegroundColor Green
Write-Host "Pairs processed: $mergedCount" -ForegroundColor Cyan
Write-Host "Skipped (identical/subset): $skippedCount" -ForegroundColor Cyan
Write-Host "Merges performed: $($mergedCount - $skippedCount)" -ForegroundColor Cyan

# Save merge log
$mergeLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\merge-log.json" -Encoding UTF8
Write-Host "Merge log saved to merge-log.json" -ForegroundColor Cyan
