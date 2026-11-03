---
slug: domain-service
tags:
  - ddd   - domain-driven-design   - architecture
---

# Domain Service

> **Purpose:** Implement domain services with Domain Service.
> **Last Updated:** 2026-11-03

## concept_id
`domain-service`

## title
Domain Service

## aliases
- Domain Service
- DS
- Domain Operation
- Business Service

## category
ddd

## concept_type
ddd-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Domain operations
- Business logic
- Cross-aggregate logic
- Domain coordination

## tags
- type/pattern
- domain/ddd
- status/verified
- priority/high

## source_ids
- evans-ddd
- martinfowler-patterns

## related_concept_ids
- domain-service
- ds
- domain-operation
- business-service

## Definition

Domain Service is a DDD pattern that encapsulates domain logic that doesn't naturally belong to a single entity or value object.

## Problem Addressed

Without Domain Service:
- Logic is scattered
- Operations are unclear
- Coordination is difficult
- Domain is incomplete

## Scope of Boundaries

Domain Service applies to:
- Domain operations
- Business logic
- Cross-aggregate logic
- Domain coordination

Domain Service does not apply to:
- Infrastructure
- UI
- Database
- External systems

## When to Apply

- Building DDD apps
- Needing domain operations
- Complex business logic
- Cross-aggregate coordination

## Tradeoffs and When to Avoid

- **Complexity**: Domain Service adds complexity
- **Not for simple apps**: Simple apps don't need Domain Service
- **Not for internal**: Internal apps may not need Domain Service
- **Not for all**: Not all apps need Domain Service

## Implementation Guidance

1. **Identify operations**: Identify domain operations
2. **Create services**: Create domain services
3. **Implement**: Implement logic
4. **Validate**: Validate invariants
5. **Test**: Test services

## Verification

- [ ] Operations identified
- [ ] Services created
- [ ] Logic implemented
- [ ] Invariants validated
- [ ] Services tested

## Common Misuses

- **Not identifying**: Not identifying operations
- **Not creating**: Not creating services
- **Not implementing**: Not implementing logic
- **Not validating**: Not validating invariants

## Related Concepts

- [[DDD/domain-service]] â€” Domain Service
- [[DDD/domain-service]] â€” DS
- [[DDD/domain-service]] â€” Domain Operation
- [[DDD/domain-service]] â€” Business Service

## Project Observations

The project uses Domain Service through:
- Operation identification
- Service creation
- Logic implementation
- Invariant validation

## Sources

- [[Sources/evans-ddd|Domain-Driven Design by Eric Evans]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Domain Service Note**
