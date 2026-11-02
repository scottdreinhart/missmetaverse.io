---
slug: entity-ddd
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Entity.html
date: 2026-11-02
tags:
  - ddd
  - entity
  - domain-modeling
  - identity
---

# Entity

## Definition

Entity is **a unit of identity in a domain model that is defined by its identity rather than its attributes**.

> "An object not defined by its attributes, but by a continuum of identity and a link to other objects." — Eric Evans

## Problem Addressed

Without entities:
- **Identity confusion**: Can't track objects through changes
- **Equality issues**: Two objects with same attributes are considered equal
- **Lifecycle management**: Can't manage object lifecycle
- **Relationships**: Can't establish stable relationships between objects

## Scope and Boundaries

- Entity ≠ Value Object (entity has identity, value object is defined by attributes)
- Entity = Identity (entity is defined by its identity)
- Entity is a **domain model building block**, not a pattern

## When to Apply

- When building domain models
- when object identity matters (not just attributes)
- when objects have a lifecycle
- when objects have stable relationships

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Entities require identity management |
| **Time** — Designing entities takes time |
| **Over-entity** — Not everything needs identity |

## Common Misuses

- **Everything an entity**: Not everything needs identity — use value objects when appropriate
- **Ignoring invariants**: Entities should maintain domain invariants
- **Confusing with database row**: Entity identity ≠ database primary key (though they often align)

## Related Concepts

- [Value Object](DDD/value-object.md) — Value objects are compared by attributes, entities by identity
- [Aggregate](DDD/aggregate.md) — Aggregates contain entities and value objects
- [Domain Service](DDD/domain-service.md) — Domain services operate on entities

## Project Observations

- The project uses entities:
  - TypeScript classes can serve as entities
  - The project's architecture patterns note covers DDD concepts
  - No evidence of entities in existing code (src/ is empty)
- File naming conventions support entities:
  - `*.entity.ts` — Entity files
  - `*.types.ts` — Type files

## Sources

- [[Sources/evans-ddd-ddd-2003|evans-ddd-ddd-2003]]
- [[Sources/fowler-ddd-ddd-2003|fowler-ddd-ddd-2003]]
