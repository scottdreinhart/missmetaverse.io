# Purpose

Architecture patterns, principles, and design decisions. Acts as the central index for architectural knowledge.

# Ownership

- Owner: project team
- Scope: all content under `.obsidian-vault/specs/Architecture/`

# Local Contracts

- 281+ files — largest domain in the vault
- Contains both detailed notes and stub/duplicate files
- Stub files use `-stub` suffix (e.g., `css-fundamentals-stub.md`)
- Original files use `-original` suffix (e.g., `css-fundamentals-original.md`)
- Many files are duplicates of notes in more specific folders — intentional reference copies

# Work Guidance

- New architecture notes go here unless they belong in a specific domain folder
- When a note is domain-specific (CSS, React, TypeScript, etc.), put it in that folder instead
- Use `00-architecture-index.md` as the master index
- Cross-reference specific domain notes from here

# Verification

- Check for duplicate slugs before creating new files
- Verify `00-architecture-index.md` is up to date
- Run `_maintenance/inventory-script.ps1` to detect orphans

# Child DOX Index

None. This is a leaf domain.
