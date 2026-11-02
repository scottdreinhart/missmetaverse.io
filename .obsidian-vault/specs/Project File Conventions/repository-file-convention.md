---
slug: repository-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
---

# *.repository.ts

## Definition

`*.repository.ts` is **a file naming convention for TypeScript files that contain repository implementations for data access**.

> "The *.repository.ts convention identifies TypeScript files that contain repository implementations." — TypeScript Docs

## Problem Addressed

Without `*.repository.ts` convention:
- **Confusion**: Don't know which files contain repository implementations
- **Mixing concerns**: Repositories are mixed with business logic
- **Testing**: Hard to test repositories separately
- **Maintenance**: Hard to maintain repositories

## Scope and Boundaries

- `*.repository.ts` ≠ `*.port.ts` (`*.repository.ts` is for implementations, `*.port.ts` is for interfaces)
- `*.repository.ts` = Repositories (`*.repository.ts` is for repository implementations)
- `*.repository.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building applications with data access
- when repository pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every repository needs a separate file |

## Common Misuses

- **Everything a repository**: Not every data access needs a repository file
- **Mixing concerns**: Repository files should not contain business logic
- **Confusing with port**: Repository files contain implementations, port files contain interfaces

## Related Concepts

- [Repository Pattern](Architecture/repository-pattern.md) — Repository pattern is the pattern behind `*.repository.ts`
- [Port File Convention](Project File Conventions/port-file-convention.md) — Port file convention defines repository interfaces
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — Data mapper pattern is related

## Project Observations

- The project uses `*.repository.ts`:
  - TypeScript supports `*.repository.ts` through module system
  - React supports `*.repository.ts` through data access
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.repository.ts` in existing code (src/ is empty)
- File naming conventions support `*.repository.ts`:
  - `*.repository.ts` — Repository files
  - `*.port.ts` — Port files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
