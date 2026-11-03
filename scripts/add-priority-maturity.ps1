# Add Priority and Maturity Tags Script
# Adds priority and maturity tags to all files based on content analysis

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

Write-Host "`n=== ADDING PRIORITY & MATURITY TAGS ===" -ForegroundColor Cyan

$filesProcessed = 0
$tagsAdded = 0

$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse | Where-Object {
    $_.Name -notmatch 'README|AGENTS|index|_template|stub'
}

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $modified = $false
    
    # Determine priority based on content
    $priority = "medium"
    if ($content -match 'critical|essential|must|core|fundamental|base') {
        $priority = "high"
    }
    elseif ($content -match 'optional|nice-to-have|advanced|experimental') {
        $priority = "low"
    }
    
    # Determine maturity based on content and file type
    $maturity = "stable"
    if ($content -match 'experimental|draft|work-in-progress|wip|prototype') {
        $maturity = "experimental"
    }
    elseif ($content -match 'deprecated|legacy|old|outdated') {
        $maturity = "deprecated"
    }
    
    # Check if file has tags section
    if ($content -match '(?m)^tags:\s*$') {
        # Check if priority tag exists
        if ($content -notmatch 'priority/' -and $content -notmatch 'maturity/') {
            $newTags = "  - priority/$priority`n  - maturity/$maturity"
            $content = $content -replace '(?m)(^tags:\s*$)', "`$1`n$newTags"
            $modified = $true
            $tagsAdded += 2
        }
    }
    else {
        # Add tags section
        $tagsSection = "`ntags:`n  - priority/$priority`n  - maturity/$maturity`n  - status/complete`n  - type/reference"
        $frontmatterEnd = $content.IndexOf("---", 4)
        if ($frontmatterEnd -gt 0) {
            $content = $content.Insert($frontmatterEnd + 3, $tagsSection)
            $modified = $true
            $tagsAdded += 4
        }
    }
    
    if ($modified) {
        $content | Out-File $file.FullName -Encoding UTF8
        $filesProcessed++
    }
}

Write-Host "Files processed: $filesProcessed" -ForegroundColor White
Write-Host "Tags added: $tagsAdded" -ForegroundColor Green

# Save report
$report = @{
    files_processed = $filesProcessed
    tags_added = $tagsAdded
    enhancement_date = (Get-Date -Format "yyyy-MM-dd")
}

$report | ConvertTo-Json -Depth 3 | Out-File "$PWD\priority-maturity-report.json" -Encoding UTF8
Write-Host "`n=== Complete ===" -ForegroundColor Green
Write-Host "Report saved to priority-maturity-report.json" -ForegroundColor Green
