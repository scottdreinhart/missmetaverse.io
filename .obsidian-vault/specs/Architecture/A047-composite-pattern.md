---
slug: composite-pattern
sources:
  - https://en.wikipedia.org/wiki/Composite_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:








  - composite-pattern
  - structural-patterns
  - patterns
  - design-patterns
---

# Composite Pattern

## Definition

Composite Pattern is a **structural design pattern that composes objects into tree structures to represent part-whole hierarchies**.

> "The Composite pattern composes objects into tree structures to represent part-whole hierarchies, allowing clients to treat individual objects and compositions uniformly." — GoF

## Problem Addressed

Without composite pattern:
- **Complexity**: Tree structures are complex
- **Inconsistency**: Individual objects and compositions are treated differently
- **Testing**: Hard to test tree structures
- **Maintenance**: Hard to maintain tree structures

## Scope and Boundaries

- Composite Pattern ≠ Decorator (composite pattern composes, decorator pattern adds behavior)
- Composite Pattern ≠ Facade (composite pattern composes, facade pattern simplifies)
- Composite Pattern is a **structural pattern**, not a behavioral pattern

## When to Apply

- When building applications
- When tree structures matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Composite pattern is complex |
| **Time** — Composite pattern takes time |
| **Over-composite** — Don't use composite for everything |

## Common Misuses

- **Everything composite**: Not everything needs composite pattern
- **Confusing with decorator**: Composite pattern ≠ decorator
- **Over-composite**: Too many composites create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Composite pattern with DDD
- [Decorator Pattern](Architecture/decorator-pattern.md) — Composite pattern with decorator
- [Facade Pattern](Architecture/facade-pattern.md) — Composite pattern with facade

## Project Observations

- The project uses composite pattern:
  - The project's architecture patterns note covers composite pattern (from existing notes)
  - No evidence of composite pattern in existing code (src/ is empty)
- File naming conventions support composite pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




