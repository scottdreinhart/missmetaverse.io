---
slug: factory-pattern-ddd
sources:
  - https://martinfowler.com/eaaDev/repository.html
  - https://en.wikipedia.org/wiki/Factory_method_pattern
date: 2026-11-02
tags:
  - factory-pattern
  - ddd
  - creational-patterns
  - patterns
  - --
# Factory Pattern (DDD)

## Definition

Factory Pattern is a **creational pattern that encapsulates object creation logic, providing a consistent way to create domain objects**.

> "A Factory is an operation that creates a new object and returns it." â€” Martin Fowler

## Problem Addressed

Without factory pattern:
- **Complexity**: Object creation is complex
- **Inconsistency**: Object creation is inconsistent
- **Testing**: Hard to test object creation
- **Maintenance**: Hard to maintain object creation code

## Scope and Boundaries

- Factory Pattern â‰  Abstract Factory (factory pattern is a specific pattern, abstract factory is a family of factories)
- Factory Pattern â‰  Builder (factory pattern is for creation, builder is for construction)
- Factory Pattern is a **creational pattern**, not a construction pattern

## When to Apply

- When building applications
- When object creation matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Factory pattern is complex |
| **Time** â€” Factory pattern takes time |
| **Over-factory** â€” Don't use factory for everything |

## Common Misuses

- **Everything factory**: Not everything needs factory pattern
- **Confusing with abstract factory**: Factory pattern â‰  abstract factory
- **Over-factory**: Too many factories create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) â€” Factory pattern with DDD
- [Abstract Factory](Architecture/abstract-factory.md) â€” Factory pattern with abstract factory
- [Builder](Architecture/builder.md) â€” Factory pattern with builder

## Project Observations

- The project uses factory pattern:
  - The project's architecture patterns note covers factory pattern (from existing notes)
  - No evidence of factory pattern in existing code (src/ is empty)
- File naming conventions support factory pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




