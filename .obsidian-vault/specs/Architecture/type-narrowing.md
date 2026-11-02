---
slug: type-narrowing
sources:
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
  - https://typescript.tv/
date: 2026-11-02
tags:
  - type-narrowing
  - typescript
  - types
  - patterns
---

# Type Narrowing

## Definition

Type Narrowing is a **TypeScript feature for narrowing the type of a variable within a scope**.

> "Type narrowing is the process of narrowing the type of a variable within a scope." — TypeScript Docs

## Problem Addressed

Without type narrowing:
- **Type safety**: Type safety is lost
- **IntelliSense**: IntelliSense doesn't work
- **Refactoring**: Hard to refactor code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Type Narrowing ≠ Type Assertion (type narrowing narrows types, type assertion overrides types)
- Type Narrowing ≠ Type Checking (type narrowing narrows types, type checking checks types)
- Type Narrowing is a **TypeScript feature**, not a type assertion

## When to Apply

- When building TypeScript applications
- when type safety matters
- when IntelliSense is important
- when refactoring is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Type narrowing is complex |
| **Time** — Type narrowing takes time |
| **Over-narrowing** — Don't narrow everything |

## Common Misuses

- **Everything narrowed**: Not everything needs type narrowing
- **Confusing with type assertion**: Type narrowing ≠ type assertion
- **Over-narrowing**: Too much narrowing creates complexity

## Related Concepts

- [TypeScript Best Practices](../TypeScript/ts-best-practices.md) — Type narrowing with TypeScript
- [TypeScript Narrowing](../TypeScript/ts-narrowing.md) — Type narrowing with TypeScript
- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md) — Type narrowing with strict mode

## Project Observations

- The project uses type narrowing:
  - The project's TypeScript note covers type narrowing (from existing notes)
  - No evidence of type narrowing in existing code (src/ is empty)
- File naming conventions support type narrowing:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
