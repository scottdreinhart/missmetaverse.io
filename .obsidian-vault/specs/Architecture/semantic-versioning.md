---
slug: semantic-versioning
sources:
  - https://semver.org/
  - https://en.wikipedia.org/wiki/Versioning
date: 2026-11-02
tags:
  - semver
  - versioning
  - dependencies
  - releases
---

# Semantic Versioning

## Definition

Semantic Versioning (SemVer) is a **versioning scheme that uses MAJOR.MINOR.PATCH format to communicate changes**.

> "Semantic Versioning 2.0.0 specifies a simple set of rules about what you should and should not do when you bump your version number." — SemVer.org

## Problem Addressed

Without semantic versioning:
- **Confusion**: Users don't know what changed
- **Breaking changes**: Users don't know when changes break their code
- **Compatibility**: Hard to know which versions are compatible
- **Automation**: Hard to automate releases

## Scope and Boundaries

- SemVer ≠ Calendar versioning (SemVer is about changes, calendar is about time)
- SemVer ≠ API versioning (SemVer is for packages, API versioning is for APIs)
- SemVer is a **versioning scheme**, not a specific technique

## When to Apply

- When building libraries or packages
- When releasing software
- When compatibility matters
- When automation is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — SemVer is complex |
| **Time** — Managing versions takes time |
| **Confusion** — SemVer is hard to understand |

## Common Misuses

- **Everything versioned**: Not everything needs semantic versioning
- **Confusing with API versioning**: SemVer ≠ API versioning
- **Over-versioning**: Too much versioning creates complexity

## Related Concepts

- [Dependency Management](Architecture/dependency-management.md) — SemVer with dependency management
- [API Versioning](Architecture/api-versioning.md) — SemVer with API versioning
- [Releases](Architecture/architecture-patterns.md) — SemVer with releases

## Project Observations

- The project uses semantic versioning:
  - The project's release-it note covers semantic versioning (from existing notes)
  - No evidence of semantic versioning in existing code (src/ is empty)
- File naming conventions support semantic versioning:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
