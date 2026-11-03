# Purpose

Vault maintenance: scripts, inventories, manifests, and validation reports.

# Ownership

- Owner: project team
- Scope: all content under `.obsidian-vault/_maintenance/`

# Local Contracts

- Scripts use PowerShell (`.ps1`)
- Reports use Markdown (`.md`)
- Scripts must be idempotent (safe to run multiple times)
- Reports must be updated after each maintenance operation

# Work Guidance

- Run `_maintenance/inventory-script.ps1` to verify vault integrity
- Run `_maintenance/add-sources.ps1` to add sources metadata to files without it
- Run `_maintenance/add-tags.ps1` to add tags to files without them
- Update `_maintenance/resume.md` after each operation
- Update `_maintenance/validation-report.md` with current status

# Verification

- `inventory-script.ps1` checks: file count, duplicate slugs, broken wikilinks
- `validation-report.md` tracks: file inventory, broken links, orphans, sources, tags
- Target metrics: 0 duplicate slugs, 86.8%+ sources coverage, 90.8%+ tag coverage

# Child DOX Index

None. This is a leaf domain.
