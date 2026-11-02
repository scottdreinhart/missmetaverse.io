---
slug: mapper-file-convention
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

# *.mapper.ts

## Definition

`*.mapper.ts` is **a file naming convention for TypeScript files that contain data mapping logic between different representations (e.g., DTO to entity)**.

> "The *.mapper.ts convention identifies TypeScript files that contain data mapping logic." — TypeScript Docs

## Problem Addressed

Without `*.mapper.ts` convention:
- **Confusion**: Don't know which files contain mapping logic
- **Mixing concerns**: Mapping logic is mixed with business logic
- **Testing**: Hard to test mapping logic separately
- **Maintenance**: Hard to maintain mapping logic

## Scope and Boundaries

- `*.mapper.ts` ≠ `*.logic.ts` (`*.mapper.ts` is for mapping, `*.logic.ts` is for business logic)
- `*.mapper.ts` = Mapping (`*.mapper.ts` is for data mapping)
- `*.mapper.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building TypeScript applications with data transformation
- when mapping between DTOs and entities is needed
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every mapping needs a separate file |

## Common Misuses

- **Everything a mapper**: Not every transformation needs a mapper file
- **Mixing concerns**: Mapper files should not contain business logic
- **Confusing with logic**: Mapper files contain mapping logic, logic files contain business logic

## Related Concepts

- [Data Transfer Objects](Architecture/data-transfer-objects.md) — DTOs use mappers
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — Data mapper pattern is related
- [Logic File Convention](Project File Conventions/logic-file-convention.md) — Logic file convention separates business logic

## Project Observations

- The project uses `*.mapper.ts`:
  - TypeScript supports `*.mapper.ts` through module system
  - React supports `*.mapper.ts` through data transformation
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.mapper.ts` in existing code (src/ is empty)
- File naming conventions support `*.mapper.ts`:
  - `*.mapper.ts` — Mapper files
  - `*.data.ts` — Data files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
