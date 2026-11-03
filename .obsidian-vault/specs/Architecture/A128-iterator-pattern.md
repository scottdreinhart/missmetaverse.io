---
slug: iterator-pattern
sources:
  - https://en.wikipedia.org/wiki/Iterator_pattern
  - https://martinfowler.com/eaaDev/iterator.html
date: 2026-11-02
tags:








  - iterator-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Iterator Pattern

## Definition

Iterator Pattern is a **behavioral design pattern that provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation**.

> "The Iterator pattern provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation." — GoF

## Problem Addressed

Without iterator pattern:
- **Coupling**: Aggregate is coupled to traversal
- **Inflexibility**: Can't change traversal without changing aggregate
- **Testing**: Hard to test traversal
- **Maintenance**: Hard to maintain traversal

## Scope and Boundaries

- Iterator Pattern ≠ Iterator (iterator pattern is a pattern, iterator is an implementation)
- Iterator Pattern ≠ Iterator Protocol (iterator pattern is a pattern, iterator protocol is a language feature)
- Iterator Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When traversal matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Iterator pattern is complex |
| **Time** — Iterator pattern takes time |
| **Over-iterator** — Don't use iterator for everything |

## Common Misuses

- **Everything iterator**: Not everything needs iterator pattern
- **Confusing with iterator**: Iterator pattern ≠ iterator
- **Over-iterator**: Too many iterators create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Iterator pattern with DDD
- [Iterator Protocol](Architecture/iterator-protocol.md) — Iterator pattern with iterator protocol
- [Iterator](Architecture/iterator.md) — Iterator pattern with iterator

## Project Observations

- The project uses iterator pattern:
  - The project's architecture patterns note covers iterator pattern (from existing notes)
  - No evidence of iterator pattern in existing code (src/ is empty)
- File naming conventions support iterator pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




