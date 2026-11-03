# Source Verification Script
# Checks if URLs in sources: frontmatter are reachable

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$verificationLog = @()
$totalFiles = 0
$filesWithSources = 0
$verifiedUrls = @{}
$failedUrls = @{}

function Test-UrlReachable {
    param([string]$Url)
    
    try {
        $response = Invoke-WebRequest -Uri $Url -Method Head -TimeoutSec 10 -UseBasicParsing
        return $response.StatusCode -eq 200
    }
    catch {
        return $false
    }
}

Write-Host "`n=== Starting Source Verification ===" -ForegroundColor Cyan

# Find all files with sources: frontmatter
$files = Get-ChildItem $specsDir -Filter "*.md" -Recurse
foreach ($file in $files) {
    $totalFiles++
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    if ($content -match '(?m)^sources:\s*$') {
        $filesWithSources++
        
        # Extract URLs from sources
        $sourceMatches = [regex]::Matches($content, '(?m)^\s+-\s+(https?://[^\s]+)')
        foreach ($match in $sourceMatches) {
            $url = $match.Groups[1].Value.Trim()
            
            if (-not $verifiedUrls.ContainsKey($url)) {
                Write-Host "Checking: $url" -ForegroundColor Yellow
                $isReachable = Test-UrlReachable -Url $url
                
                if ($isReachable) {
                    $verifiedUrls[$url] = "reachable"
                    Write-Host "  OK: $url" -ForegroundColor Green
                }
                else {
                    $failedUrls[$url] = "unreachable"
                    Write-Host "  FAIL: $url" -ForegroundColor Red
                }
            }
            else {
                Write-Host "  SKIP (already checked): $url" -ForegroundColor Gray
            }
        }
    }
}

Write-Host "`n=== Verification Complete ===" -ForegroundColor Green
Write-Host "Total files scanned: $totalFiles" -ForegroundColor Cyan
Write-Host "Files with sources: $filesWithSources" -ForegroundColor Cyan
Write-Host "Unique URLs checked: $($verifiedUrls.Count + $failedUrls.Count)" -ForegroundColor Cyan
Write-Host "Reachable: $($verifiedUrls.Count)" -ForegroundColor Green
Write-Host "Unreachable: $($failedUrls.Count)" -ForegroundColor Red

# Save verification log
$verificationLog = @{
    total_files = $totalFiles
    files_with_sources = $filesWithSources
    unique_urls_checked = $verifiedUrls.Count + $failedUrls.Count
    reachable_urls = $verifiedUrls.Keys
    unreachable_urls = $failedUrls.Keys
    verification_date = (Get-Date -Format "yyyy-MM-dd")
}

$verificationLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\source-verification.json" -Encoding UTF8
Write-Host "`nVerification log saved to source-verification.json" -ForegroundColor Cyan
