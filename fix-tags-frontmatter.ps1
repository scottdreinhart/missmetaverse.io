# Fix malformed tags and duplicate frontmatter blocks
$specsDir = "d:\Projects\missmetaverse.io\.obsidian-vault\specs"
$fixed = 0
$errors = @()

Get-ChildItem $specsDir -Filter "*.md" -Recurse | Where-Object {
    $name = $_.Name
    $name -notmatch '00-index' -and
    $name -notmatch 'AGENTS\.md$' -and
    $name -notmatch 'README\.md$' -and
    $name -notmatch 'patterns\.md$' -and
    $name -notmatch 'stub\.md$' -and
    $name -ne '_template-spec.md' -and
    $name -ne 'Copilot-Consumption-Guide.md'
} | ForEach-Object {
    try {
        $content = Get-Content $_.FullName -Raw -EA Stop
        
        # Skip files that already have heading-based metadata (they're fine)
        if ($content -match '(?m)## concept_id\r?\n\s*`') { return }
        
        $modified = $false
        
        # Fix 1: Remove duplicate ---slug: blocks at the top
        # Pattern: ---\r\nslug: X\r\n---\r\n---\r\nslug: X\r\n---
        if ($content -match '(?m)^---\r?\nslug: \S+\r?\n---\r?\n---\r?\nslug:') {
            # Remove the first duplicate block
            $content = $content -replace '(?m)^---\r?\nslug: \S+\r?\n---\r?\n', ''
            $modified = $true
        }
        
        # Fix 2: Clean up tags section - remove empty lines between tags
        if ($content -match '(?m)^tags:\r?\n(.*?\r?\n)*?(?m)^  - ') {
            # Extract the tags section and clean it
            $tagsMatch = [regex]::Match($content, '(?m)(^tags:\r?\n)((?:\s*-\s*\S+\r?\n|\r?\n)+)')
            if ($tagsMatch.Success) {
                $tagsHeader = $tagsMatch.Groups[1].Value
                $tagsBody = $tagsMatch.Groups[2].Value
                
                # Extract just the tag values
                $tagValues = @()
                $tagsBody -split "`r?`n" | Where-Object { $_ -match '\s*-\s*(\S+)' } | ForEach-Object {
                    $tagValues += $matches[1]
                }
                
                if ($tagValues.Count -gt 0) {
                    $cleanTags = $tagsHeader
                    foreach ($tag in $tagValues) {
                        $cleanTags += "  - $tag`r`n"
                    }
                    $content = $content -replace [regex]::Escape($tagsMatch.Value), $cleanTags
                    $modified = $true
                }
            }
        }
        
        # Fix 3: Remove empty tags section (tags: with no values)
        if ($content -match '(?m)^tags:\r?\n\r?\n---') {
            $content = $content -replace '(?m)^tags:\r?\n\r?\n', ''
            $modified = $true
        }
        
        if ($modified) {
            Set-Content $_.FullName $content -Encoding UTF8 -NoNewline -EA Stop
            $fixed++
            if ($fixed % 50 -eq 0) {
                Write-Host "Fixed $fixed files..."
            }
        }
    } catch {
        $errors += "$($_.FullName): $($_.Exception.Message)"
    }
}

Write-Host ""
Write-Host "=== DONE ==="
Write-Host "Fixed $fixed files"
if ($errors.Count -gt 0) {
    Write-Host "Errors: $($errors.Count)"
    $errors | Select-Object -First 10
}
