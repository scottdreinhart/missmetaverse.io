# Add sources metadata to source files
$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs\Sources"
$excludeFiles = @('README.md', 'system-design-101-index.md', 'documentation-ingestion-plan.md', 'pattern-surface.md', 'thoughtworks-radar.md', 'wikipedia.md', 'go-blog.md', 'goF-1994.md', 'harel-statecharts.md', 'martinfowler-bliki.md', 'microsoft-azure.md', 'nist-cyberframework-2014.md', 'opentelemetry.md', 'rest-api-design.md', 'seemann-dd.md', 'swagger-openapi.md', 'wcag-21.md', 'w3c-i18n.md', 'xstate-docs.md', 'radix-ui-docs-2024.md')

$sources = Get-ChildItem -Filter "*.md" | Where-Object { $_.Name -notin $excludeFiles }
Write-Host "Processing $($sources.Count) source files..." -ForegroundColor Cyan

$fixed = 0
foreach ($file in $sources) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    # Skip if already has sources
    if ($content -match '(?m)^sources:\s*$') {
        continue
    }
    
    $slug = $file.BaseName
    $sourcesList = "  - https://example.com/"
    
    if ($slug -match '^mdn-') { $sourcesList = "  - https://developer.mozilla.org/en-US/docs/" }
    elseif ($slug -match '^react-') { $sourcesList = "  - https://react.dev/" }
    elseif ($slug -match '^tailwind-') { $sourcesList = "  - https://tailwindcss.com/docs" }
    elseif ($slug -match '^shadcn-') { $sourcesList = "  - https://ui.shadcn.com/" }
    elseif ($slug -match '^playwright-') { $sourcesList = "  - https://playwright.dev/" }
    elseif ($slug -match '^vitest-') { $sourcesList = "  - https://vitest.dev/" }
    elseif ($slug -match '^pnpm-') { $sourcesList = "  - https://pnpm.io/" }
    elseif ($slug -match '^vite-') { $sourcesList = "  - https://vitejs.dev/guide/" }
    elseif ($slug -match '^swagger-') { $sourcesList = "  - https://swagger.io/specification/" }
    elseif ($slug -match '^opentelemetry-') { $sourcesList = "  - https://opentelemetry.io/docs/" }
    elseif ($slug -match '^owasp-') { $sourcesList = "  - https://owasp.org/" }
    elseif ($slug -match '^martin-') { $sourcesList = "  - https://martinfowler.com/" }
    elseif ($slug -match '^evans-') { $sourcesList = "  - https://en.wikipedia.org/wiki/Domain-Driven_Design" }
    elseif ($slug -match '^fowler-') { $sourcesList = "  - https://martinfowler.com/" }
    elseif ($slug -match '^bogard-') { $sourcesList = "  - https://www.jimmybogard.com/" }
    elseif ($slug -match '^frost-') { $sourcesList = "  - https://bradfrost.com/" }
    elseif ($slug -match '^gdpr-') { $sourcesList = "  - https://gdpr.eu/" }
    elseif ($slug -match '^microsoft-') { $sourcesList = "  - https://learn.microsoft.com/" }
    elseif ($slug -match '^aws-') { $sourcesList = "  - https://docs.aws.amazon.com/" }
    elseif ($slug -match '^wcag-') { $sourcesList = "  - https://www.w3.org/TR/WCAG21/" }
    elseif ($slug -match '^w3c-') { $sourcesList = "  - https://www.w3.org/" }
    elseif ($slug -match '^xstate-') { $sourcesList = "  - https://xstate.js.org/docs/" }
    
    $frontmatter = "---`nslug: $slug`nsources:`n$sourcesList`n---"
    
    if ($content -match '^---\r?\n.*?\r?\n---\r?\n') {
        $content = $content -replace '(?m)^---\r?\n.*?\r?\n---\r?\n', $frontmatter
    } else {
        $content = $frontmatter + "`n`n" + $content
    }
    
    [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
    $fixed++
    Write-Host "  Fixed: $($file.Name)" -ForegroundColor Green
}

Write-Host "`nTotal fixed: $fixed" -ForegroundColor Cyan
