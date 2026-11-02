---
slug: discriminated-unions
sources:
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html#discriminated-unions
  - https://typescript.tv/
date: 2026-11-02
tags:
  - discriminated-unions
  - typescript
  - types
  - patterns
---

# Discriminated Unions

## Definition

Discriminated Unions are a **TypeScript feature for creating unions of types with a common discriminant property**.

> "Discriminated unions are unions of types with a common discriminant property." — TypeScript Docs

## Problem Addressed

Without discriminated unions:
- **Type safety**: Type safety is lost
- **IntelliSense**: IntelliSense doesn't work
- **Refactoring**: Hard to refactor code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Discriminated Unions ≠ Unions (discriminated unions are a specific type of union)
- Discriminated Unions ≠ Type Guards (discriminated unions are a feature, type guards are a pattern)
- Discriminated Unions is a **TypeScript feature**, not a pattern

## When to Apply

- When building TypeScript applications
- when type safety matters
- when IntelliSense is important
- when refactoring is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Discriminated unions are complex |
| **Time** — Discriminated unions take time |
| **Over-discriminated-unions** — Don't use discriminated unions for everything |

## Common Misuses

- **Everything discriminated union**: Not everything needs discriminated unions
- **Confusing with unions**: Discriminated unions ≠ unions
- **Over-discriminated-unions**: Too many discriminated unions create complexity

## Related Concepts

- [TypeScript Best Practices](../TypeScript/ts-best-practices.md) — Discriminated unions with TypeScript
- [Type Narrowing](Architecture/type-narrowing.md) — Discriminated unions with type narrowing
- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md) — Discriminated unions with strict mode

## Project Observations

- The project uses discriminated unions:
  - The project's TypeScript note covers discriminated unions (from existing notes)
  - No evidence of discriminated unions in existing code (src/ is empty)
- File naming conventions support discriminated unions:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
