---
slug: dependency-management
sources:
  - https://pnpm.io/
  - https://docs.npmjs.com/about-semantic-versioning
date: 2026-11-02
tags:
  - dependency-management
  - pnpm
  - npm
  - versioning
---

# Dependency Management

## Definition

Dependency Management is a **practice of controlling which versions of external packages are used in a project**.

> "Dependency management is the act of managing transitive dependencies used by computer software." — Wikipedia

## Problem Addressed

Without dependency management:
- **Conflicts**: Different packages need different versions
- **Security**: Outdated packages have vulnerabilities
- **Reproducibility**: Builds are not reproducible
- **Stability**: Dependencies change unexpectedly

## Scope and Boundaries

- Dependency Management ≠ Package Management (dependency management is about versions, package management is about installation)
- Dependency Management ≠ Semantic Versioning (dependency management uses semver, but is broader)
- Dependency Management is a **management practice**, not a specific technique

## When to Apply

- When building software
- When using external packages
- When reproducibility matters
- When security is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Dependency management is complex |
| **Time** — Managing dependencies takes time |
| **Conflicts** — Dependency conflicts are hard to resolve |

## Common Misuses

- **Everything managed**: Not everything needs dependency management
- **Confusing with package management**: Dependency management ≠ package management
- **Over-managing**: Too much management creates complexity

## Related Concepts

- [pnpm](../Package%20Manager/pnpm-workspace.md) — Dependency management with pnpm
- [Semantic Versioning](Architecture/architecture-patterns.md) — Dependency management with semver
- [Security Principles](Architecture/security-principles.md) — Dependency management with security

## Project Observations

- The project uses dependency management:
  - pnpm is configured for dependency management (from existing notes)
  - The project's pnpm note covers dependency management
  - No evidence of dependency management in existing code (src/ is empty)
- File naming conventions support dependency management:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
