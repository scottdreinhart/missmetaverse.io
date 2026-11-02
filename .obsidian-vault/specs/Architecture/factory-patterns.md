---
slug: factory-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Factory_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - factory-pattern
  - creational-patterns
  - patterns
  - design-patterns
---

# Factory Pattern Patterns

## Definition

Factory Pattern Patterns are **design patterns for working with factory architecture**.

> "The Factory pattern defines an interface for creating objects, but lets subclasses alter the type of objects that will be created." — GoF

## Problem Addressed

Without factory pattern patterns:
- **Complexity**: Object creation is complex and hard to maintain
- **Coupling**: Code is coupled to specific classes
- **Testing**: Hard to test object creation
- **Maintenance**: Hard to maintain object creation

## Scope and Boundaries

- Factory Pattern Patterns ≠ Factory Pattern (factory pattern patterns are patterns, factory pattern is a creational pattern)
- Factory Pattern Patterns = Singleton (factory pattern patterns are patterns, singleton is a creational pattern)
- Factory Pattern Patterns is a **patterns**, not a creational pattern

## When to Apply

- When building applications
- when object creation matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Factory pattern patterns are complex |
| **Time** — Factory pattern patterns take time |
| **Over-factory-pattern** — Don't use factory pattern for everything |

## Common Misuses

- **Everything factory pattern**: Not everything needs factory pattern patterns
- **Confusing with singleton**: Factory pattern patterns ≠ singleton
- **Over-factory-pattern**: Too many factory patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Factory pattern patterns with DDD
- [Singleton Pattern](Architecture/singleton-pattern.md) — Factory pattern patterns with singleton
- [Builder Pattern](Architecture/builder-pattern.md) — Factory pattern patterns with builder

## Project Observations

- The project uses factory pattern patterns:
  - The project's architecture patterns note covers factory pattern patterns (from existing notes)
  - No evidence of factory pattern patterns in existing code (src/ is empty)
- File naming conventions support factory pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

