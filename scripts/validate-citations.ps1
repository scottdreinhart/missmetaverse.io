# Citation Health Validator
# Run from project root: pwsh ./scripts/validate-citations.ps1
# Or from anywhere: pwsh -File ./scripts/validate-citations.ps1

$projectRoot = (Get-Location).Path
if ($projectRoot -match 'obsidian-vault$') {
    $projectRoot = Split-Path $projectRoot -Parent
}
$specsDir = Join-Path $projectRoot ".obsidian-vault\specs"

Write-Host "=== CITATION HEALTH VALIDATION ===" -ForegroundColor Cyan
Write-Host ""

# Get all source files
$sourceFiles = Get-ChildItem "$specsDir\Sources" -Filter "*.md" | ForEach-Object {
    [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
} | Sort-Object

Write-Host "Source files in vault: $($sourceFiles.Count)" -ForegroundColor Green

# Get all unique source references from notes
$allRefs = Select-String -Path "$specsDir\**\*.md" -Pattern '\[\[Sources/([^|\]]+)' -ErrorAction SilentlyContinue |
    ForEach-Object { $_.Matches[0].Groups[1].Value } |
    Where-Object { $_ -notmatch '<source-slug>' } |
    Sort-Object -Unique

Write-Host "Unique source references in notes: $($allRefs.Count)" -ForegroundColor Green
Write-Host ""

# Check for broken citations
$broken = @()
foreach ($ref in $allRefs) {
    if ($sourceFiles -notcontains $ref) {
        $referencingFiles = Select-String -Path "$specsDir\**\*.md" -Pattern "\[\[Sources/$ref" -ErrorAction SilentlyContinue |
            ForEach-Object { [System.IO.Path]::GetFileName($_.Filename) } |
            Select-Object -Unique
        $broken += @{
            Slug = $ref
            Files = $referencingFiles
        }
    }
}

if ($broken.Count -eq 0) {
    Write-Host "✅ ALL citations are valid!" -ForegroundColor Green
} else {
    Write-Host "❌ BROKEN CITATIONS: $($broken.Count)" -ForegroundColor Red
    foreach ($b in $broken) {
        Write-Host "  Slug: $($b.Slug)" -ForegroundColor Yellow
        Write-Host "    Referenced in $($b.Files.Count) files:" -ForegroundColor Yellow
        foreach ($f in $b.Files) {
            Write-Host "      - $f" -ForegroundColor Yellow
        }
    }
}

Write-Host ""

# Check for unused source files
$unused = @()
foreach ($source in $sourceFiles) {
    if ($allRefs -notcontains $source) {
        $unused += $source
    }
}

if ($unused.Count -eq 0) {
    Write-Host "✅ All source files are referenced!" -ForegroundColor Green
} else {
    Write-Host "⚠️  UNUSED SOURCE FILES: $($unused.Count)" -ForegroundColor Yellow
    foreach ($u in $unused) {
        Write-Host "  - $u" -ForegroundColor Yellow
    }
}

Write-Host ""

# Summary
Write-Host "=== SUMMARY ===" -ForegroundColor Cyan
Write-Host "Total source files: $($sourceFiles.Count)"
Write-Host "Referenced: $(( $allRefs | Where-Object { $sourceFiles -contains $_ } ).Count)"
Write-Host "Broken: $($broken.Count)"
Write-Host "Unused: $($unused.Count)"
Write-Host ""

# Exit with error code if broken citations found
if ($broken.Count -gt 0) {
    exit 1
}
