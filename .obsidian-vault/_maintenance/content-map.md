---
slug: content-map
sources:
  - https://example.com/
---

# Content Map

**Vault**: `d:\Projects\missmetaverse.io\.obsidian-vault\specs\`
**Started**: 2026-11-02

## Schema

Maps original passages to their final locations after refactoring.

```json
{
  "original": {
    "path": "old/path.md",
    "heading": "## Heading Level",
    "block_id": "^block-id",
    "content_hash": "sha256..."
  },
  "destination": {
    "path": "new/path.md",
    "heading": "## Heading Level",
    "block_id": "^block-id",
    "content_hash": "sha256..."
  },
  "preservation_method": "moved|copied|merged|split",
  "notes": "Why and how this passage was preserved"
}
```

## Content Mappings

| # | Original Location | Destination Location | Method | Status |
|---|-------------------|---------------------|--------|--------|
| 1 | TBD | TBD | TBD | planned |

## Validation

- [ ] Every original passage accounted for
- [ ] No content loss detected
- [ ] All hashes match
- [ ] References updated
