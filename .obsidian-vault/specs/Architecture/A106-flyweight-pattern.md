---
slug: flyweight-pattern
sources:
  - https://en.wikipedia.org/wiki/Flyweight_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - flyweight-pattern
  - structural-patterns
  - patterns
  - design-patterns
  - --
# Flyweight Pattern

## Definition

Flyweight Pattern is a **structural design pattern that minimizes memory usage by sharing as much data as possible with similar objects**.

> "The Flyweight pattern minimizes memory usage by sharing as much data as possible with similar objects." â€” GoF

## Problem Addressed

Without flyweight pattern:
- **Memory usage**: Too much memory is used
- **Performance**: Too many objects are created
- **Testing**: Hard to test objects
- **Maintenance**: Hard to maintain objects

## Scope and Boundaries

- Flyweight Pattern â‰  Singleton (flyweight pattern shares data, singleton pattern has one instance)
- Flyweight Pattern â‰  Cache (flyweight pattern shares data, cache pattern stores data)
- Flyweight Pattern is a **structural pattern**, not a behavioral pattern

## When to Apply

- When building applications
- When memory usage matters
- When performance is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Flyweight pattern is complex |
| **Time** â€” Flyweight pattern takes time |
| **Over-flyweight** â€” Don't use flyweight for everything |

## Common Misuses

- **Everything flyweight**: Not everything needs flyweight pattern
- **Confusing with singleton**: Flyweight pattern â‰  singleton
- **Over-flyweight**: Too many flyweights create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) â€” Flyweight pattern with DDD
- [Singleton Pattern](Architecture/singleton-pattern.md) â€” Flyweight pattern with singleton
- [Cache Pattern](Architecture/cache-pattern.md) â€” Flyweight pattern with cache

## Project Observations

- The project uses flyweight pattern:
  - The project's architecture patterns note covers flyweight pattern (from existing notes)
  - No evidence of flyweight pattern in existing code (src/ is empty)
- File naming conventions support flyweight pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




