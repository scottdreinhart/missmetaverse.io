# Add sources to remaining source files
$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs\Sources"
$excludeFiles = @('README.md', 'system-design-101-index.md', 'documentation-ingestion-plan.md', 'project-structure-mapping.md')

# Files that need sources added
$filesNeedingSources = @('go-blog.md', 'goF-1994.md', 'harel-statecharts.md', 'martinfowler-bliki.md', 'microsoft-azure.md', 'nist-cyberframework-2014.md', 'opentelemetry.md', 'pattern-surface.md', 'radix-ui-docs-2024.md', 'rest-api-design.md', 'seemann-dd.md', 'swagger-openapi.md', 'thoughtworks-radar.md', 'w3c-i18n.md', 'wcag-21.md', 'wikipedia.md', 'xstate-docs.md')

Write-Host "Processing $($filesNeedingSources.Count) source files..." -ForegroundColor Cyan

$fixed = 0
foreach ($fileName in $filesNeedingSources) {
    $filePath = Join-Path $specsDir $fileName
    if (-not (Test-Path $filePath)) {
        Write-Host "  SKIP: $fileName not found" -ForegroundColor Yellow
        continue
    }
    
    $content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
    
    # Skip if already has sources
    if ($content -match '(?m)^sources:\s*$') {
        Write-Host "  SKIP: $fileName already has sources" -ForegroundColor Yellow
        continue
    }
    
    $slug = $fileName -replace '\.md$', ''
    $sourcesList = "  - https://example.com/"
    
    if ($slug -match '^go-blog') { $sourcesList = "  - https://go.dev/blog/" }
    elseif ($slug -match '^goF-') { $sourcesList = "  - https://en.wikipedia.org/wiki/Design_Patterns" }
    elseif ($slug -match '^harel-') { $sourcesList = "  - https://en.wikipedia.org/wiki/State_chart" }
    elseif ($slug -match '^martinfowler-') { $sourcesList = "  - https://martinfowler.com/bliki/" }
    elseif ($slug -match '^microsoft-azure') { $sourcesList = "  - https://azure.microsoft.com/" }
    elseif ($slug -match '^nist-') { $sourcesList = "  - https://www.nist.gov/cyberframework" }
    elseif ($slug -match '^opentelemetry-') { $sourcesList = "  - https://opentelemetry.io/docs/" }
    elseif ($slug -match '^pattern-surface') { $sourcesList = "  - https://pattern-surface.com/" }
    elseif ($slug -match '^radix-') { $sourcesList = "  - https://www.radix-ui.com/themes/docs/overview" }
    elseif ($slug -match '^rest-api-') { $sourcesList = "  - https://restfulapi.net/" }
    elseif ($slug -match '^seemann-') { $sourcesList = "  - https://www.infoq.com/articles/eric-evans-dd-qa/" }
    elseif ($slug -match '^swagger-') { $sourcesList = "  - https://swagger.io/specification/" }
    elseif ($slug -match '^thoughtworks-') { $sourcesList = "  - https://www.thoughtworks.com/radar" }
    elseif ($slug -match '^w3c-') { $sourcesList = "  - https://www.w3.org/International/questions/qa-i18n" }
    elseif ($slug -match '^wcag-') { $sourcesList = "  - https://www.w3.org/TR/WCAG21/" }
    elseif ($slug -match '^wikipedia') { $sourcesList = "  - https://en.wikipedia.org/" }
    elseif ($slug -match '^xstate-') { $sourcesList = "  - https://xstate.js.org/docs/" }
    
    # Add sources to existing frontmatter
    if ($content -match '^---\r?\n') {
        $content = $content -replace '(?m)^(---\r?\n.*?\r?\n---\r?\n)', "`$1sources:`n$sourcesList`n"
    } else {
        $frontmatter = "---`nslug: $slug`nsources:`n$sourcesList`n---"
        $content = $frontmatter + "`n`n" + $content
    }
    
    [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
    $fixed++
    Write-Host "  Fixed: $fileName" -ForegroundColor Green
}

Write-Host "`nTotal fixed: $fixed" -ForegroundColor Cyan
