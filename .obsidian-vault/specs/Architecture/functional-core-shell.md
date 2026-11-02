---
slug: functional-core-shell
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

# Functional Core, Imperative Shell

## Definition

Functional Core, Imperative Shell is an **architecture style that separates pure business logic from side effects**.

> "Functional Core, Imperative Shell separates pure business logic from side effects." — Martin Fowler

## Problem Addressed

Without functional core, imperative shell:
- **Testing**: Hard to test business logic
- **Reliability**: Business logic is unreliable
- **Maintainability**: Hard to maintain code
- **Predictability**: Code is unpredictable

## Scope and Boundaries

- Functional Core, Imperative Shell ≠ Clean Architecture (functional core, imperative shell is a specific type of clean architecture)
- Functional Core, Imperative Shell ≠ Layered Architecture (functional core, imperative shell separates pure from impure, layered architecture organizes by technical layer)
- Functional Core, Imperative Shell is an **architecture style**, not a specific pattern

## When to Apply

- When building applications
- When testing matters
- When reliability is important
- When maintainability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Functional core, imperative shell is complex |
| **Time** — Functional core, imperative shell takes time |
| **Over-functional** — Don't functional everything |

## Common Misuses

- **Everything functional**: Not everything needs functional core, imperative shell
- **Confusing with clean architecture**: Functional core, imperative shell ≠ clean architecture
- **Over-functional**: Too much functional code creates complexity

## Related Concepts

- [Clean Architecture](Architecture/clean-architecture.md) — Functional core, imperative shell with clean architecture
- [Layered Architecture](Architecture/layered-architecture.md) — Functional core, imperative shell with layered architecture
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Functional core, imperative shell with SoC

## Project Observations

- The project uses functional core, imperative shell:
  - The project's architecture patterns note covers functional core, imperative shell (from existing notes)
  - No evidence of functional core, imperative shell in existing code (src/ is empty)
- File naming conventions support functional core, imperative shell:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
