---
slug: saga-pattern
sources:
  - https://microservices.io/patterns/data/saga.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/saga
date: 2026-11-02
tags:
  - saga
  - distributed-systems
  - transactions
  - patterns
# Saga Pattern

## Definition

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
A Saga is a **sequence of local transactions where each transaction updates data within a single service, and each step has a compensating action for rollback**.

> "A saga is a sequence of local transactions. Each local transaction updates the database and publishes a message or event to trigger the next local transaction in the saga." â€” Martin Fowler

## Problem Addressed

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without sagas:
- **Distributed transactions**: Hard to maintain ACID across services
- **Lock contention**: Long-running distributed locks
- **Deadlocks**: Multiple services competing for resources
- **Data inconsistency**: Partial failures leave data inconsistent

## Scope and Boundaries

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Saga â‰  Database transaction (saga spans multiple services)
- Saga compensation â‰  Database rollback (compensation is business logic)
- Saga is a **distributed transaction pattern**, not a local transaction pattern

## When to Apply

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When multiple services need to coordinate
- When distributed transactions are needed
- When eventual consistency is acceptable
- When compensating actions are possible

## Tradeoffs and When to Avoid

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Compensating actions are complex |
| **Eventual consistency** â€” Not immediate consistency |
| **Orchestration** â€” Need orchestrator or choreography |

## Common Misuses

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Every workflow**: Not every workflow needs a saga
- **Confusing with rollback**: Compensation â‰  rollback
- **No compensating actions**: Sagas need rollback logic

## Related Concepts

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Transaction Outbox](Architecture/transactional-outbox.md) â€” Reliable event publishing
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) â€” Saga coordination
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) â€” Resilience pattern

## Project Observations

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- No evidence of saga in existing code (src/ is empty)
- The project's architecture patterns note covers sagas
- DDD patterns note covers Domain Events (used in sagas)

## Sources

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



