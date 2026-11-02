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
---

# Conventional Commits

## Definition

Conventional Commits is a **convention for writing commit messages**.

> "Conventional Commits is a specification for adding human and system readable meaning to commit messages." — Conventional Commits

## Problem Addressed

Without conventional commits:
- **Commit consistency**: Commits are inconsistent
- **Changelog**: Changelog is hard to generate
- **Release**: Release is hard to automate
- **Maintenance**: Hard to maintain commits

## Scope and Boundaries

- Conventional Commits ≠ commitlint (conventional commits is a convention, commitlint is a tool)
- Conventional Commits ≠ Git (conventional commits is a convention, git is a tool)
- Conventional Commits is a **convention**, not a tool

## When to Apply

- When building applications
- when commit consistency matters
- when changelog is important
- when release is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Conventional commits are complex |
| **Time** — Conventional commits take time |
| **Over-conventional-commits** — Don't use conventional commits for everything |

## Common Misuses

- **Everything conventional commits**: Not everything needs conventional commits
- **Confusing with commitlint**: Conventional commits ≠ commitlint
- **Over-conventional-commits**: Too much conventional commits creates complexity

## Related Concepts

- [commitlint Patterns](Architecture/commitlint-patterns.md) — Conventional commits with commitlint
- [Commit Management](../Commit%20Management/commit-management-integration.md) — Conventional commits with commit management
- [Husky Patterns](Architecture/husky-patterns.md) — Conventional commits with Husky

## Project Observations

- The project uses conventional commits:
  - The project's commit management note covers conventional commits (from existing notes)
  - No evidence of conventional commits in existing code (src/ is empty)
- File naming conventions support conventional commits:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

