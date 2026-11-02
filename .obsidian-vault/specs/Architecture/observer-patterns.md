---
slug: observer-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Observer_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - observer-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Observer Pattern Patterns

## Definition

Observer Pattern Patterns are **design patterns for working with observer architecture**.

> "The Observer pattern defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified." — GoF

## Problem Addressed

Without observer pattern patterns:
- **Coupling**: Objects are coupled to each other
- **Scalability**: Hard to scale notifications
- **Testing**: Hard to test notifications
- **Maintenance**: Hard to maintain notifications

## Scope and Boundaries

- Observer Pattern Patterns ≠ Observer Pattern (observer pattern patterns are patterns, observer pattern is a behavioral pattern)
- Observer Pattern Patterns ≠ Iterator (observer pattern patterns are patterns, iterator is a behavioral pattern)
- Observer Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when notifications matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Observer pattern patterns are complex |
| **Time** — Observer pattern patterns take time |
| **Over-observer-pattern** — Don't use observer pattern for everything |

## Common Misuses

- **Everything observer pattern**: Not everything needs observer pattern patterns
- **Confusing with iterator**: Observer pattern patterns ≠ iterator
- **Over-observer-pattern**: Too many observer patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Observer pattern patterns with DDD
- [Iterator Pattern](Architecture/iterator-pattern-patterns.md) — Observer pattern patterns with iterator
- [Strategy Pattern](Architecture/strategy-pattern-patterns.md) — Observer pattern patterns with strategy

## Project Observations

- The project uses observer pattern patterns:
  - The project's architecture patterns note covers observer pattern patterns (from existing notes)
  - No evidence of observer pattern patterns in existing code (src/ is empty)
- File naming conventions support observer pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

