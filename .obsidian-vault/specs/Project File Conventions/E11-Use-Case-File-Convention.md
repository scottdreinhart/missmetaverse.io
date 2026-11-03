---
slug: use-case-file-convention
sources:
  - https://www.typescriptlang.org/
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

# *.use-case.ts

## Definition

`*.use-case.ts` is **a file naming convention for TypeScript files that contain use case implementations (application services)**.

> "The *.use-case.ts convention identifies TypeScript files that contain use case implementations." — TypeScript Docs

## Problem Addressed

Without `*.use-case.ts` convention:
- **Confusion**: Don't know which files contain use case implementations
- **Mixing concerns**: Use cases are mixed with business logic
- **Testing**: Hard to test use cases separately
- **Maintenance**: Hard to maintain use cases

## Scope and Boundaries

- `*.use-case.ts` ≠ `*.logic.ts` (`*.use-case.ts` is for use cases, `*.logic.ts` is for general business logic)
- `*.use-case.ts` = Use Cases (`*.use-case.ts` is for use case implementations)
- `*.use-case.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building applications with use case driven design
- when use case pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every use case needs a separate file |

## Common Misuses

- **Everything a use case**: Not every operation needs a use case file
- **Mixing concerns**: Use case files should not contain domain logic
- **Confusing with logic**: Use case files contain use case implementations, logic files contain business logic

## Related Concepts

- [Use Case Driven Design](Architecture/use-case-driven-design.md) — Use case driven design uses `*.use-case.ts`
- [Logic File Convention](Project File Conventions/logic-file-convention.md) — Logic file convention separates business logic
- [Application Service](DDD/application-service.md) — Application service is the pattern behind `*.use-case.ts`

## Project Observations

- The project uses `*.use-case.ts`:
  - TypeScript supports `*.use-case.ts` through module system
  - React supports `*.use-case.ts` through use case implementations
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.use-case.ts` in existing code (src/ is empty)
- File naming conventions support `*.use-case.ts`:
  - `*.use-case.ts` — Use case files
  - `*.logic.ts` — Logic files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]



