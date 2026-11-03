# Aggregate Root

> **Purpose:** Model aggregates with Aggregate Root.
> **Last Updated:** 2026-11-03

---

## concept_id
`aggregate-root`

## title
Aggregate Root

## aliases
- Aggregate Root
- AR
- Aggregate Root Entity
- Root Entity

## category
ddd

## concept_type
ddd-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Aggregate design
- Boundary definition
- Consistency enforcement
- Transaction boundaries

## tags
- type/pattern
- domain/ddd
- status/verified
- priority/high

## source_ids
- evans-ddd
- martinfowler-patterns

## related_concept_ids
- aggregate-root
- ar
- aggregate-root-entity
- root-entity

---

## Definition

Aggregate Root is a DDD pattern that is the primary entity in an aggregate, controlling all access to objects within the aggregate boundary.

## Problem Addressed

Without Aggregate Root:
- Aggregates are inconsistent
- Boundaries are unclear
- Access is uncontrolled
- Transactions are broken

## Scope of Boundaries

Aggregate Root applies to:
- Aggregate design
- Boundary definition
- Consistency enforcement
- Transaction boundaries

Aggregate Root does not apply to:
- Infrastructure
- UI
- Database
- External systems

## When to Apply

- Building DDD apps
- Needing aggregates
- Defining boundaries
- Enforcing consistency

## Tradeoffs and When to Avoid

- **Complexity**: Aggregate Root adds complexity
- **Not for simple apps**: Simple apps don't need Aggregate Root
- **Not for internal**: Internal apps may not need Aggregate Root
- **Not for all**: Not all apps need Aggregate Root

## Implementation Guidance

1. **Identify aggregates**: Identify aggregate boundaries
2. **Define root**: Define aggregate root
3. **Control access**: Control access to children
4. **Enforce**: Enforce invariants
5. **Test**: Test aggregates

## Verification

- [ ] Aggregates identified
- [ ] Root defined
- [ ] Access controlled
- [ ] Invariants enforced
- [ ] Aggregates tested

## Common Misuses

- **Not identifying**: Not identifying aggregates
- **Not defining**: Not defining root
- **Not controlling**: Not controlling access
- **Not enforcing**: Not enforcing invariants

## Related Concepts

- [[DDD/aggregate-root]] — Aggregate Root
- [[DDD/ar]] — AR
- [[DDD/aggregate-root-entity]] — Aggregate Root Entity
- [[DDD/root-entity]] — Root Entity

## Project Observations

The project uses Aggregate Root through:
- Aggregate identification
- Root definition
- Access control
- Invariant enforcement

## Sources

- [[Sources/evans-ddd|Domain-Driven Design by Eric Evans]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Aggregate Root Note**
