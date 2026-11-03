---
slug: refactor-manifest
sources:
  - https://example.com/
---

# Refactor Manifest

**Vault**: `d:\Projects\missmetaverse.io\.obsidian-vault\specs\`
**Started**: 2026-11-02

## Schema

Each operation record:
```json
{
  "id": "OP-001",
  "type": "rename|move|merge|split|link-fix|tag-update|metadata-update",
  "priority": "high|medium|low",
  "status": "planned|in-progress|completed|rolled-back",
  "source": {
    "path": "old/path.md",
    "slug": "optional-slug",
    "title": "Optional Title"
  },
  "destination": {
    "path": "new/path.md",
    "slug": "optional-slug",
    "title": "Optional Title"
  },
  "rationale": "Why this change is needed",
  "dependencies": ["OP-000"],
  "references_affected": ["[[link1]]", "[[link2]]"],
  "information_loss_risk": "none|low|medium|high",
  "validation": {
    "hash_before": "sha256...",
    "hash_after": "sha256...",
    "links_verified": true,
    "content_preserved": true
  },
  "rollback": "How to revert this change",
  "completed_at": "2026-11-02T12:00:00Z",
  "notes": "Optional notes"
}
```

## Operations Log

| ID | Type | Priority | Source | Destination | Status |
|----|------|----------|--------|-------------|--------|
| OP-001 | TBD | TBD | TBD | TBD | planned |

## Completed Operations

| ID | Type | Source | Destination | Completed At |
|----|------|--------|-------------|--------------|
| - | - | - | - | - |

## Rolled Back Operations

| ID | Type | Reason |
|----|------|--------|
| - | - | - |
