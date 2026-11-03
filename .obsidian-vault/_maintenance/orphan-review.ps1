# Orphan File Review Script
# Identifies files with no inbound links and categorizes them

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse
$orphanFiles = @()

Write-Host "`n=== Scanning for Orphan Files ===" -ForegroundColor Cyan

foreach ($file in $allFiles) {
    # Skip maintenance, README, and index files
    if ($file.DirectoryName -match '_maintenance|templates') { continue }
    if ($file.Name -match 'README|AGENTS|index|README') { continue }
    
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Check if any other file links to this file
    $fileName = $file.Name -replace '\.md$', ''
    $hasInboundLink = $false
    
    foreach ($otherFile in $allFiles) {
        if ($otherFile.FullName -eq $file.FullName) { continue }
        
        $otherContent = Get-Content $otherFile.FullName -Raw -Encoding UTF8
        if ($otherContent -match "\[\[.*$fileName.*\]\]") {
            $hasInboundLink = $true
            break
        }
    }
    
    if (-not $hasInboundLink) {
        $orphanFiles += @{
            path = $file.FullName -replace "$specsDir\\", ''
            name = $file.Name
            size = $file.Length
            folder = $file.DirectoryName -replace "$specsDir\\", ''
        }
    }
}

Write-Host "Total orphan files found: $($orphanFiles.Count)" -ForegroundColor Cyan

# Categorize orphans
$intentionalOrphans = @()
$needsReview = @()

foreach ($orphan in $orphanFiles) {
    # Intentional orphans: stubs, READMEs, templates, indexes, requirements
    if ($orphan.name -match 'stub|README|template|index|AGENTS|Research-Status|Project-Architecture-Mapping|Copilot-Consumption-Guide') {
        $intentionalOrphans += $orphan
    }
    else {
        $needsReview += $orphan
    }
}

Write-Host "Intentional orphans: $($intentionalOrphans.Count)" -ForegroundColor Green
Write-Host "Need review: $($needsReview.Count)" -ForegroundColor Yellow

# Save report
$report = @{
    total_orphans = $orphanFiles.Count
    intentional_orphans = $intentionalOrphans.Count
    needs_review_count = $needsReview.Count
    intentional = $intentionalOrphans
    review_needed = $needsReview
    review_date = (Get-Date -Format "yyyy-MM-dd")
}

$report | ConvertTo-Json -Depth 3 | Out-File "$PWD\orphan-review.json" -Encoding UTF8
Write-Host "`nOrphan review saved to orphan-review.json" -ForegroundColor Green

# Display files needing review
if ($needsReview.Count -gt 0) {
    Write-Host "`n=== Files Needing Review ===" -ForegroundColor Yellow
    foreach ($orphan in $needsReview) {
        Write-Host "  $($orphan.folder)/$($orphan.name) ($($orphan.size) bytes)" -ForegroundColor White
    }
}
