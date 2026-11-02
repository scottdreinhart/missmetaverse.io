---
slug: factory-ddd-pattern
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Factory.html
date: 2026-11-02
tags:
  - ddd
  - factory
  - domain-modeling
  - object-creation
---

# Factory (DDD)

## Definition

Factory (DDD) is **an object or method responsible for creating domain objects, encapsulating creation logic and ensuring objects are created in valid states**.

> "A factory is an operation that creates a new domain object, ensuring it is created in a valid state." — Eric Evans

## Problem Addressed

Without factories:
- **Invalid state**: Objects can be created in invalid states
- **Creation logic leakage**: Creation logic is scattered across the codebase
- **Duplication**: Creation logic is duplicated
- **Testing difficulty**: Hard to test object creation

## Scope and Boundaries

- Factory ≠ Constructor (factory is a separate method/class, constructor is built-in)
- Factory = Creation (factory encapsulates object creation logic)
- Factory is a **domain model building block**, not a pattern

## When to Apply

- When building domain models with complex creation logic
- when objects must be created in valid states
- when creation logic is complex
- when testing object creation is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Factories add an abstraction layer |
| **Time** — Implementing factories takes time |
| **Over-factory** — Simple objects may not need a factory |

## Common Misuses

- **Everything needs a factory**: Not every object needs a factory
- **Factory as god object**: Factories should not become god objects
- **Confusing with constructor**: Constructors are for simple creation, factories are for complex creation

## Related Concepts

- [Aggregate Root](DDD/aggregate-root.md) — Aggregate roots often contain factory methods
- [Value Object](DDD/value-object.md) — Value objects may need factories for creation
- [Domain Invariant](DDD/domain-invariant.md) — Factories ensure objects are created in valid states

## Project Observations

- The project uses factories:
  - TypeScript static methods can serve as factories
  - The project's architecture patterns note covers DDD concepts
  - No evidence of factories in existing code (src/ is empty)
- File naming conventions support factories:
  - `*.factory.ts` — Factory files
  - `*.entity.ts` — Entity files

## Sources

- [[Sources/evans-ddd-ddd-2003|evans-ddd-ddd-2003]]
- [[Sources/fowler-ddd-ddd-2003|fowler-ddd-ddd-2003]]
