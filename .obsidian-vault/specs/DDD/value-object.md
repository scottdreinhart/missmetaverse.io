---
slug: value-object
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/ValueObject.html
date: 2026-11-02
tags:
  - ddd
  - value-object
  - domain-modeling
  - immutability
---

# Value Object

## Definition

Value Object is **an object whose equality is based on value rather than identity — two value objects are equal if their attributes are equal**.

> "An object containing attributes or values but without identity. Two value objects are equal when all their parts are equal." — Eric Evans

## Problem Addressed

Without value objects:
- **Identity confusion**: Objects compared by reference instead of value
- **Immutability issues**: Values can be changed unexpectedly
- **Domain clarity**: Domain concepts not expressed in code
- **Null handling**: Null values create ambiguity

## Scope and Boundaries

- Value Object ≠ Entity (value object has no identity, entity has identity)
- Value Object = Immutability (value objects are typically immutable)
- Value Object is a **domain model building block**, not a pattern

## When to Apply

- When building domain models
- when value equality matters (not reference equality)
- when immutability is important
- when domain concepts need explicit representation

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Value objects add boilerplate |
| **Time** — Designing value objects takes time |
| **Over-value-object** — Not every data class needs to be a value object |

## Common Misuses

- **Everything a value object**: Not every data class needs value object semantics
- **Ignoring immutability**: Value objects should be immutable
- **Confusing with DTO**: Value objects belong in the domain layer, DTOs belong in the presentation layer

## Related Concepts

- [Entity](DDD/entity.md) — Entities have identity, value objects don't
- [Aggregate](DDD/aggregate.md) — Aggregates contain value objects
- [Immutable Data](Architecture/immutable-data.md) — Value objects are typically immutable

## Project Observations

- The project uses value objects:
  - TypeScript `readonly` can enforce value object immutability
  - Discriminated unions can represent value objects
  - The project's architecture patterns note covers DDD concepts
  - No evidence of value objects in existing code (src/ is empty)
- File naming conventions support value objects:
  - `*.value-object.ts` — Value object files
  - `*.types.ts` — Type files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

