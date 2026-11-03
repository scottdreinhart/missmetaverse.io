---
slug: naming-conventions
sources:
  - https://example.com/
---

# Naming Conventions

**Vault**: `d:\Projects\missmetaverse.io\.obsidian-vault\specs\`
**Established**: 2026-11-02

## Observed Patterns

### Current Naming Styles
- **kebab-case**: `copilot-consumption-guide.md`, `project-architecture-mapping.md`
- **Title Case**: `00-architecture-index.md`, `Research-Status.md`
- **Mixed**: Some files use spaces in folder names (`APIs Distributed Systems/`)

### Folder Naming
- **Title Case with spaces**: `Architecture/`, `Cascading Stylesheets/`, `Coding Type Systems/`
- **kebab-case**: Not currently used for folders
- **Acronyms preserved**: `DDD/`, `ShadCN/`, `TailwindsCSS/`

### File Naming
- **kebab-case**: Most files use kebab-case (`react-patterns.md`, `css-media-queries.md`)
- **Title Case**: Some status files (`Research-Status.md`)
- **Numeric prefixes**: `00-architecture-index.md` (index file)

## Proposed Conventions

### 1. Folder Names
- **Use Title Case with spaces** (preserve existing pattern)
- Examples: `Architecture/`, `Database Design/`, `API Development/`
- **Rationale**: Matches Obsidian's default display, readable, consistent with existing folders

### 2. File Names
- **Use kebab-case** (preserve existing pattern)
- Examples: `react-patterns.md`, `css-media-queries.md`
- **Rationale**: URL-friendly, consistent with most existing files

### 3. Index Files
- **Use numeric prefix** for ordering
- Examples: `00-architecture-index.md`, `01-react-overview.md`
- **Rationale**: Maintains sort order, clearly identifies index files

### 4. Status/Tracking Files
- **Use Title Case** for distinction
- Examples: `Research-Status.md`, `Validation-Report.md`
- **Rationale**: Distinguishes tracking files from content files

### 5. Source/Reference Files
- **Use prefix with year** for provenance
- Examples: `martin-srp-2014.md`, `wcag-21.md`
- **Rationale**: Preserves author/year information, aids citation tracing

## Wikilink Rules

### 6. Wikilinks
- **Include folder path** when linking to files in other folders
  - Good: `[[ShadCN/shadcn-ui-patterns]]`
  - Bad: `[[shadcn-ui-patterns]]` (when file is in ShadCN/ folder)
- **Use relative paths** from current file location
- **Use display text** for clarity when needed
  - Example: `[[Cascading Stylesheets/css-fundamentals|CSS fundamentals]]`
- **Convert cross-folder links** to include folder prefix
- **Convert index file links** to point to actual location
  - Example: `[[Architecture/00-architecture-index]]` instead of `[[00-architecture-index]]`

## Summary

| Element | Convention | Example |
|---------|------------|---------|
| Folders | Title Case with spaces | `Cascading Stylesheets/` |
| Files | kebab-case | `css-fundamentals.md` |
| Indexes | Numeric prefix | `00-architecture-index.md` |
| Status | Title Case | `Research-Status.md` |
| Sources | Author/year prefix | `martin-srp-2014.md` |
| Slugs | Match filename | `slug: css-fundamentals` |
| Wikilinks | Include folder path | `[[ShadCN/shadcn-ui-patterns]]` |

1. **No ambiguous names**: Every filename must clearly indicate its content
2. **No duplicate basenames**: Two files cannot have the same name in different folders (case-insensitive check required)
3. **Preserve proper nouns**: Author names, product names, acronyms preserved as-is
4. **Preserve dates/versions**: When meaningful, include in filename
5. **No numeric prefixes except for indexes**: Avoid `01-`, `02-` unless sorting is critical
6. **Consistent casing within category**: All files in a folder follow the same pattern

## Exceptions

| File/Folder | Current | Proposed | Reason |
|-------------|---------|----------|--------|
| `00-architecture-index.md` | Title Case + numeric prefix | Keep as-is | Index file, numeric prefix justified |
| `Research-Status.md` | Title Case | Keep as-is | Status file, Title Case appropriate |
| `APIs Distributed Systems/` | Title Case + space | Keep as-is | Folder, Title Case appropriate |

## Validation

- [ ] All folder names follow Title Case with spaces
- [ ] All file names follow kebab-case (except indexes and status files)
- [ ] No duplicate basenames (case-insensitive)
- [ ] No ambiguous filenames
- [ ] Proper nouns preserved
- [ ] Dates/versions preserved where meaningful
