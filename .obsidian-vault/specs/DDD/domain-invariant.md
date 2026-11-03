---
slug: domain-invariant
tags:
  - core-concepts

  - ddd   - domain-driven-design   - architecture
---

# Domain Invariant

> **Purpose:** Enforce invariants with Domain Invariant.
> **Last Updated:** 2026-11-03

## concept_id
`domain-invariant`

## title
Domain Invariant

## aliases
- Domain Invariant
- Business Rule
- Constraint
- Consistency Rule

## category
ddd

## concept_type
ddd-concept

## research_status
verified

## project_adoption
declared

## applicability
- Business rules
- Data consistency
- Validation
- Domain constraints

## tags
- type/concept
- domain/ddd
- status/verified
- priority/high

## source_ids
- evans-ddd
- martinfowler-patterns

## related_concept_ids
- domain-invariant
- business-rule
- constraint
- consistency-rule

## Definition

Domain Invariant is a DDD concept that defines rules that must always be true within a bounded context, ensuring data consistency and business rule compliance.

## Problem Addressed

Without Domain Invariants:
- Data is inconsistent
- Rules are violated
- Business logic is broken
- Quality is poor

## Scope of Boundaries

Domain Invariant applies to:
- Business rules
- Data consistency
- Validation
- Domain constraints

Domain Invariant does not apply to:
- Infrastructure
- UI
- Database
- External systems

## When to Apply

- Building DDD apps
- Needing business rules
- Ensuring consistency
- Validating data

## Tradeoffs and When to Avoid

- **Complexity**: Domain Invariants add complexity
- **Not for simple apps**: Simple apps don't need Domain Invariants
- **Not for internal**: Internal apps may not need Domain Invariants
- **Not for all**: Not all apps need Domain Invariants

## Implementation Guidance

1. **Identify rules**: Identify business rules
2. **Define invariants**: Define invariants
3. **Enforce**: Enforce invariants
4. **Validate**: Validate data
5. **Test**: Test invariants

## Verification

- [ ] Rules identified
- [ ] Invariants defined
- [ ] Invariants enforced
- [ ] Data validated
- [ ] Invariants tested

## Common Misuses

- **Not identifying**: Not identifying rules
- **Not defining**: Not defining invariants
- **Not enforcing**: Not enforcing invariants
- **Not validating**: Not validating data

## Related Concepts

- [[DDD/domain-invariant]] â€” Domain Invariant
- [[DDD/domain-invariant]] â€” Business Rule
- [[DDD/domain-invariant]] â€” Constraint
- [[DDD/domain-invariant]] â€” Consistency Rule

## Project Observations

The project uses Domain Invariants through:
- Rule identification
- Invariant definition
- Invariant enforcement
- Data validation

## Sources

- [[Sources/evans-ddd|Domain-Driven Design by Eric Evans]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Domain Invariant Note**
