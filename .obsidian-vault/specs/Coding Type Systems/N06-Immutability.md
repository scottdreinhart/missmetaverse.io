---
slug: Coding Type Systems/immutability
sources:
  - https://www.typescriptlang.org/
  - https://react.dev/
date: 2026-11-02
tags:
  - immutability
  - typescript
  - type-system
  - patterns
  - --
# Immutability

## Definition

Immutability is **a programming principle where data cannot be modified after creation, preventing unexpected side effects**.

> "Immutability means that data cannot be modified after creation. In TypeScript, this is enforced through `readonly` and `as const`." â€” TypeScript Docs

## Problem Addressed

Without immutability:
- **Side effects**: Data is modified unexpectedly
- **Bugs**: Bugs caused by shared mutable state
- **Testing**: Hard to test code with mutable state
- **Concurrency**: Concurrency issues with shared mutable state

## Scope and Boundaries

- Immutability â‰  Pure Functions (immutability prevents mutation, pure functions have no side effects)
- Immutability = Safety (immutability prevents unexpected mutations)
- Immutability is a **programming principle**, not a pattern

## When to Apply

- When building React applications
- when state management is important
- when concurrency is a concern
- when testing is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Immutability adds boilerplate |
| **Time** â€” Writing immutable code takes time |
| **Performance**: Creating new objects can be expensive |

## Common Misuses

- **Everything immutable**: Not every piece of data needs to be immutable
- **Ignoring performance**: Creating new objects can be expensive
- **Confusing with readonly**: `readonly` prevents reassignment, not mutation

## Related Concepts

- [Pure Functions](Architecture/pure-functions.md) â€” Pure functions benefit from immutability
- [Discriminated Unions](Architecture/discriminated-unions.md) â€” Discriminated unions are immutable
- [Make Invalid States Unrepresentable](Architecture/make-invalid-states-unrepresentable.md) â€” Immutability supports making invalid states unrepresentable

## Project Observations

- The project uses immutability:
  - TypeScript supports immutability through `readonly` and `as const`
  - React benefits from immutability through state management
  - The project's architecture patterns note covers TypeScript concepts
  - No evidence of immutability in existing code (src/ is empty)
- File naming conventions support immutability:
  - `*.types.ts` â€” Type files
  - `*.data.ts` â€” Data files

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]


