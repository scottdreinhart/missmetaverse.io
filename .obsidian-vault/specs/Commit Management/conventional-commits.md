---
slug: conventional-commits
tags:
  - core-concepts

  - git   - version-control   - conventions
---

# Conventional Commits

> **Purpose:** Standardize commit messages with Conventional Commits.
> **Last Updated:** 2026-11-03

## concept_id
`conventional-commits`

## title
Conventional Commits

## aliases
- Conventional Commits
- Conventional Commit Messages
- Conventional Commit Specification

## category
commit-management

## concept_type
commit-convention

## research_status
verified

## project_adoption
declared

## applicability
- Git repositories
- Commit message standardization
- Automated changelogs
- Semantic versioning

## tags
- type/convention
- domain/commit
- status/verified
- priority/high

## source_ids
- conventional-commits-specification
- martinfowler-patterns

## related_concept_ids
- commitizen-cz-git
- commitlint-cli-config
- conventional-changelog
- husky-git-hooks

## Definition

Conventional Commits is a specification for adding human and machine-readable meaning to commit messages, enabling automated changelogs and semantic versioning.

## Problem Addressed

Without Conventional Commits:
- Commit messages are inconsistent
- Changelogs are manual
- Versioning is difficult
- History is unclear

## Scope of Boundaries

Conventional Commits applies to:
- Commit message standardization
- Automated changelogs
- Semantic versioning
- Git history

Conventional Commits does not apply to:
- Branch naming
- Pull request templates
- Code review
- Testing

## When to Apply

- Setting up Git repositories
- Standardizing commit messages
- Automating changelogs
- Semantic versioning

## Tradeoffs and When to Avoid

- **Rigidity**: Conventional Commits can be rigid
- **Not for simple projects**: Simple projects don't need Conventional Commits
- **Not for SVN**: Conventional Commits is for Git only
- **Not for CI/CD**: Conventional Commits doesn't affect CI/CD

## Implementation Guidance

1. **Install commitlint**: Install commitlint
2. **Configure rules**: Configure commitlint rules
3. **Add husky**: Add husky for git hooks
4. **Validate commits**: Validate commits automatically
5. **Generate changelog**: Generate changelog automatically

## Verification

- [ ] commitlint is installed
- [ ] Rules are configured
- [ ] Husky is added
- [ ] Commits are validated
- [ ] Changelog is generated

## Common Misuses

- **Not installing**: Not installing commitlint
- **Not configuring**: Not configuring rules
- **Not adding husky**: Not adding husky
- **Not validating**: Not validating commits

## Related Concepts

- [[Commit Management/conventional-commits]] â€” Commitizen CZ Git
- [[Commit Management/conventional-commits]] â€” Commitlint CLI Config
- [[Commit Management/conventional-commits]] â€” Conventional Changelog
- [[Commit Management/conventional-commits]] â€” Husky Git Hooks

## Project Observations

The project uses Conventional Commits through:
- Commit message standardization
- Automated changelogs
- Semantic versioning
- Git history

## Sources

- [[Commit Management/conventional-commits|Conventional Commits Specification]]
- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Conventional Commits Note**
