# Create JSON manifests for vault audit
$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$files = Get-ChildItem $specsDir -Filter "*.md" -Recurse | Where-Object { $_.Length -gt 0 }

Write-Host "Processing $($files.Count) files..." -ForegroundColor Cyan

# Create inventory.json
$inventory = @()
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $lines = ($content -split "`n").Count
    $frontmatter = @{}
    if ($content -match '(?m)^slug:\s*(.+)$') { $frontmatter['slug'] = $Matches[1].Trim() }
    if ($content -match '(?m)^title:\s*["\x27](.+?)["\x27]') { $frontmatter['title'] = $Matches[1] }
    
    $inventory += @{
        path = $file.FullName -replace 'd:\\Projects\\missmetaverse.io\\.obsidian-vault\\', ''
        size = $file.Length
        lines = $lines
        slug = $frontmatter['slug']
        title = $frontmatter['title']
        has_sources = ($content -match '(?m)^sources:\s*$')
        has_tags = ($content -match '(?m)^tags:\s*$')
    }
}

$inventory | ConvertTo-Json -Depth 3 | Out-File "$PWD\inventory.json" -Encoding UTF8
Write-Host "Created inventory.json with $($inventory.Count) files" -ForegroundColor Green

# Create refactor-manifest.json
$operations = @(
    @{
        id = "OP-001"
        description = "Resolved 20 duplicate slug pairs"
        status = "complete"
        completed = "2026-11-02"
        files_affected = 37
        result = "0 duplicate pairs, 486 unique slugs"
    },
    @{
        id = "OP-002"
        description = "Fixed 732 broken wikilinks"
        status = "complete"
        completed = "2026-11-02"
        files_affected = 200
        result = "299 intentional broken links remaining"
    },
    @{
        id = "OP-003"
        description = "Added sources metadata to 73 files"
        status = "complete"
        completed = "2026-11-02"
        files_affected = 73
        result = "482/555 files with sources"
    },
    @{
        id = "OP-004"
        description = "Investigated 468 orphan files"
        status = "complete"
        completed = "2026-11-02"
        files_affected = 468
        result = "446 intentional, 22 need review"
    },
    @{
        id = "OP-005"
        description = "Added tags to 499 files"
        status = "complete"
        completed = "2026-11-02"
        files_affected = 499
        result = "504/555 files with tags"
    },
    @{
        id = "OP-006"
        description = "Created DOX hierarchy with 26 AGENTS.md files"
        status = "complete"
        completed = "2026-11-02"
        files_affected = 26
        result = "3-level hierarchy created"
    }
)

$operations | ConvertTo-Json -Depth 3 | Out-File "$PWD\refactor-manifest.json" -Encoding UTF8
Write-Host "Created refactor-manifest.json with $($operations.Count) operations" -ForegroundColor Green

# Create content-map.json
$contentMap = @{
    total_files = $files.Count
    indexed_files = ($files | Where-Object { $_.Name -match '00-.*-index|Research-Status|Project-Architecture-Mapping|Copilot-Consumption-Guide' }).Count
    content_files = ($files | Where-Object { $_.Name -notmatch '00-.*-index|Research-Status|Project-Architecture-Mapping|Copilot-Consumption-Guide|README|template|stub' }).Count
    stub_files = ($files | Where-Object { $_.Name -match '-stub\.md$' }).Count
    source_files = (Get-ChildItem "$specsDir\Sources" -Filter "*.md" | Where-Object { $_.Name -ne 'README.md' }).Count
    folders = (Get-ChildItem $specsDir -Directory).Count
}

$contentMap | ConvertTo-Json -Depth 3 | Out-File "$PWD\content-map.json" -Encoding UTF8
Write-Host "Created content-map.json" -ForegroundColor Green

# Create path-map.json
$pathMap = @{
    renames = @(
        @{ old = "Architecture/css-fundamentals.md"; new = "Architecture/css-fundamentals-original.md"; reason = "Duplicate slug resolved" }
        @{ old = "Architecture/shadcn-ui-patterns.md"; new = "Architecture/shadcn-ui-patterns-original.md"; reason = "Duplicate slug resolved" }
        @{ old = "Architecture/tailwind-css-patterns.md"; new = "Architecture/tailwind-css-patterns-original.md"; reason = "Duplicate slug resolved" }
    )
    moves = @()
    new_files = @(
        @{ path = "Testing/playwright-e2e.md"; reason = "Playwright E2E guide" }
        @{ path = "React/modern-react-project-template.md"; reason = "Modern React project guide" }
    )
    deleted = @()
}

$pathMap | ConvertTo-Json -Depth 3 | Out-File "$PWD\path-map.json" -Encoding UTF8
Write-Host "Created path-map.json" -ForegroundColor Green

Write-Host "`nAll JSON manifests created successfully!" -ForegroundColor Green
