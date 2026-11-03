---
slug: conventional-commits
sources:
  - https://www.conventionalcommits.org/
  - https://www.npmjs.com/package/@commitlint/config-conventional
date: 2026-11-02
tags:
  - conventional-commits
  - commits
  - linting
  - patterns
# Conventional Commits

## Definition

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Conventional Commits is a **convention for writing commit messages**.

> "Conventional Commits is a specification for adding human and system readable meaning to commit messages." â€” Conventional Commits

## Problem Addressed

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without conventional commits:
- **Commit consistency**: Commits are inconsistent
- **Changelog**: Changelog is hard to generate
- **Release**: Release is hard to automate
- **Maintenance**: Hard to maintain commits

## Scope and Boundaries

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Conventional Commits â‰  commitlint (conventional commits is a convention, commitlint is a tool)
- Conventional Commits â‰  Git (conventional commits is a convention, git is a tool)
- Conventional Commits is a **convention**, not a tool

## When to Apply

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when commit consistency matters
- when changelog is important
- when release is important

## Tradeoffs and When to Avoid

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Conventional commits are complex |
| **Time** â€” Conventional commits take time |
| **Over-conventional-commits** â€” Don't use conventional commits for everything |

## Common Misuses

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything conventional commits**: Not everything needs conventional commits
- **Confusing with commitlint**: Conventional commits â‰  commitlint
- **Over-conventional-commits**: Too much conventional commits creates complexity

## Related Concepts

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [commitlint Patterns](Architecture/commitlint-patterns.md) â€” Conventional commits with commitlint
- [Commit Management](../Commit%20Management/commit-management-integration.md) â€” Conventional commits with commit management
- [Husky Patterns](Architecture/husky-patterns.md) â€” Conventional commits with Husky

## Project Observations

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses conventional commits:
  - The project's commit management note covers conventional commits (from existing notes)
  - No evidence of conventional commits in existing code (src/ is empty)
- File naming conventions support conventional commits:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]

---

## Decision Tree: Commit Message Type

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
```mermaid
graph TD
    A[Need to commit?]\n    A --> B{What changed?}
    B -->|New feature| C[feat]
    B -->|Bug fix| D[fix]
    B -->|Docs only| E[docs]
    B -->|Style change| F[style]
    B -->|Refactor| G[refactor]
    B -->|Performance| H[perf]
    B -->|Test change| I[test]
    B -->|Build change| J[build]
    B -->|CI change| K[ci]
    B -->|Chore| L[chore]
    B -->|Revert| M[revert]
    C --> N{Breaking?}
    N -->|Yes| O[feat! or feat: breaking]
    N -->|No| P[feat: add login]
```

### When to Use Each Commit Type

| Type | When to Use | Example |
|------|-------------|---------|
| **feat** | New feature | feat: add user login |
| **fix** | Bug fix | fix: correct validation |
| **docs** | Documentation only | docs: update README |
| **style** | Code style (no logic change) | style: fix formatting |
| **refactor** | Code refactoring | refactor: extract service |
| **perf** | Performance improvement | perf: optimize query |
| **test** | Adding tests | test: add unit tests |
| **build** | Build system changes | build: update dependencies |
| **ci** | CI/CD changes | ci: add GitHub Actions |
| **chore** | Other changes | chore: update config |
| **revert** | Revert commit | revert: revert abc123 |

---

## Procedural Guidance: Conventional Commits Setup

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### Step 1: Install commitlint

```bash
# Install commitlint
pnpm add -D @commitlint/cli @commitlint/config-conventional

# Configure commitlint
echo "module.exports = { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js
```

### Step 2: Install Husky

```bash
# Install Husky
pnpm add -D husky

# Initialize Husky
npx husky init

# Add commit-msg hook
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit ${1}'
```

### Step 3: Write Commit Messages

```bash
# Format: <type>(<scope>): <description>

# Examples:
git commit -m "feat(auth): add login endpoint"
git commit -m "fix(api): correct validation error"
git commit -m "docs(readme): update installation steps"
git commit -m "refactor(user): extract service layer"
git commit -m "test(auth): add unit tests for login"

# Breaking changes:
git commit -m "feat(api)!: change user endpoint structure"
git commit -m "feat(api): change user endpoint structure

BREAKING CHANGE: User endpoint now returns { id, name } instead of { userId, userName }"
```

### Step 4: Generate Changelog

```bash
# Install conventional-changelog
pnpm add -g conventional-changelog-cli

# Generate changelog
conventional-changelog -p angular -i CHANGELOG.md -s

# Generate for specific version
conventional-changelog -p angular -i CHANGELOG.md -s -r 0
```

### Step 5: Auto-release with Changesets

```bash
# Install changesets
pnpm add -D @changesets/cli

# Initialize changesets
npx changeset init

# Create changeset
npx changeset

# Build and version
pnpm changeset version

# Publish
pnpm changeset publish
```

---

## Copilot Instructions

## concept_id
a056-conventional-commits

## title
Conventional Commits

## aliases
- A056-conventional-commits

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### When to Read This Note
- Writing commit messages
- Setting up commit linting
- Generating changelogs
- Automating releases
- Enforcing commit conventions

### What to Do With This Information
1. **Use conventional commits**: Follow the type/scope/description format
2. **Install commitlint**: Enforce commit message conventions
3. **Install Husky**: Pre-commit hooks for validation
4. **Generate changelogs**: Auto-generate from commit history
5. **Auto-release**: Use changesets for automated releases

### Tools to Use
- **VS Code Extension**: GitLens â€” for Git history visualization
- **VS Code Extension**: Error Lens â€” for inline commit lint errors
- **npm Package**: `@commitlint/cli` â€” for commit message linting
- **npm Package**: `husky` â€” for Git hooks
- **npm Package**: `@changesets/cli` â€” for automated releases
- **Terminal Command**: `npx commitlint --edit ${1}` â€” lint commit message
- **Terminal Command**: `npx changeset` â€” create changeset

### Agents to Invoke
- **Code Review Agent**: Run when reviewing PRs with multiple commits
- **Testing Agent**: Run when test files are changed

### Integration with Other Notes
- Read [commitizen-cz-git](D/commitizen-cz-git.md) for commitizen configuration
- Read [commitlint-cli-config](D/commitlint-cli-config.md) for commitlint configuration
- Read [conventional-changelog](D/conventional-changelog.md) for changelog generation
- Read [husky-git-hooks](D/husky-git-hooks.md) for Husky configuration
- Read [commit-management-integration](D/commit-management-integration.md) for commit management integration
- Read [pnpm-workspace](D/pnpm-workspace.md) for workspace management

### Common Pitfalls
- Don't skip commit types (always use feat/fix/docs/etc.)
- Don't forget scope (add scope when helpful)
- Don't ignore breaking changes (mark with ! or BREAKING CHANGE)
- Don't skip changelog generation (auto-generate from commits)
- Don't manually version (use changesets)

### Quick Validation Checklist
- [ ] Are commit messages following conventional format?
- [ ] Is commitlint installed and configured?
- [ ] Is Husky set up for pre-commit hooks?
- [ ] Is changelog generated automatically?
- [ ] Are breaking changes marked correctly?
- [ ] Are scopes used consistently?




