---
slug: functional-core-shell-patterns
sources:
  - https://en.wikipedia.org/wiki/Functional_core_imperative_shell
  - https://martinfowler.com/bliki/FunctionalCoreImperativeShell.html
date: 2026-11-02
tags:
  - functional-core-shell
  - architecture
  - patterns
  - separation-of-concerns
---

# Functional Core, Imperative Shell Patterns

## Definition

Functional Core, Imperative Shell Patterns are **design patterns for working with functional core, imperative shell architecture**.

> "Functional Core, Imperative Shell separates pure business logic from side effects." — Martin Fowler

## Problem Addressed

Without functional core, imperative shell patterns:
- **Testing**: Hard to test business logic
- **Reliability**: Business logic is unreliable
- **Maintainability**: Hard to maintain code
- **Predictability**: Code is unpredictable

## Scope and Boundaries

- Functional Core, Imperative Shell Patterns ≠ Functional Core, Imperative Shell (functional core, imperative shell patterns are patterns, functional core, imperative shell is an architecture style)
- Functional Core, Imperative Shell Patterns ≠ Clean Architecture (functional core, imperative shell patterns are patterns, clean architecture is an architecture style)
- Functional Core, Imperative Shell Patterns is a **patterns**, not an architecture style

## When to Apply

- When building applications
- when testing matters
- when reliability is important
- when maintainability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Functional core, imperative shell patterns are complex |
| **Time** — Functional core, imperative shell patterns take time |
| **Over-functional-core-shell** — Don't use functional core, imperative shell for everything |

## Common Misuses

- **Everything functional core**: Not everything needs functional core, imperative shell patterns
- **Confusing with clean architecture**: Functional core, imperative shell patterns ≠ clean architecture
- **Over-functional-core-shell**: Too much functional core, imperative shell creates complexity

## Related Concepts

- [Clean Architecture](Architecture/clean-architecture.md) — Functional core, imperative shell patterns with clean architecture
- [Layered Architecture](Architecture/layered-architecture-patterns.md) — Functional core, imperative shell patterns with layered architecture
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Functional core, imperative shell patterns with SoC

## Project Observations

- The project uses functional core, imperative shell patterns:
  - The project's architecture patterns note covers functional core, imperative shell patterns (from existing notes)
  - No evidence of functional core, imperative shell patterns in existing code (src/ is empty)
- File naming conventions support functional core, imperative shell patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

