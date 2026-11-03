# Add tags to source files and remaining content files
$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

# Source files tag mapping
$sourceTags = @{
    'martin-srp-2014' = @('solid-principles', 'single-responsibility', 'architecture')
    'martin-clean-architecture-2017' = @('clean-architecture', 'architecture', 'dependencies')
    'martin-oop-2000' = @('oop', 'object-oriented', 'design')
    'evans-ddd-2003' = @('ddd', 'domain-driven-design', 'architecture')
    'fowler-ddd-2003' = @('ddd', 'domain-driven-design', 'patterns')
    'fowler-patterns-2002' = @('design-patterns', 'enterprise', 'architecture')
    'bogard-vertical-slice' = @('vertical-slices', 'architecture', 'clean-architecture')
    'frost-atomic-design-2016' = @('atomic-design', 'ui', 'components')
    'mdn-css-2024' = @('css', 'mdn', 'web-standards')
    'mdn-html-2024' = @('html', 'mdn', 'web-standards')
    'react-docs-2026' = @('react', 'meta', 'frontend')
    'tailwind-docs-2024' = @('tailwind', 'css', 'utility-first')
    'shadcn-ui-docs-2024' = @('shadcn', 'ui', 'components', 'react')
    'playwright-docs-2024' = @('playwright', 'testing', 'e2e')
    'vitest-docs-2024' = @('vitest', 'testing', 'unit-testing')
    'pnpm-docs-2024' = @('pnpm', 'package-manager', 'nodejs')
    'vite-docs-2024' = @('vite', 'bundler', 'build-tool')
    'swagger-openapi' = @('openapi', 'api', 'documentation')
    'owasp-top-ten-2021' = @('owasp', 'security', 'web-security')
    'microsoft-typescript-handbook' = @('typescript', 'microsoft', 'typing')
    'aws-api-gateway' = @('aws', 'api-gateway', 'cloud')
    'aws-elasticache' = @('aws', 'caching', 'cloud')
    'gdpr-eu' = @('gdpr', 'privacy', 'compliance')
    'microsoft-distributed-systems' = @('distributed-systems', 'microsoft', 'architecture')
    'opentelemetry' = @('opentelemetry', 'observability', 'monitoring')
    'nist-cyberframework-2014' = @('nist', 'cybersecurity', 'framework')
    'thoughtworks-radar' = @('thoughtworks', 'technology-radar', 'trends')
    'pattern-surface' = @('patterns', 'architecture', 'design')
    'xstate-docs' = @('xstate', 'state-machines', 'javascript')
    'wcag-21' = @('wcag', 'accessibility', 'standards')
    'w3c-i18n' = @('i18n', 'internationalization', 'w3c')
    'rest-api-design' = @('rest', 'api', 'design')
    'seemann-dd' = @('domain-driven-design', 'eric-evans', 'ddd')
    'harel-statecharts' = @('statecharts', 'state-machines', 'formal-methods')
    'goF-1994' = @('design-patterns', 'gang-of-four', 'patterns')
    'go-blog' = @('go', 'golang', 'programming')
    'martinfowler-bliki' = @('martin-fowler', 'bliki', 'software-development')
    'microsoft-azure' = @('azure', 'microsoft', 'cloud')
    'wikipedia' = @('wikipedia', 'reference', 'encyclopedia')
    'radix-ui-docs-2024' = @('radix-ui', 'ui', 'components', 'accessibility')
    'documentation-ingestion-plan' = @('documentation', 'ingestion', 'process')
    'system-design-101-index' = @('system-design', 'bytebytego', 'architecture')
}

$added = 0
Get-ChildItem "$specsDir\Sources" -Filter "*.md" | Where-Object { 
    $_.Name -notin @('README.md', 'system-design-101-index.md', 'documentation-ingestion-plan.md') -and
    $_.Name -notmatch '-stub\.md$'
} | ForEach-Object {
    $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)
    
    # Skip if already has tags
    if ($content -match '(?m)^tags:\s*$') {
        return
    }
    
    $slug = $_.BaseName
    $tags = @()
    if ($sourceTags.ContainsKey($slug)) {
        $tags = $sourceTags[$slug]
    } else {
        $tags = @('reference', 'source')
    }
    
    $frontmatter = "tags:`n"
    foreach ($tag in $tags) {
        $frontmatter += "  - $tag`n"
    }
    
    # Add tags to existing frontmatter
    if ($content -match '^---\r?\n') {
        $content = $content -replace '(?m)^(---\r?\n.*?\r?\n---\r?\n)', "`$1$frontmatter"
    } else {
        $frontmatterFull = "---`nslug: $slug`n$frontmatter---"
        $content = $frontmatterFull + "`n`n" + $content
    }
    
    [System.IO.File]::WriteAllText($_.FullName, $content, [System.Text.Encoding]::UTF8)
    $added++
    Write-Host "  Added tags: $($_.Name)" -ForegroundColor Green
}

Write-Host "`nTotal files with tags added: $added" -ForegroundColor Cyan
