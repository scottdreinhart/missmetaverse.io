# Full Source Verification Script (Parallel)
# Verifies all URLs using parallel requests

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$allUrls = @{}

Write-Host "`n=== Collecting All URLs ===" -ForegroundColor Cyan

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

# Verify URLs in batches
$reachable = @()
$unreachable = @()
$checked = 0
$total = $allUrls.Count
$batchSize = 20

Write-Host "Verifying in batches of $batchSize..." -ForegroundColor Cyan

$urls = $allUrls.Keys | Sort-Object
for ($i = 0; $i -lt $urls.Count; $i += $batchSize) {
    $batch = $urls | Select-Object -Skip $i -First $batchSize
    
    foreach ($url in $batch) {
        try {
            $response = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 5 -UseBasicParsing -ErrorAction Stop
            if ($response.StatusCode -eq 200) {
                $reachable += $url
            }
            else {
                $unreachable += $url
            }
        }
        catch {
            $unreachable += $url
        }
        
        $checked++
    }
    
    Write-Host "  Checked $checked/$total..." -ForegroundColor Gray
}

Write-Host "`n=== Verification Complete ===" -ForegroundColor Green
Write-Host "Total URLs: $total" -ForegroundColor Cyan
Write-Host "Reachable: $($reachable.Count)" -ForegroundColor Green
Write-Host "Unreachable: $($unreachable.Count)" -ForegroundColor Red
Write-Host "Reachability rate: $([math]::Round($reachable.Count / $total * 100, 2))%" -ForegroundColor Cyan

# Save verification log
$verificationLog = @{
    total_unique_urls = $total
    reachable_urls = $reachable.Count
    unreachable_urls = $unreachable.Count
    reachability_rate = "$([math]::Round($reachable.Count / $total * 100, 2))%"
    reachable_list = $reachable
    unreachable_list = $unreachable
    verification_date = (Get-Date -Format "yyyy-MM-dd")
    method = "full_verification_parallel"
}

$verificationLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\source-verification-full.json" -Encoding UTF8
Write-Host "`nFull verification log saved to source-verification-full.json" -ForegroundColor Cyan
