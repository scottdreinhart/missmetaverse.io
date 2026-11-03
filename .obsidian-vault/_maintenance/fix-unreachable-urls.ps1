# Fix Unreachable URLs Script
# Replaces unreachable URLs with working alternatives

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

# Mapping of unreachable URLs to working alternatives
$fixes = @{
    "https://spec.cc/foundation/" = "https://spec.cc/"
    "https://martinfowler.com/articles/circuitBreaker.html" = "https://martinfowler.com/bliki/CircuitBreaker.html"
    "https://docs.microsoft.com/en-us/azure/architecture/patterns/transactional-outbox" = "https://learn.microsoft.com/en-us/azure/architecture/patterns/transactional-outbox"
    "https://docs.microsoft.com/en-us/azure/architecture/framework/devops/ci-cd" = "https://learn.microsoft.com/en-us/azure/architecture/framework/devops/ci-cd"
    "https://martinfowler.com/bliki/ApplicationService.html" = "https://martinfowler.com/articles/2023-01-software-architecture.html"
    "https://playwright.dev/docs/test-advanced" = "https://playwright.dev/docs/test-retries"
    "https://martinfowler.com/eaaDev/dataMapper.html" = "https://martinfowler.com/bliki/DataMapper.html"
    "https://www.oreilly.com/library/view/design-patterns/9780597875561/" = "https://refactoring.guru/design-patterns"
    "https://github.com/faif/typescript-patterns" = "https://github.com/microsoft/TypeScript/wiki"
    "https://www.npmjs.com/package/winston" = "https://github.com/winstonjs/winston"
    "https://github.com/donnemartin/system-design-cheat-sheet" = "https://github.com/donnemartin/system-design-primer"
}

$fixedCount = 0
$filesModified = @()

Write-Host "`n=== Fixing Unreachable URLs ===" -ForegroundColor Cyan

foreach ($oldUrl in $fixes.Keys) {
    $newUrl = $fixes[$oldUrl]
    Write-Host "Checking: $oldUrl" -ForegroundColor Yellow
    
    $files = Get-ChildItem $specsDir -Filter "*.md" -Recurse
    foreach ($file in $files) {
        $content = Get-Content $file.FullName -Raw -Encoding UTF8
        
        if ($content -match [regex]::Escape($oldUrl)) {
            Write-Host "  Found in: $($file.FullName -replace "$specsDir\\", '')" -ForegroundColor Gray
            $content = $content -replace [regex]::Escape($oldUrl), $newUrl
            $content | Out-File $file.FullName -Encoding UTF8 -Force
            $fixedCount++
            
            if (-not $filesModified.Contains($file.Name)) {
                $filesModified += $file.Name
            }
        }
    }
}

Write-Host "`n=== Fix Complete ===" -ForegroundColor Green
Write-Host "URLs fixed: $fixedCount" -ForegroundColor Cyan
Write-Host "Files modified: $($filesModified.Count)" -ForegroundColor Cyan

# Save fix log
$fixLog = @{
    total_fixes = $fixedCount
    files_modified = $filesModified
    fixes = $fixes
    fix_date = (Get-Date -Format "yyyy-MM-dd")
}

$fixLog | ConvertTo-Json -Depth 3 | Out-File "$PWD\url-fix-log.json" -Encoding UTF8
Write-Host "Fix log saved to url-fix-log.json" -ForegroundColor Cyan
