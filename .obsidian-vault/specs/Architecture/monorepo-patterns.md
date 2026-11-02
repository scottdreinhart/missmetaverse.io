---
slug: monorepo-patterns
sources:
  - https://en.wikipedia.org/wiki/Monorepo
  - https://pnpm.io/workspaces
date: 2026-11-02
tags:
  - monorepo
  - workspace
  - package-manager
  - patterns
---

# Monorepo Patterns

## Definition

Monorepo Patterns are **design patterns for working with monorepositories**.

> "A monorepo is a single repository that contains multiple discrete projects." — Wikipedia

## Problem Addressed

Without monorepo patterns:
- **Dependency management**: Dependencies are hard to manage
- **Code sharing**: Code is hard to share
- **Testing**: Hard to test multiple projects
- **Maintenance**: Hard to maintain multiple projects

## Scope and Boundaries

- Monorepo Patterns ≠ Monorepo (monorepo patterns are patterns, monorepo is a structure)
- Monorepo Patterns ≠ Workspace (monorepo patterns are patterns, workspace is a feature)
- Monorepo Patterns is a **patterns**, not a structure

## When to Apply

- When building multiple projects
- when code sharing matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Monorepo patterns are complex |
| **Time** — Monorepo patterns take time |
| **Over-monorepo** — Don't use monorepo for everything |

## Common Misuses

- **Everything monorepo**: Not everything needs monorepo patterns
- **Confusing with monorepo**: Monorepo patterns ≠ monorepo
- **Over-monorepo**: Too many monorepos create complexity

## Related Concepts

- [pnpm Workspace](Architecture/pnpm-workspace.md) — Monorepo patterns with pnpm
- [Dependency Management](Architecture/dependency-management.md) — Monorepo patterns with dependency management
- [CI/CD](Architecture/ci-cd.md) — Monorepo patterns with CI/CD

## Project Observations

- The project uses monorepo patterns:
  - The project's architecture patterns note covers monorepo patterns (from existing notes)
  - No evidence of monorepo patterns in existing code (src/ is empty)
- File naming conventions support monorepo patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
