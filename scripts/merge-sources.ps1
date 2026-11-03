# Merge Duplicate Source Files Script
# Merges the 4 identified duplicate source file pairs

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs\Sources"

Write-Host "`n=== MERGING DUPLICATE SOURCE FILES ===" -ForegroundColor Cyan

$mergeLog = @()

function Merge-Sources {
    param(
        [string]$File1,
        [string]$File2,
        [string]$MergedFile,
        [string]$Description
    )
    
    $file1Path = Join-Path $specsDir $File1
    $file2Path = Join-Path $specsDir $File2
    $mergedPath = Join-Path $specsDir $MergedFile
    
    Write-Host "`nMerging: $File1 + $File2 -> $MergedFile" -ForegroundColor Yellow
    
    if (-not (Test-Path $file1Path) -or -not (Test-Path $file2Path)) {
        Write-Host "  SKIP: One or both files not found" -ForegroundColor Red
        $mergeLog += @{ action = "skip"; file1 = $File1; file2 = $File2; reason = "File not found" }
        return
    }
    
    try {
        $content1 = Get-Content $file1Path -Raw -Encoding UTF8
        $content2 = Get-Content $file2Path -Raw -Encoding UTF8
        
        # Extract frontmatter from both files
        $fm1 = ""
        $body1 = $content1
        if ($content1 -match '(?s)^(---\s*\n.*?\n---\s*\n)') {
            $fm1 = $Matches[1]
            $body1 = $content1 -replace '(?s)^(---\s*\n.*?\n---\s*\n)', ''
        }
        
        $fm2 = ""
        $body2 = $content2
        if ($content2 -match '(?s)^(---\s*\n.*?\n---\s*\n)') {
            $fm2 = $Matches[1]
            $body2 = $content2 -replace '(?s)^(---\s*\n.*?\n---\s*\n)', ''
        }
        
        # Combine sources from frontmatter
        $sources1 = @()
        $sources2 = @()
        if ($fm1 -match '(?m)^sources:\s*$') {
            $sources1 = ([regex]::Matches($fm1, '(?m)^\s+-\s+(.+)$') | ForEach-Object { $_.Groups[1].Value })
        }
        if ($fm2 -match '(?m)^sources:\s*$') {
            $sources2 = ([regex]::Matches($fm2, '(?m)^\s+-\s+(.+)$') | ForEach-Object { $_.Groups[1].Value })
        }
        
        # Combine all sources
        $allSources = ($sources1 + $sources2) | Select-Object -Unique
        
        # Create merged frontmatter
        $mergedFM = @"
---
slug: $($MergedFile -replace '\.md$', '')
sources:
$(($allSources | ForEach-Object { "  - $_" }) -join "`n")
date: 2026-11-03
merged_from:
  - $File1
  - $File2
---

"@
        
        # Create merged content
        $mergedContent = @"
$mergedFM

# $($MergedFile -replace '\.md$', '')

> **Merged from:** $File1 and $File2
> **Description:** $Description

---

## Source 1: $($File1 -replace '\.md$', '')

$body1

---

## Source 2: $($File2 -replace '\.md$', '')

$body2

---

## Summary

This note combines content from multiple sources into a comprehensive reference.

"@
        
        $mergedContent | Out-File $mergedPath -Encoding UTF8
        Remove-Item $file1Path -Force
        Remove-Item $file2Path -Force
        
        Write-Host "  SUCCESS: Merged and deleted originals" -ForegroundColor Green
        $mergeLog += @{ action = "merged"; file1 = $File1; file2 = $File2; merged = $MergedFile }
    }
    catch {
        Write-Host "  FAILED: $($_.Exception.Message)" -ForegroundColor Red
        $mergeLog += @{ action = "failed"; file1 = $File1; file2 = $File2; error = $_.Exception.Message }
    }
}

# ============================================================
# Merge the 4 identified pairs
# ============================================================

Write-Host "`n--- Merge 1: AWS Services ---" -ForegroundColor Cyan
Merge-Sources -File1 "aws-api-gateway.md" -File2 "aws-elasticache.md" -MergedFile "aws-cloud-services.md" -Description "Combine AWS API Gateway and ElastiCache into comprehensive AWS services guide"

Write-Host "`n--- Merge 2: Martin Fowler Patterns ---" -ForegroundColor Cyan
Merge-Sources -File1 "fowler-ddd-2003.md" -File2 "fowler-patterns-2002.md" -MergedFile "martin-fowler-patterns.md" -Description "Combine Martin Fowler DDD and patterns into comprehensive patterns collection"

Write-Host "`n--- Merge 3: Robert Martin Collection ---" -ForegroundColor Cyan
Merge-Sources -File1 "martin-clean-architecture-2017.md" -File2 "martin-oop-2000.md" -MergedFile "robert-martin-collection.md" -Description "Combine Robert C. Martin clean architecture and OOP principles"

Write-Host "`n--- Merge 4: Add SRP to Robert Martin Collection ---" -ForegroundColor Cyan
Merge-Sources -File1 "martin-srp-2014.md" -File2 "robert-martin-collection.md" -MergedFile "robert-martin-collection.md" -Description "Add Single Responsibility Principle to existing Robert Martin collection"

# ============================================================
# Save merge log
# ============================================================
$mergeLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\source-merge-log.json" -Encoding UTF8

Write-Host "`n=== Merge Complete ===" -ForegroundColor Green
Write-Host "Total merges: $($mergeLog.Count)" -ForegroundColor Cyan
Write-Host "Log saved to source-merge-log.json" -ForegroundColor Green
