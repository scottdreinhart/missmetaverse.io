---
slug: pure-functions-coding
sources:
  - https://www.typescriptlang.org/
  - https://react.dev/
date: 2026-11-02
tags:
  - pure-functions
  - typescript
  - type-system
  - patterns
---

# Pure Functions

## Definition

Pure Functions are **functions that always produce the same output for the same input and have no side effects**.

> "A pure function is a function that always produces the same output for the same input and has no side effects." — TypeScript Docs

## Problem Addressed

Without pure functions:
- **Side effects**: Functions have unexpected side effects
- **Testing**: Hard to test functions with side effects
- **Reasoning**: Hard to reason about code with side effects
- **Concurrency**: Concurrency issues with side effects

## Scope and Boundaries

- Pure Functions ≠ Immutability (pure functions have no side effects, immutability prevents mutation)
- Pure Functions = Determinism (pure functions are deterministic)
- Pure Functions is a **programming principle**, not a pattern

## When to Apply

- When building React applications
- when testing is important
- when concurrency is a concern
- when code reasoning is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Pure functions add abstraction |
| **Time** — Writing pure functions takes time |
| **Over-pure**: Not every function needs to be pure |

## Common Misuses

- **Everything pure**: Not every function can be pure
- **Ignoring side effects**: Side effects are necessary, they should be isolated
- **Confusing with pure functions and callbacks**: Pure functions have no side effects, callbacks may have side effects

## Related Concepts

- [Immutability](Coding Type Systems/immutability-coding.md) — Immutability supports pure functions
- [TDD Pattern](Architecture/tdd-pattern.md) — TDD benefits from pure functions
- [Command-Query Separation](Architecture/command-query-separation.md) — Command-query separation supports pure functions

## Project Observations

- The project uses pure functions:
  - TypeScript supports pure functions through type system
  - React benefits from pure functions through components
  - The project's architecture patterns note covers TypeScript concepts
  - No evidence of pure functions in existing code (src/ is empty)
- File naming conventions support pure functions:
  - `*.logic.ts` — Logic files
  - `*.data.ts` — Data files

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]
