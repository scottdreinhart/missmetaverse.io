---
slug: entity-file-convention
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

# *.entity.ts

## Definition

`*.entity.ts` is **a file naming convention for TypeScript files that contain DDD entity definitions**.

> "The *.entity.ts convention identifies TypeScript files that contain DDD entity definitions." — TypeScript Docs

## Problem Addressed

Without `*.entity.ts` convention:
- **Confusion**: Don't know which files contain entity definitions
- **Mixing concerns**: Entities are mixed with business logic
- **Testing**: Hard to test entities separately
- **Maintenance**: Hard to maintain entities

## Scope and Boundaries

- `*.entity.ts` ≠ `*.value-object.ts` (`*.entity.ts` is for entities, `*.value-object.ts` is for value objects)
- `*.entity.ts` = Entities (`*.entity.ts` is for entity definitions)
- `*.entity.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building DDD applications
- when entity pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every entity needs a separate file |

## Common Misuses

- **Everything an entity**: Not every domain object needs an entity file
- **Mixing concerns**: Entity files should not contain business logic
- **Confusing with value object**: Entity files contain entities, value object files contain value objects

## Related Concepts

- [Entity (DDD)](DDD/entity.md) — Entity pattern is the pattern behind `*.entity.ts`
- [Value Object File Convention](Project File Conventions/value-object-file-convention.md) — Value object file convention is related
- [DDD Patterns](Architecture/ddd-patterns.md) — DDD patterns use `*.entity.ts`

## Project Observations

- The project uses `*.entity.ts`:
  - TypeScript supports `*.entity.ts` through module system
  - React supports `*.entity.ts` through entity definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.entity.ts` in existing code (src/ is empty)
- File naming conventions support `*.entity.ts`:
  - `*.entity.ts` — Entity files
  - `*.value-object.ts` — Value object files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

