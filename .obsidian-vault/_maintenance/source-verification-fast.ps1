# Fast Source Verification Script (Sample-based)
# Checks a sample of URLs to verify reachability

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$allUrls = @{}

Write-Host "`n=== Collecting URLs ===" -ForegroundColor Cyan

# Collect all unique URLs from sources: frontmatter
$files = Get-ChildItem $specsDir -Filter "*.md" -Recurse
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    if ($content -match '(?m)^sources:\s*$') {
        $sourceMatches = [regex]::Matches($content, '(?m)^\s+-\s+(https?://[^\s]+)')
        foreach ($match in $sourceMatches) {
            $url = $match.Groups[1].Value.Trim()
            $allUrls[$url] = "pending"
        }
    }
}

Write-Host "Total unique URLs: $($allUrls.Count)" -ForegroundColor Cyan

# Sample 50 URLs for verification (or all if less than 50)
$sampleSize = [Math]::Min(50, $allUrls.Count)
$sampleUrls = $allUrls.Keys | Get-Random -Count $sampleSize

Write-Host "Sampling $sampleSize URLs for verification..." -ForegroundColor Cyan

$reachable = @()
$unreachable = @()
$checked = 0

foreach ($url in $sampleUrls) {
    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 5 -UseBasicParsing -ErrorAction Stop
        if ($response.StatusCode -eq 200) {
            $reachable += $url
            Write-Host "OK: $url" -ForegroundColor Green
        }
        else {
            $unreachable += $url
            Write-Host "FAIL ($($response.StatusCode)): $url" -ForegroundColor Red
        }
    }
    catch {
        $unreachable += $url
        Write-Host "FAIL: $url" -ForegroundColor Red
    }
    
    $checked++
    if ($checked % 10 -eq 0) {
        Write-Host "  Checked $checked/$sampleSize..." -ForegroundColor Gray
    }
}

Write-Host "`n=== Verification Complete ===" -ForegroundColor Green
Write-Host "Sample size: $sampleSize" -ForegroundColor Cyan
Write-Host "Reachable: $($reachable.Count)" -ForegroundColor Green
Write-Host "Unreachable: $($unreachable.Count)" -ForegroundColor Red

# Save verification log
$verificationLog = @{
    total_unique_urls = $allUrls.Count
    sample_size = $sampleSize
    reachable_urls = $reachable
    unreachable_urls = $unreachable
    verification_date = (Get-Date -Format "yyyy-MM-dd")
    method = "random_sample"
}

$verificationLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\source-verification.json" -Encoding UTF8
Write-Host "`nVerification log saved to source-verification.json" -ForegroundColor Cyan
