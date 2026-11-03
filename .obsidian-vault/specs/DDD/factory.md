---
slug: factory
---

# Factory

> **Purpose:** Create objects with Factory.
> **Last Updated:** 2026-11-03

## concept_id
`factory`

## title
Factory

## aliases
- Factory
- Domain Factory
- Object Factory
- Creation Logic

## category
ddd

## concept_type
ddd-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Object creation
- Domain logic
- Complex initialization
- Encapsulation

## tags
- type/pattern
- domain/ddd
- status/verified
- priority/high

## source_ids
- evans-ddd
- martinfowler-patterns

## related_concept_ids
- factory
- domain-factory
- object-factory
- creation-logic

## Definition

Factory is a DDD pattern that encapsulates object creation logic, ensuring objects are created correctly with all required invariants.

## Problem Addressed

Without Factory:
- Creation is scattered
- Invariants are violated
- Initialization is complex
- Logic is duplicated

## Scope of Boundaries

Factory applies to:
- Object creation
- Domain logic
- Complex initialization
- Encapsulation

Factory does not apply to:
- Infrastructure
- UI
- Database
- External systems

## When to Apply

- Building DDD apps
- Needing object creation
- Complex initialization
- Encapsulating logic

## Tradeoffs and When to Avoid

- **Complexity**: Factory adds complexity
- **Not for simple apps**: Simple apps don't need Factory
- **Not for internal**: Internal apps may not need Factory
- **Not for all**: Not all apps need Factory

## Implementation Guidance

1. **Identify objects**: Identify complex objects
2. **Create factory**: Create factory
3. **Encapsulate**: Encapsulate creation logic
4. **Validate**: Validate invariants
5. **Test**: Test factory

## Verification

- [ ] Objects identified
- [ ] Factory created
- [ ] Logic encapsulated
- [ ] Invariants validated
- [ ] Factory tested

## Common Misuses

- **Not identifying**: Not identifying objects
- **Not creating**: Not creating factory
- **Not encapsulating**: Not encapsulating logic
- **Not validating**: Not validating invariants

## Related Concepts

- [[DDD/factory]] â€” Factory
- [[DDD/factory]] â€” Domain Factory
- [[DDD/factory]] â€” Object Factory
- [[DDD/factory]] â€” Creation Logic

## Project Observations

The project uses Factory through:
- Object identification
- Factory creation
- Logic encapsulation
- Invariant validation

## Sources

- [[Sources/evans-ddd|Domain-Driven Design by Eric Evans]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Factory Note**
