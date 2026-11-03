---
slug: mediator-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Mediator_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - mediator-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Mediator Pattern Patterns

## Definition

Mediator Pattern Patterns are **design patterns for working with mediator architecture**.

> "The Mediator pattern defines an object that encapsulates how a set of objects interact." — GoF

## Problem Addressed

Without mediator pattern patterns:
- **Coupling**: Objects are coupled to each other
- **Complexity**: Interactions are complex and hard to maintain
- **Testing**: Hard to test interactions
- **Maintenance**: Hard to maintain interactions

## Scope and Boundaries

- Mediator Pattern Patterns ≠ Mediator Pattern (mediator pattern patterns are patterns, mediator pattern is a behavioral pattern)
- Mediator Pattern Patterns = Observer (mediator pattern patterns are patterns, observer is a behavioral pattern)
- Mediator Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when interactions matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Mediator pattern patterns are complex |
| **Time** — Mediator pattern patterns take time |
| **Over-mediator-pattern** — Don't use mediator pattern for everything |

## Common Misuses

- **Everything mediator pattern**: Not everything needs mediator pattern patterns
- **Confusing with observer**: Mediator pattern patterns ≠ observer
- **Over-mediator-pattern**: Too many mediator patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Mediator pattern patterns with DDD
- [Observer Pattern](Architecture/observer-pattern-patterns.md) — Mediator pattern patterns with observer
- [Strategy Pattern](Architecture/strategy-pattern-patterns.md) — Mediator pattern patterns with strategy

## Project Observations

- The project uses mediator pattern patterns:
  - The project's architecture patterns note covers mediator pattern patterns (from existing notes)
  - No evidence of mediator pattern patterns in existing code (src/ is empty)
- File naming conventions support mediator pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




