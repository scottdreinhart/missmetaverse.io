---
slug: iterator-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Iterator_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - iterator-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Iterator Pattern Patterns

## Definition

Iterator Pattern Patterns are **design patterns for working with iterator architecture**.

> "The Iterator pattern provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation." — GoF

## Problem Addressed

Without iterator pattern patterns:
- **Complexity**: Accessing elements is complex
- **Coupling**: Aggregate is coupled to traversal logic
- **Testing**: Hard to test traversal
- **Maintenance**: Hard to maintain traversal

## Scope and Boundaries

- Iterator Pattern Patterns ≠ Iterator Pattern (iterator pattern patterns are patterns, iterator pattern is a behavioral pattern)
- Iterator Pattern Patterns = Observer (iterator pattern patterns are patterns, observer is a behavioral pattern)
- Iterator Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when traversal matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Iterator pattern patterns are complex |
| **Time** — Iterator pattern patterns take time |
| **Over-iterator-pattern** — Don't use iterator pattern for everything |

## Common Misuses

- **Everything iterator pattern**: Not everything needs iterator pattern patterns
- **Confusing with observer**: Iterator pattern patterns ≠ observer
- **Over-iterator-pattern**: Too many iterator patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Iterator pattern patterns with DDD
- [Observer Pattern](Architecture/observer-pattern.md) — Iterator pattern patterns with observer
- [Strategy Pattern](Architecture/strategy-pattern-patterns.md) — Iterator pattern patterns with strategy

## Project Observations

- The project uses iterator pattern patterns:
  - The project's architecture patterns note covers iterator pattern patterns (from existing notes)
  - No evidence of iterator pattern patterns in existing code (src/ is empty)
- File naming conventions support iterator pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

