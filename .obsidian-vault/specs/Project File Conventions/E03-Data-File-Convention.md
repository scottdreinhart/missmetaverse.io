---
slug: data-file-convention
sources:
  - https://react.dev/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - type/reference
  - file-conventions
  - react
  - typescript
  - project-structure
---

# *.data.ts

## Definition

`*.data.ts` is **a file naming convention for TypeScript files that contain data definitions, constants, and configuration data**.

> "The *.data.ts convention identifies TypeScript files that contain data definitions and constants." — React Docs

## Problem Addressed

Without `*.data.ts` convention:
- **Confusion**: Don't know which files contain data definitions
- **Mixing concerns**: Data is mixed with business logic
- **Testing**: Hard to test data definitions separately
- **Maintenance**: Hard to maintain data definitions

## Scope and Boundaries

- `*.data.ts` ≠ `*.logic.ts` (`*.data.ts` is for data, `*.logic.ts` is for business logic)
- `*.data.ts` = Data (`*.data.ts` is for data definitions)
- `*.data.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building React applications
- when separating data from business logic is important
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every data file needs a separate file |

## Common Misuses

- **Everything a data file**: Not every data definition needs a separate file
- **Mixing concerns**: Data files should not contain business logic
- **Confusing with types**: Data files contain data, type files contain types

## Related Concepts

- [Types File Convention](Project File Conventions/types-file-convention.md) — Types file convention is related
- [Logic File Convention](Project File Conventions/logic-file-convention.md) — Logic file convention separates business logic
- [Schema File Convention](Project File Conventions/schema-file-convention.md) — Schema file convention defines data schemas

## Project Observations

- The project uses `*.data.ts`:
  - TypeScript supports `*.data.ts` through module system
  - React supports `*.data.ts` through data definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.data.ts` in existing code (src/ is empty)
- File naming conventions support `*.data.ts`:
  - `*.data.ts` — Data files
  - `*.types.ts` — Type files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]



