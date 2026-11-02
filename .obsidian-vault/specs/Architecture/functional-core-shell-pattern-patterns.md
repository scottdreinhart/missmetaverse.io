---
slug: functional-core-shell-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Functional_core,_imperative_shell
  - https://www.infoq.com/articles/functional-core-imperative-shell/
date: 2026-11-02
tags:
  - functional-core-shell-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Functional Core Shell Pattern Patterns

## Definition

Functional Core Shell Pattern Patterns are **design patterns for working with functional core shell architecture**.

> "The functional core, imperative shell pattern separates pure business logic from impure side effects." — Dave Farley

## Problem Addressed

Without functional core shell pattern patterns:
- **Complexity**: Business logic is complex and hard to test
- **Testing**: Hard to test business logic with side effects
- **Maintenance**: Hard to maintain business logic
- **Reliability**: Business logic is unreliable

## Scope and Boundaries

- Functional Core Shell Pattern Patterns ≠ Functional Core Shell (functional core shell pattern patterns are patterns, functional core shell is an architectural pattern)
- Functional Core Shell Pattern Patterns = Plugin Architecture (functional core shell pattern patterns are patterns, plugin architecture is an architectural pattern)
- Functional Core Shell Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when business logic matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Functional core shell pattern patterns are complex |
| **Time** — Functional core shell pattern patterns take time |
| **Over-functional-core-shell** — Don't use functional core shell for everything |

## Common Misuses

- **Everything functional core shell**: Not everything needs functional core shell pattern patterns
- **Confusing with plugin architecture**: Functional core shell pattern patterns ≠ plugin architecture
- **Over-functional-core-shell**: Too many functional core shells create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Functional core shell pattern patterns with DDD
- [Plugin Architecture Pattern](Architecture/plugin-architecture-pattern-patterns.md) — Functional core shell pattern patterns with plugin architecture
- [Vertical Slice Architecture Pattern](Architecture/vertical-slice-architecture-pattern-patterns.md) — Functional core shell pattern patterns with vertical slice architecture

## Project Observations

- The project uses functional core shell pattern patterns:
  - The project's architecture patterns note covers functional core shell pattern patterns (from existing notes)
  - No evidence of functional core shell pattern patterns in existing code (src/ is empty)
- File naming conventions support functional core shell pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/microsoft-functional-core-shell-2024|microsoft-functional-core-shell-2024]]
