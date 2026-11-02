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
---

# Saga Pattern

## Definition

A Saga is a **sequence of local transactions where each transaction updates data within a single service, and each step has a compensating action for rollback**.

> "A saga is a sequence of local transactions. Each local transaction updates the database and publishes a message or event to trigger the next local transaction in the saga." — Martin Fowler

## Problem Addressed

Without sagas:
- **Distributed transactions**: Hard to maintain ACID across services
- **Lock contention**: Long-running distributed locks
- **Deadlocks**: Multiple services competing for resources
- **Data inconsistency**: Partial failures leave data inconsistent

## Scope and Boundaries

- Saga ≠ Database transaction (saga spans multiple services)
- Saga compensation ≠ Database rollback (compensation is business logic)
- Saga is a **distributed transaction pattern**, not a local transaction pattern

## When to Apply

- When multiple services need to coordinate
- When distributed transactions are needed
- When eventual consistency is acceptable
- When compensating actions are possible

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Compensating actions are complex |
| **Eventual consistency** — Not immediate consistency |
| **Orchestration** — Need orchestrator or choreography |

## Common Misuses

- **Every workflow**: Not every workflow needs a saga
- **Confusing with rollback**: Compensation ≠ rollback
- **No compensating actions**: Sagas need rollback logic

## Related Concepts

- [Transaction Outbox](Architecture/transactional-outbox.md) — Reliable event publishing
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Saga coordination
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) — Resilience pattern

## Project Observations

- No evidence of saga in existing code (src/ is empty)
- The project's architecture patterns note covers sagas
- DDD patterns note covers Domain Events (used in sagas)

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
