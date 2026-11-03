# Apply Index-Derived Naming to Remaining Folders
# Renames files in folders without existing index identifiers

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$renameLog = @()

function Rename-FileWithIndex {
    param(
        [string]$FilePath,
        [string]$NewName,
        [string]$Reason
    )
    
    $oldPath = $FilePath
    $newPath = Join-Path (Split-Path $FilePath) $NewName
    
    try {
        Rename-Item -Path $oldPath -NewName $NewName -Force
        $renameLog += @{
            old = $oldPath
            new = $newPath
            reason = $Reason
        }
        Write-Host "OK $NewName" -ForegroundColor Green
    }
    catch {
        Write-Host "FAIL: $NewName - $($_.Exception.Message)" -ForegroundColor Red
    }
}

# ============================================================
# Architecture Folder (A01-A261) -> A01-Concept-Name.md
# ============================================================
Write-Host "`n=== Architecture Folder ===" -ForegroundColor Cyan
$archDir = Join-Path $specsDir "Architecture"
$archFiles = Get-ChildItem $archDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md" -and
    $_.Name -ne "00-architecture-index.md" -and
    $_.Name -ne "Research-Status.md" -and
    $_.Name -ne "Project-Architecture-Mapping.md" -and
    $_.Name -ne "Copilot-Consumption-Guide.md" -and
    $_.Name -notmatch '-stub\.md$' -and
    $_.Name -notmatch '-original\.md$'
}

$counter = 1
foreach ($file in $archFiles | Sort-Object Name) {
    $index = "A{0:D3}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Architecture concept"
    $counter++
}

# ============================================================
# TypeScript Folder (T01-T10) -> T01-Concept-Name.md
# ============================================================
Write-Host "`n=== TypeScript Folder ===" -ForegroundColor Cyan
$tsDir = Join-Path $specsDir "TypeScript"
$tsFiles = Get-ChildItem $tsDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $tsFiles | Sort-Object Name) {
    $index = "T{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "TypeScript concept"
    $counter++
}

# ============================================================
# React Folder (R01-R3) -> R01-Concept-Name.md
# ============================================================
Write-Host "`n=== React Folder ===" -ForegroundColor Cyan
$reactDir = Join-Path $specsDir "React"
$reactFiles = Get-ChildItem $reactDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $reactFiles | Sort-Object Name) {
    $index = "R{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "React concept"
    $counter++
}

# ============================================================
# Testing Folder (T01-T3) -> T01-Concept-Name.md
# ============================================================
Write-Host "`n=== Testing Folder ===" -ForegroundColor Cyan
$testingDir = Join-Path $specsDir "Testing"
$testingFiles = Get-ChildItem $testingDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $testingFiles | Sort-Object Name) {
    $index = "T{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Testing concept"
    $counter++
}

# ============================================================
# Bundler Folder (B01-B2) -> B01-Concept-Name.md
# ============================================================
Write-Host "`n=== Bundler Folder ===" -ForegroundColor Cyan
$bundlerDir = Join-Path $specsDir "Bundler"
$bundlerFiles = Get-ChildItem $bundlerDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $bundlerFiles | Sort-Object Name) {
    $index = "B{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Bundler concept"
    $counter++
}

# ============================================================
# Integration Folder (I01-I5) -> I01-Concept-Name.md
# ============================================================
Write-Host "`n=== Integration Folder ===" -ForegroundColor Cyan
$integrationDir = Join-Path $specsDir "Integration"
$integrationFiles = Get-ChildItem $integrationDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $integrationFiles | Sort-Object Name) {
    $index = "I{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Integration concept"
    $counter++
}

# ============================================================
# Commit Management Folder (CM01-CM7) -> CM01-Concept-Name.md
# ============================================================
Write-Host "`n=== Commit Management Folder ===" -ForegroundColor Cyan
$commitDir = Join-Path $specsDir "Commit Management"
$commitFiles = Get-ChildItem $commitDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $commitFiles | Sort-Object Name) {
    $index = "CM{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Commit management concept"
    $counter++
}

# ============================================================
# Package Manager Folder (PM01-PM2) -> PM01-Concept-Name.md
# ============================================================
Write-Host "`n=== Package Manager Folder ===" -ForegroundColor Cyan
$pmDir = Join-Path $specsDir "Package Manager"
$pmFiles = Get-ChildItem $pmDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $pmFiles | Sort-Object Name) {
    $index = "PM{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Package manager concept"
    $counter++
}

# ============================================================
# TailwindsCSS Folder (TC01-TC2) -> TC01-Concept-Name.md
# ============================================================
Write-Host "`n=== TailwindsCSS Folder ===" -ForegroundColor Cyan
$tailwindDir = Join-Path $specsDir "TailwindsCSS"
$tailwindFiles = Get-ChildItem $tailwindDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $tailwindFiles | Sort-Object Name) {
    $index = "TC{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Tailwind CSS concept"
    $counter++
}

# ============================================================
# ShadCN Folder (SC01-SC2) -> SC01-Concept-Name.md
# ============================================================
Write-Host "`n=== ShadCN Folder ===" -ForegroundColor Cyan
$shadcnDir = Join-Path $specsDir "ShadCN"
$shadcnFiles = Get-ChildItem $shadcnDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $shadcnFiles | Sort-Object Name) {
    $index = "SC{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "ShadCN concept"
    $counter++
}

# ============================================================
# Cascading Stylesheets Folder (CS01-CS3) -> CS01-Concept-Name.md
# ============================================================
Write-Host "`n=== Cascading Stylesheets Folder ===" -ForegroundColor Cyan
$cssDir = Join-Path $specsDir "Cascading Stylesheets"
$cssFiles = Get-ChildItem $cssDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $cssFiles | Sort-Object Name) {
    $index = "CS{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "CSS concept"
    $counter++
}

# ============================================================
# Frontend UI Folder (FU01-FU13) -> FU01-Concept-Name.md
# ============================================================
Write-Host "`n=== Frontend UI Folder ===" -ForegroundColor Cyan
$frontendDir = Join-Path $specsDir "Frontend UI"
$frontendFiles = Get-ChildItem $frontendDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $frontendFiles | Sort-Object Name) {
    $index = "FU{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Frontend UI concept"
    $counter++
}

# ============================================================
# Hypertext HTML Folder (HH01) -> HH01-Concept-Name.md
# ============================================================
Write-Host "`n=== Hypertext HTML Folder ===" -ForegroundColor Cyan
$htmlDir = Join-Path $specsDir "Hypertext HTML"
$htmlFiles = Get-ChildItem $htmlDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $htmlFiles | Sort-Object Name) {
    $index = "HH{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "HTML concept"
    $counter++
}

# ============================================================
# Hypertext Markup Folder (HM01) -> HM01-Concept-Name.md
# ============================================================
Write-Host "`n=== Hypertext Markup Folder ===" -ForegroundColor Cyan
$markupDir = Join-Path $specsDir "Hypertext Markup"
$markupFiles = Get-ChildItem $markupDir -Filter "*.md" | Where-Object { 
    $_.Name -ne "README.md" -and 
    $_.Name -ne "AGENTS.md"
}

$counter = 1
foreach ($file in $markupFiles | Sort-Object Name) {
    $index = "HM{0:D2}" -f $counter
    $newName = "$index-$($file.Name -replace '\.md$', '')" -replace '[-\s]+', '-'
    $newName = "$newName.md"
    
    Rename-FileWithIndex -FilePath $file.FullName -NewName $newName -Reason "Markup concept"
    $counter++
}

# ============================================================
# Save rename log
# ============================================================
$renameLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\index-naming-log-2.json" -Encoding UTF8
Write-Host "`n=== Index-Derived Naming Complete ===" -ForegroundColor Green
Write-Host "Total files renamed: $($renameLog.Count)" -ForegroundColor Cyan
Write-Host "Log saved to index-naming-log-2.json" -ForegroundColor Cyan
