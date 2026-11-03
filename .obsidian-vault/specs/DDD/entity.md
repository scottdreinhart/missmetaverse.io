# Entity

> **Purpose:** Domain object identified by its unique identity.
> **Last Updated:** 2026-11-03

---

## concept_id
`ddd-entity`

## title
Entity

## aliases
- Entity
- Domain Entity
- DDD Entity

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Domain models with identity
- Business objects with lifecycle
- Systems tracking objects over time

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
- ddd-value-object
- ddd-aggregate
- ddd-entity
- arch-entity-file-convention
- ddd-domain-invariant

---

## Definition

An Entity is a domain object that is defined by its identity, not its attributes. Two entities with the same attributes are different if their identities differ.

## Problem Addressed

Without entities:
- Objects are confused with value objects
- Identity management is inconsistent
- Lifecycle management is difficult
- Domain model doesn't reflect reality

## Scope and Boundaries

Entities apply to:
- Objects with unique identity
- Objects with lifecycle
- Objects that change over time
- Objects that are referenced by other objects

Entities do not apply to:
- Immutable values (use value objects)
- Temporary data
- DTOs

## When to Apply

- The object has a unique identity
- The object has a lifecycle
- The object is referenced by other objects
- The object changes over time

## Tradeoffs and When to Avoid

- **Over-modeling**: Not every object needs to be an entity
- **Identity management**: Entities require identity management
- **Not for DTOs**: Data transfer objects are not entities

## Implementation Guidance

1. **Define identity**: Choose a unique identifier
2. **Encapsulate identity**: Make identity immutable if possible
3. **Implement equality**: Compare by identity, not attributes
4. **Manage lifecycle**: Handle creation, modification, deletion
5. **Protect invariants**: Ensure domain rules are maintained

## Verification

- [ ] Entity has unique identity
- [ ] Equality is based on identity
- [ ] Lifecycle is managed
- [ ] Domain invariants are protected

## Common Misuses

- **Confusing with value objects**: Entities have identity, value objects don't
- **Using database IDs**: Entity identity may not match database IDs
- **Ignoring equality**: Not implementing proper equality checks
- **Violating invariants**: Allowing entities to reach invalid states

## Related Concepts

- [[DDD/value-object]] — Value Object
- [[DDD/aggregate]] — Aggregate
- [[Architecture/entity-file-convention]] — Entity File Convention
- [[DDD/domain-invariant]] — Domain Invariant

## Project Observations

The project uses TypeScript, which supports entities through:
- Classes with identity properties
- Type definitions for identity
- Immutability patterns
- Constructor validation

## Sources

- [[Sources/evans-ddd-2003|Eric Evans — Domain-Driven Design: Tackling Complexity in the Heart of Software]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Entity Note**
