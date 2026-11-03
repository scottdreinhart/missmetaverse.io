# Purpose

Feature specs, architecture decisions, and technical reference notes. Specs are written before coding starts.

# Ownership

- Owner: project team
- Scope: all content under `.obsidian-vault/specs/`

# Local Contracts

- Specs go in `specs/` before any coding starts
- Each spec has a `slug:` frontmatter field (unique across vault)
- Each spec has a `sources:` frontmatter field linking to original documentation
- Each spec has `tags:` frontmatter for discoverability
- Folder naming: Title Case with spaces (e.g., `Cascading Stylesheets/`)
- File naming: kebab-case (e.g., `css-fundamentals.md`)

# Work Guidance

- New specs start as drafts, then move to verified when sources are cited
- Architecture notes go in `Architecture/` or the appropriate domain folder
- Source references go in `Sources/`
- Templates go in `templates/`
- Cross-folder wikilinks must include folder path: `[[Folder/file-name]]`

# Verification

- Run `_maintenance/inventory-script.ps1` to check for duplicate slugs
- Verify all specs have `slug:`, `sources:`, and `tags:` frontmatter
- Check broken wikilinks: 299 intentional references to missing notes (acceptable)

# Child DOX Index

Domain-specific specs have their own AGENTS.md files (all created):

| Folder | AGENTS.md | Files |
|--------|-----------|-------|
| `Architecture/` | ✅ Created | 281+ files |
| `Sources/` | ✅ Created | 83 files |
| `Cascading Stylesheets/` | ✅ Created | 4 files |
| `TypeScript/` | ✅ Created | 11 files |
| `React/` | ✅ Created | 3 files |
| `Security/` | ✅ Created | 13 files |
| `DDD/` | ✅ Created | 16 files |
| `Testing/` | ✅ Created | 3 files |
| `Bundler/` | ✅ Created | 3 files |
| `TailwindsCSS/` | ✅ Created | 3 files |
| `ShadCN/` | ✅ Created | 3 files |
| `Package Manager/` | ✅ Created | 3 files |
| `Hypertext HTML/` | ✅ Created | 2 files |
| `Hypertext Markup/` | ✅ Created | 2 files |
| `APIs Distributed Systems/` | ✅ Created | 11 files |
| `Data Databases/` | ✅ Created | 15 files |
| `Quality Delivery/` | ✅ Created | 12 files |
| `Commit Management/` | ✅ Created | 7 files |
| `Coding Type Systems/` | ✅ Created | 9 files |
| `Data-Driven Approaches/` | ✅ Created | 6 files |
| `Integration/` | ✅ Created | 5 files |
| `Frontend UI/` | ✅ Created | 13 files |
| `templates/` | ✅ Created | 5 files |

All 23 domain folders now have AGENTS.md files.
