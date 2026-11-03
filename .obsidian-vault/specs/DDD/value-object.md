---
slug: value-object
tags:
  - core-concepts

  - ddd   - domain-driven-design   - architecture
---

# Value Object

> **Purpose:** Domain object defined by its attributes, not identity.
> **Last Updated:** 2026-11-03

## concept_id
`ddd-value-object`

## title
Value Object

## aliases
- Value Object
- VO
- Value Type

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Immutable domain values
- Objects defined by attributes
- Domain models with rich behavior

## tags
- type/pattern
- domain/ddd
- domain/modeling
- status/verified
- priority/high

## source_ids
- evans-ddd-2003
- martin-fowler-patterns

## related_concept_ids
- ddd-entity
- ddd-aggregate
- ddd-domain-invariant
- arch-value-object-file-convention
- arch-make-invalid-states-unrepresentable

## Definition

A Value Object is a domain object that is defined by its attributes, not by its identity. Two value objects with the same attributes are interchangeable.

## Problem Addressed

Without value objects:
- Primitive types are used without validation
- Domain intent is lost in code
- Validation is scattered
- Immutability is not enforced

## Scope and Boundaries

Value objects apply to:
- Immutable domain values
- Objects defined by attributes
- Domain concepts with behavior
- Values that are interchangeable

Value objects do not apply to:
- Objects with identity (use entities)
- Mutable objects
- Objects with lifecycle

## When to Apply

- The value is defined by its attributes
- The value should be immutable
- The value has validation rules
- The value has behavior

## Tradeoffs and When to Avoid

- **Over-modeling**: Not every primitive needs a value object
- **Immutability overhead**: Creating new instances instead of mutating
- **Not for entities**: Objects with identity should be entities

## Implementation Guidance

1. **Make immutable**: Value objects should not change after creation
2. **Validate in constructor**: Ensure valid state on creation
3. **Implement equality**: Compare by attributes
4. **Encapsulate behavior**: Add domain-specific methods
5. **Use composition**: Combine value objects in entities

## Verification

- [ ] Value object is immutable
- [ ] Equality is based on attributes
- [ ] Validation happens on creation
- [ ] Value object has behavior

## Common Misuses

- **Confusing with entities**: Value objects have no identity
- **Making mutable**: Value objects should be immutable
- **Ignoring equality**: Not implementing proper equality checks
- **Over-modeling**: Not every primitive needs a value object

## Related Concepts

- [[DDD/entity]] â€” Entity
- [[DDD/aggregate-root]] â€” Aggregate
- [[Project File Conventions/value-object-file-convention]] â€” Value Object File Convention
- [[DDD/domain-invariant]] â€” Domain Invariant

## Project Observations

The project uses TypeScript, which supports value objects through:
- Readonly properties
- Factory functions
- Type guards
- Immutability patterns

## Sources

- [[Sources/evans-ddd-2003|Eric Evans â€” Domain-Driven Design: Tackling Complexity in the Heart of Software]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Value Object Note**
