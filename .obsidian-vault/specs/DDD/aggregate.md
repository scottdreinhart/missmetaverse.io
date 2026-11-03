---
slug: aggregate
tags:
  - core-concepts

  - ddd   - domain-driven-design   - architecture
---

# Aggregate

> **Purpose:** Cluster of related entities and value objects treated as one unit.
> **Last Updated:** 2026-11-03

## concept_id
`ddd-aggregate`

## title
Aggregate

## aliases
- Aggregate
- Aggregate Root
- DDD Aggregate

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Domain modeling
- Transaction boundaries
- Consistency boundaries
- Distributed systems

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
- ddd-aggregate-root
- ddd-entity
- ddd-value-object
- ddd-domain-invariant
- ddd-repository
- ddd-domain-event

## Definition

An Aggregate is a cluster of associated objects that is treated as a single unit for data changes. It has a boundary (the aggregate root) that controls access and maintains consistency.

## Problem Addressed

Without aggregates:
- Consistency is hard to maintain
- Transactions are complex
- Access control is difficult
- Domain model is unclear

## Scope and Boundaries

Aggregates apply to:
- Domain modeling
- Transaction boundaries
- Consistency boundaries
- Distributed systems

Aggregates do not apply to:
- UI components
- Database tables
- API endpoints
- Service boundaries

## When to Apply

- Modeling domain consistency
- Defining transaction boundaries
- Controlling access to entities
- Maintaining invariants

## Tradeoffs and When to Avoid

- **Over-modeling**: Not every group of entities needs an aggregate
- **Performance**: Large aggregates can be slow
- **Not for UI**: UI components are not aggregates
- **Not for databases**: Database tables are not aggregates

## Implementation Guidance

1. **Identify cluster**: Group related entities and value objects
2. **Define root**: Choose one entity as the aggregate root
3. **Control access**: Access only through the root
4. **Maintain invariants**: Ensure consistency within the aggregate
5. **Reference externally**: Use IDs for external references

## Verification

- [ ] Related entities are clustered
- [ ] One entity is the root
- [ ] Access is controlled through the root
- [ ] Invariants are maintained
- [ ] External references use IDs

## Common Misuses

- **Confusing with database tables**: Aggregates are not database tables
- **Over-modeling**: Not every group needs an aggregate
- **Ignoring root**: Not choosing a clear root
- **Violating boundary**: Accessing entities outside the root

## Related Concepts

- [[DDD/aggregate-root]] â€” Aggregate Root
- [[DDD/entity]] â€” Entity
- [[DDD/value-object]] â€” Value Object
- [[DDD/domain-invariant]] â€” Domain Invariant
- [[DDD/repository]] â€” Repository

## Project Observations

The project uses TypeScript, which supports aggregates through:
- Classes with related entities
- Aggregate root controlling access
- Type definitions for boundaries
- Constructor validation

## Sources

- [[Sources/S002-evans-ddd-2003|Eric Evans â€” Domain-Driven Design: Tackling Complexity in the Heart of Software]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Aggregate Note**
