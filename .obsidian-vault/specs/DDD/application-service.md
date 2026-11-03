---
slug: application-service
tags:
  - core-concepts

  - ddd   - domain-driven-design   - architecture
---

# Application Service

> **Purpose:** Implement application services with Application Service.
> **Last Updated:** 2026-11-03

## concept_id
`application-service`

## title
Application Service

## aliases
- Application Service
- Application Layer
- Use Case Coordinator
- Workflow

## category
ddd

## concept_type
ddd-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Application layer
- Use case coordination
- Workflow management
- Domain orchestration

## tags
- type/pattern
- domain/ddd
- status/verified
- priority/high

## source_ids
- evans-ddd
- martinfowler-patterns

## related_concept_ids
- application-service
- application-layer
- use-case-coordinator
- workflow

## Definition

Application Service is a DDD pattern that coordinates application tasks and workflows, orchestrating domain objects to accomplish use cases.

## Problem Addressed

Without Application Service:
- Use cases are scattered
- Workflows are unclear
- Domain is mixed with application logic
- Coordination is difficult

## Scope of Boundaries

Application Service applies to:
- Application layer
- Use case coordination
- Workflow management
- Domain orchestration

Application Service does not apply to:
- Domain logic
- Infrastructure
- UI
- Database

## When to Apply

- Building DDD apps
- Needing use case coordination
- Managing workflows
- Orchestrating domains

## Tradeoffs and When to Avoid

- **Complexity**: Application Service adds complexity
- **Not for simple apps**: Simple apps don't need Application Service
- **Not for internal**: Internal apps may not need Application Service
- **Not for all**: Not all apps need Application Service

## Implementation Guidance

1. **Identify use cases**: Identify application use cases
2. **Create services**: Create application services
3. **Coordinate**: Coordinate domain objects
4. **Validate**: Validate input
5. **Test**: Test services

## Verification

- [ ] Use cases identified
- [ ] Services created
- [ ] Objects coordinated
- [ ] Input validated
- [ ] Services tested

## Common Misuses

- **Not identifying**: Not identifying use cases
- **Not creating**: Not creating services
- **Not coordinating**: Not coordinating objects
- **Not validating**: Not validating input

## Related Concepts

- [[DDD/application-service]] â€” Application Service
- [[DDD/application-service]] â€” Application Layer
- [[DDD/application-service]] â€” Use Case Coordinator
- [[DDD/application-service]] â€” Workflow

## Project Observations

The project uses Application Service through:
- Use case identification
- Service creation
- Object coordination
- Input validation

## Sources

- [[Sources/S002-evans-ddd-2003|Domain-Driven Design by Eric Evans]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Application Service Note**
