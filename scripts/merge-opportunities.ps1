# Merge Opportunities Analysis Script
# Identifies files that should be merged based on content similarity

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$mergeOpportunities = @()

Write-Host "`n=== MERGE OPPORTUNITIES ANALYSIS ===" -ForegroundColor Cyan

# ============================================================
# 1. Find files with similar names in same folder
# ============================================================
Write-Host "`n--- 1. Similar Name Files ---" -ForegroundColor Yellow

$folders = Get-ChildItem $specsDir -Directory
foreach ($folder in $folders) {
    $files = Get-ChildItem $folder.FullName -Filter "*.md" | Where-Object { 
        $_.Name -notmatch 'README|AGENTS|index|_template|stub' 
    }
    
    if ($files.Count -lt 2) { continue }
    
    # Check for files with similar base names
    for ($i = 0; $i -lt $files.Count; $i++) {
        for ($j = $i + 1; $j -lt $files.Count; $j++) {
            $file1 = $files[$i]
            $file2 = $files[$j]
            
            $name1 = $file1.Name -replace '\.md$', ''
            $name2 = $file2.Name -replace '\.md$', ''
            
            # Check if one is prefix of other (e.g., "api-gateway" and "api-gateway-patterns")
            $base1 = $name1 -replace '-.*$', ''
            $base2 = $name2 -replace '-.*$', ''
            
            if ($base1 -eq $base2 -and $name1 -ne $name2) {
                $size1 = $file1.Length
                $size2 = $file2.Length
                $larger = if ($size1 -ge $size2) { $file1 } else { $file2 }
                $smaller = if ($size1 -ge $size2) { $file2 } else { $file1 }
                
                $mergeOpportunities += @{
                    type = "similar_name"
                    file1 = $file1.Name
                    file2 = $file2.Name
                    folder = $folder.Name
                    larger_file = $larger.Name
                    smaller_file = $smaller.Name
                    larger_size = $size1
                    smaller_size = $size2
                    recommendation = "Merge smaller into larger"
                }
            }
        }
    }
}

Write-Host "Similar name pairs found: $($mergeOpportunities.Count)" -ForegroundColor Cyan

# ============================================================
# 2. Analyze content overlap
# ============================================================
Write-Host "`n--- 2. Content Overlap Analysis ---" -ForegroundColor Yellow

$contentOverlap = @()
$sampleFiles = $mergeOpportunities | Where-Object { $_.type -eq "similar_name" } | Select-Object -First 20

foreach ($opportunity in $sampleFiles) {
    $file1Path = Join-Path $specsDir ($opportunity.folder + "/" + $opportunity.file1)
    $file2Path = Join-Path $specsDir ($opportunity.folder + "/" + $opportunity.file2)
    
    if (Test-Path $file1Path -and Test-Path $file2Path) {
        $content1 = Get-Content $file1Path -Raw -Encoding UTF8
        $content2 = Get-Content $file2Path -Raw -Encoding UTF8
        
        # Calculate similarity (simple word overlap)
        $words1 = ($content1 -split '\s+') | Where-Object { $_.Length -gt 3 } | Sort-Object -Unique
        $words2 = ($content2 -split '\s+') | Where-Object { $_.Length -gt 3 } | Sort-Object -Unique
        
        $overlap = 0
        foreach ($word in $words1) {
            if ($words2 -contains $word) { $overlap++ }
        }
        
        $similarity = [math]::Round($overlap / ($words1.Count + $words2.Count - $overlap) * 100, 1)
        
        if ($similarity -gt 60) {
            $contentOverlap += @{
                file1 = $opportunity.file1
                file2 = $opportunity.file2
                folder = $opportunity.folder
                similarity = "$similarity%"
                recommendation = "High overlap - consider merging"
            }
        }
    }
}

Write-Host "High similarity pairs (>60%): $($contentOverlap.Count)" -ForegroundColor Yellow

# ============================================================
# 3. Identify files that could be consolidated
# ============================================================
Write-Host "`n--- 3. Consolidation Opportunities ---" -ForegroundColor Yellow

$consolidation = @()

# Check for small files that could be merged
foreach ($folder in $folders) {
    $smallFiles = Get-ChildItem $folder.FullName -Filter "*.md" | Where-Object { 
        $_.Length -lt 1000 -and 
        $_.Name -notmatch 'README|AGENTS|index|_template|stub'
    }
    
    if ($smallFiles.Count -gt 3) {
        $consolidation += @{
            folder = $folder.Name
            small_files_count = $smallFiles.Count
            total_size = ($smallFiles | Measure-Object Length -Sum).Sum
            recommendation = "Consider consolidating $($smallFiles.Count) small files"
        }
    }
}

Write-Host "Consolidation opportunities: $($consolidation.Count)" -ForegroundColor Cyan

# ============================================================
# Save merge opportunities report
# ============================================================
$mergeReport = @{
    similar_name_pairs = $mergeOpportunities.Count
    high_similarity_pairs = $contentOverlap.Count
    consolidation_opportunities = $consolidation.Count
    merge_opportunities = $mergeOpportunities
    content_overlap = $contentOverlap
    consolidation = $consolidation
    audit_date = (Get-Date -Format "yyyy-MM-dd")
}

$mergeReport | ConvertTo-Json -Depth 3 | Out-File "$PWD\merge-opportunities.json" -Encoding UTF8
Write-Host "`n=== Merge Analysis Complete ===" -ForegroundColor Green
Write-Host "Report saved to merge-opportunities.json" -ForegroundColor Green

# Display top merge opportunities
Write-Host "`n=== Top Merge Opportunities ===" -ForegroundColor Yellow
$mergeOpportunities | Select-Object -First 10 | ForEach-Object {
    Write-Host "  $($_.folder)/$($_.file1) <-> $($_.folder)/$($_.file2)" -ForegroundColor White
    Write-Host "    Recommendation: $($_.recommendation)" -ForegroundColor Gray
}
