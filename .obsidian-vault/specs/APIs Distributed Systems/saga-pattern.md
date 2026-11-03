---
slug: saga-pattern
tags:
  - api   - distributed-systems   - backend
---

# Saga Pattern

> **Purpose:** Manage distributed transactions with Saga Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`saga-pattern`

## title
Saga Pattern

## aliases
- Saga
- Saga Orchestration
- Saga Choreography
- Distributed Transaction

## category
apis-distributed-systems

## concept_type
integration-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Distributed transactions
- Compensating actions
- Event-driven coordination
- Data consistency

## tags
- type/pattern
- domain/distributed
- status/verified
- priority/high

## source_ids
- saga-pattern-cockburn
- martinfowler-patterns

## related_concept_ids
- saga-pattern
- orchestration-pattern
- choreography-pattern
- compensating-action

## Definition

Saga Pattern manages distributed transactions across multiple services by breaking them into a sequence of local transactions, each with a compensating action for rollback.

## Problem Addressed

Without Saga:
- Distributed transactions are impossible
- Data consistency is lost
- Rollback is difficult
- Compensation is manual

## Scope of Boundaries

Saga applies to:
- Distributed transactions
- Compensating actions
- Event-driven coordination
- Data consistency

Saga does not apply to:
- Single service transactions
- Simple CRUD
- Sync systems
- UI rendering

## When to Apply

- Managing distributed transactions
- Needing data consistency
- Coordinating services
- Implementing compensation

## Tradeoffs and When to Avoid

- **Complexity**: Saga adds complexity
- **Not for simple apps**: Simple apps don't need Saga
- **Not for single service**: Single service doesn't need Saga
- **Not for sync**: Sync systems don't need Saga

## Implementation Guidance

1. **Define saga**: Define saga steps
2. **Implement steps**: Implement local transactions
3. **Define compensation**: Define compensating actions
4. **Coordinate**: Coordinate saga execution
5. **Handle failures**: Handle saga failures

## Verification

- [ ] Saga defined
- [ ] Steps implemented
- [ ] Compensation defined
- [ ] Coordination working
- [ ] Failures handled

## Common Misuses

- **Not compensating**: Not defining compensating actions
- **Not handling failures**: Not handling saga failures
- **Not coordinating**: Not coordinating saga execution
- **Over-engineering**: Using Saga for simple apps

## Related Concepts

- [[APIs Distributed Systems/saga-pattern]] â€” Saga Pattern
- [[APIs Distributed Systems/saga-pattern]] â€” Orchestration Pattern
- [[APIs Distributed Systems/saga-pattern]] â€” Choreography Pattern
- [[APIs Distributed Systems/saga-pattern]] â€” Compensating Action

## Project Observations

The project uses Saga Pattern through:
- Saga step definition
- Local transaction implementation
- Compensating action definition
- Saga coordination

## Sources

- [[Sources/saga-pattern-cockburn|Saga Pattern â€” Cockburn]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Saga Pattern Note**
