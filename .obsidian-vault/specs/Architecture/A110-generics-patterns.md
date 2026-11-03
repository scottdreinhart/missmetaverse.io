---
slug: generics-patterns
sources:
  - https://www.typescriptlang.org/docs/handbook/2/generics.html
  - https://typescript.tv/
date: 2026-11-02
tags:
  - priority/low
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - domain/frontend
  - status/complete
  - type/reference
  - domain/architecture
  - generics
  - typescript
  - types
  - patterns
---

# Generics Patterns

## Definition

Generics Patterns are **design patterns for working with TypeScript generics**.

> "Generics allow you to create reusable code that works with a variety of types." — TypeScript Docs

## Problem Addressed

Without generics patterns:
- **Type safety**: Type safety is lost
- **Code reuse**: Code is duplicated
- **IntelliSense**: IntelliSense doesn't work
- **Refactoring**: Hard to refactor code

## Scope and Boundaries

- Generics ≠ Type Parameters (generics are a feature, type parameters are a specific use)
- Generics ≠ Type Constraints (generics are a feature, type constraints are a specific use)
- Generics is a **TypeScript feature**, not a pattern

## When to Apply

- When building TypeScript applications
- when code reuse matters
- when type safety is important
- when refactoring is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Generics are complex |
| **Time** — Generics take time |
| **Over-generics** — Don't use generics for everything |

## Common Misuses

- **Everything generic**: Not everything needs generics
- **Confusing with type parameters**: Generics ≠ type parameters
- **Over-generics**: Too many generics create complexity

## Related Concepts

- [TypeScript Best Practices](../TypeScript/ts-best-practices.md) — Generics with TypeScript
- [TypeScript Advanced Types](../TypeScript/ts-advanced-types.md) — Generics with advanced types
- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md) — Generics with strict mode

## Project Observations

- The project uses generics:
  - The project's TypeScript note covers generics (from existing notes)
  - No evidence of generics in existing code (src/ is empty)
- File naming conventions support generics:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




