---
slug: commitlint-patterns
sources:
  - https://commitlint.js.org/
  - https://www.conventionalcommits.org/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - commitlint
  - commits
  - linting
  - patterns
---

# commitlint Patterns

## Definition

commitlint Patterns are **design patterns for working with commitlint for linting commit messages**.

> "commitlint helps to lint your commit messages." — commitlint Docs

## Problem Addressed

Without commitlint patterns:
- **Commit consistency**: Commits are inconsistent
- **Changelog**: Changelog is hard to generate
- **Release**: Release is hard to automate
- **Maintenance**: Hard to maintain commits

## Scope and Boundaries

- commitlint Patterns ≠ commitlint (commitlint patterns are patterns, commitlint is a tool)
- commitlint Patterns ≠ Conventional Commits (commitlint patterns are patterns, conventional commits are a standard)
- commitlint Patterns is a **patterns**, not a tool

## When to Apply

- When building applications
- when commit consistency matters
- when changelog is important
- when release is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — commitlint patterns are complex |
| **Time** — commitlint patterns take time |
| **Over-commitlint** — Don't use commitlint for everything |

## Common Misuses

- **Everything commitlint**: Not everything needs commitlint patterns
- **Confusing with commitlint**: commitlint patterns ≠ commitlint
- **Over-commitlint**: Too much commitlint creates complexity

## Related Concepts

- [Commit Management](../Commit%20Management/commit-management-integration.md) — commitlint patterns with commit management
- [Conventional Commits](Architecture/conventional-commits.md) — commitlint patterns with conventional commits
- [Husky Patterns](Architecture/husky-patterns.md) — commitlint patterns with Husky

## Project Observations

- The project uses commitlint patterns:
  - The project's commitlint note covers commitlint patterns (from existing notes)
  - No evidence of commitlint patterns in existing code (src/ is empty)
- File naming conventions support commitlint patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




