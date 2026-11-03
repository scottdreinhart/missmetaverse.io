---
slug: exhaustive-handling
sources:
  - https://www.typescriptlang.org/
  - https://react.dev/
date: 2026-11-02
tags:
  - exhaustive-handling
  - typescript
  - type-system
  - patterns
  - --
# Exhaustive Handling

## Definition

Exhaustive Handling is **a TypeScript pattern that ensures all possible cases are handled, typically using discriminated unions and the `never` type**.

> "Exhaustive handling ensures that all possible cases in a discriminated union are handled, using the `never` type to catch missing cases." â€” TypeScript Docs

## Problem Addressed

Without exhaustive handling:
- **Missing cases**: Not all cases are handled
- **Runtime errors**: Runtime errors when unhandled cases occur
- **Maintenance**: Adding new cases requires updating all handlers
- **Type safety**: Type system doesn't catch missing cases

## Scope and Boundaries

- Exhaustive Handling â‰  Type Narrowing (exhaustive handling ensures all cases are handled, type narrowing narrows types)
- Exhaustive Handling = Completeness (exhaustive handling ensures completeness)
- Exhaustive Handling is a **TypeScript pattern**, not a design pattern

## When to Apply

- When using discriminated unions
- when all cases must be handled
- when new cases may be added in the future
- when type safety is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Exhaustive handling adds boilerplate |
| **Time** â€” Writing exhaustive handlers takes time |
| **Over-exhaustive**: Not every union needs exhaustive handling |

## Common Misuses

- **Everything exhaustive**: Not every union needs exhaustive handling
- **Ignoring the never type**: The `never` type is key to exhaustive handling
- **Confusing with type narrowing**: Exhaustive handling ensures all cases are handled, type narrowing narrows types

## Related Concepts

- [Discriminated Unions](Architecture/discriminated-unions.md) â€” Discriminated unions enable exhaustive handling
- [Type Guards](Architecture/type-guards.md) â€” Type guards enable exhaustive handling
- [Type Narrowing](Architecture/type-narrowing.md) â€” Type narrowing is related to exhaustive handling

## Project Observations

- The project uses exhaustive handling:
  - TypeScript supports exhaustive handling through discriminated unions
  - The project's architecture patterns note covers TypeScript concepts
  - No evidence of exhaustive handling in existing code (src/ is empty)
- File naming conventions support exhaustive handling:
  - `*.types.ts` â€” Type files
  - `*.schema.ts` â€” Schema files

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]


