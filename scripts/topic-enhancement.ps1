# Topic Grep & Tag Enhancement Script
# Greps file topics, adds relevant tags, and improves cross-linking

$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"

Write-Host "`n=== TOPIC GREP & TAG ENHANCEMENT ===" -ForegroundColor Cyan

# Define topic keywords
$topicKeywords = @{
    "react" = @("react", "component", "hook", "jsx")
    "typescript" = @("typescript", "ts-", "interface", "generic")
    "css" = @("css", "tailwind", "shadcn", "style")
    "testing" = @("test", "vitest", "playwright", "mock")
    "security" = @("security", "auth", "oauth", "jwt")
    "database" = @("database", "sql", "nosql", "redis")
    "api" = @("api", "rest", "graphql", "endpoint")
    "devops" = @("ci-cd", "deployment", "docker", "nginx")
    "architecture" = @("architecture", "pattern", "design", "solid")
    "ddd" = @("ddd", "domain", "aggregate", "entity")
    "performance" = @("performance", "optimization", "cache")
    "accessibility" = @("a11y", "accessibility", "aria")
}

$tagByTopic = @{
    "react" = @("domain/frontend", "type/guide")
    "typescript" = @("domain/frontend", "type/reference")
    "css" = @("domain/frontend", "type/reference")
    "testing" = @("domain/testing", "type/guide")
    "security" = @("domain/security", "type/reference")
    "database" = @("domain/database", "type/reference")
    "api" = @("domain/backend", "type/reference")
    "devops" = @("domain/devops", "type/guide")
    "architecture" = @("domain/architecture", "type/concept")
    "ddd" = @("domain/architecture", "type/concept")
    "performance" = @("domain/optimization", "type/guide")
    "accessibility" = @("domain/frontend", "domain/accessibility")
}

Write-Host "`n--- Processing Files ---" -ForegroundColor Yellow

$filesProcessed = 0
$tagsAdded = 0
$linksAdded = 0

$allFiles = Get-ChildItem $specsDir -Filter "*.md" -Recurse | Where-Object {
    $_.Name -notmatch 'README|AGENTS|index|_template|stub'
}

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $modified = $false
    
    # Detect topics
    $detectedTopics = @()
    foreach ($topic in $topicKeywords.Keys) {
        $keywords = $topicKeywords[$topic]
        foreach ($keyword in $keywords) {
            if ($content -match [regex]::Escape($keyword)) {
                $detectedTopics += $topic
                break
            }
        }
    }
    
    if ($detectedTopics.Count -gt 0) {
        # Get domain tags
        $domainTags = @()
        foreach ($topic in $detectedTopics) {
            if ($tagByTopic[$topic]) {
                $domainTags += $tagByTopic[$topic]
            }
        }
        $domainTags = $domainTags | Select-Object -Unique
        
        # Add tags if missing
        if ($content -match '(?m)^tags:\s*$') {
            $existingTags = @()
            $tagMatches = [regex]::Matches($content, '(?m)^\s+-\s+(\S+)')
            foreach ($match in $tagMatches) {
                $existingTags += $match.Groups[1].Value
            }
            
            $newTags = $domainTags | Where-Object { $_ -notin $existingTags }
            if ($newTags.Count -gt 0) {
                $tagsToAdd = ($newTags -join "`n  - ")
                $content = $content -replace '(?m)(^tags:\s*$)', "`$1`n  - $tagsToAdd"
                $modified = $true
                $tagsAdded += $newTags.Count
            }
        }
        else {
            $tagsSection = "`ntags:`n  - $($domainTags -join "`n  - ")`n  - status/complete`n  - type/reference"
            $frontmatterEnd = $content.IndexOf("---", 4)
            if ($frontmatterEnd -gt 0) {
                $content = $content.Insert($frontmatterEnd + 3, $tagsSection)
                $modified = $true
                $tagsAdded += $domainTags.Count + 2
            }
        }
    }
    
    # Add cross-links
    $relatedFiles = Get-ChildItem $file.DirectoryName -Filter "*.md" | Where-Object {
        $_.Name -ne $file.Name -and $_.Name -notmatch 'README|AGENTS|index|stub'
    } | Select-Object -First 5
    
    if ($relatedFiles.Count -gt 0) {
        if ($content -notmatch '## See Also' -and $content -notmatch '## Related') {
            $seeAlso = "`n## See Also`n"
            foreach ($related in $relatedFiles) {
                $relatedName = $related.Name -replace '\.md$', ''
                $seeAlso += "- [[${relatedName}]]`n"
                $linksAdded++
            }
            $content += $seeAlso
            $modified = $true
        }
    }
    
    if ($modified) {
        $content | Out-File $file.FullName -Encoding UTF8
        $filesProcessed++
    }
}

Write-Host "Files processed: $filesProcessed" -ForegroundColor White
Write-Host "Tags added: $tagsAdded" -ForegroundColor Green
Write-Host "Cross-links added: $linksAdded" -ForegroundColor Green

# Create topic index notes
Write-Host "`n--- Creating Index Notes ---" -ForegroundColor Yellow

$topicFolders = @{
    "Web Frontend" = @("Cascading Stylesheets", "TailwindsCSS", "ShadCN", "Hypertext HTML", "Hypertext Markup")
    "Quality & Testing" = @("Testing", "Quality Delivery")
    "DevOps & Deployment" = @("Bundler", "Integration", "Frontend UI")
    "React UI" = @("React", "ShadCN")
}

foreach ($parentFolder in $topicFolders.Keys) {
    $parentPath = Join-Path $specsDir $parentFolder
    if (-not (Test-Path $parentPath)) { continue }
    
    $indexPath = Join-Path $parentPath "00-index.md"
    
    if (-not (Test-Path $indexPath)) {
        $indexContent = "slug: $($parentFolder.ToLower())-index`ntags:`n  - status/complete`n  - type/reference`n  - domain/architecture`n---`n`n# $($parentFolder) Index`n`n> Last Updated: 2026-11-03`n`n---`n`n## Subfolders`n`n"
        
        foreach ($subfolder in $topicFolders[$parentFolder]) {
            $subfolderPath = Join-Path $parentPath $subfolder
            if (Test-Path $subfolderPath) {
                $files = Get-ChildItem $subfolderPath -Filter "*.md" | Where-Object { $_.Name -notmatch 'README|AGENTS|index' }
                $indexContent += "- **[$subfolder]($subfolder/)** - $($files.Count) notes`n"
            }
        }

        $indexContent += "`n---`n`n## Related`n`n- [[Architecture/00-architecture-index]]`n- [[Sources/README]]`n"

        $indexContent | Out-File $indexPath -Encoding UTF8
        Write-Host "Created: $parentFolder/00-index.md" -ForegroundColor Green
    }
}

# Save report
$report = @{
    files_processed = $filesProcessed
    tags_added = $tagsAdded
    links_added = $linksAdded
    index_notes_created = ($topicFolders.Keys | Where-Object { Test-Path (Join-Path $specsDir $_ "00-index.md") }).Count
    enhancement_date = (Get-Date -Format "yyyy-MM-dd")
}

$report | ConvertTo-Json -Depth 3 | Out-File "$PWD\topic-enhancement-report.json" -Encoding UTF8
Write-Host "`n=== Enhancement Complete ===" -ForegroundColor Green
Write-Host "Report saved to topic-enhancement-report.json" -ForegroundColor Green
