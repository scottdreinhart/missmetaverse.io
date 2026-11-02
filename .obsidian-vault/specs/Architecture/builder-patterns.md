---
slug: builder-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Builder_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - builder-pattern
  - creational-patterns
  - patterns
  - design-patterns
---

# Builder Pattern Patterns

## Definition

Builder Pattern Patterns are **design patterns for working with builder architecture**.

> "The Builder pattern separates the construction of a complex object from its representation so that the same construction process can create different representations." — GoF

## Problem Addressed

Without builder pattern patterns:
- **Complexity**: Object construction is complex and hard to maintain
- **Flexibility**: Can't construct objects with different representations
- **Testing**: Hard to test object construction
- **Maintenance**: Hard to maintain object construction

## Scope and Boundaries

- Builder Pattern Patterns ≠ Builder Pattern (builder pattern patterns are patterns, builder pattern is a creational pattern)
- Builder Pattern Patterns = Factory (builder pattern patterns are patterns, factory is a creational pattern)
- Builder Pattern Patterns is a **patterns**, not a creational pattern

## When to Apply

- When building applications
- when object construction matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Builder pattern patterns are complex |
| **Time** — Builder pattern patterns take time |
| **Over-builder-pattern** — Don't use builder pattern for everything |

## Common Misuses

- **Everything builder pattern**: Not everything needs builder pattern patterns
- **Confusing with factory**: Builder pattern patterns ≠ factory
- **Over-builder-pattern**: Too many builder patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Builder pattern patterns with DDD
- [Factory Pattern](Architecture/factory-pattern-patterns.md) — Builder pattern patterns with factory
- [Singleton Pattern](Architecture/singleton-pattern.md) — Builder pattern patterns with singleton

## Project Observations

- The project uses builder pattern patterns:
  - The project's architecture patterns note covers builder pattern patterns (from existing notes)
  - No evidence of builder pattern patterns in existing code (src/ is empty)
- File naming conventions support builder pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

