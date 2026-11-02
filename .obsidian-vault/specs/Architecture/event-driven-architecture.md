---
slug: event-driven-architecture
sources:
  - https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html
  - https://docs.microsoft.com/en-us/azure/architecture/guide/architecture-styles/event-driven
date: 2026-11-02
tags:
  - event-driven
  - architecture
  - messaging
  - events
---

# Event-Driven Architecture

## Definition

Event-Driven Architecture is an **architectural style where systems coordinate through production and consumption of events**. Events are significant occurrences in the system.

> "Event-driven architecture is a software architecture pattern promoting the production, detection, and consumption of events." — Wikipedia

## Problem Addressed

Synchronous communication leads to:
- **Tight coupling**: Services depend on each other's availability
- **Latency**: Synchronous calls add latency
- **Scalability**: Hard to scale independent components
- **Failure propagation**: One failure cascades to others

## Scope and Boundaries

- EDA ≠ Event Sourcing (EDA is about events as communication, ES is about events as state)
- EDA does **not** require a message broker
- EDA ≠ Real-time (events can be processed asynchronously)

## When to Apply

- When systems need to communicate asynchronously
- When multiple systems react to the same event
- When decoupling is important
- When scalability is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Event handling is complex |
| **Eventual consistency** — Not immediate consistency |
| **Debugging** — Hard to trace event flows |

## Common Misuses

- **Events everywhere**: Not everything needs to be event-driven
- **Confusing with ES**: EDA ≠ Event Sourcing
- **No error handling**: Events can be lost without proper handling

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Domain Events
- [Transaction Outbox](Architecture/architecture-patterns.md) — Reliable event publishing
- [CQRS](Architecture/cqrs-pattern.md) — Often used with EDA

## Project Observations

- The project's DDD patterns note covers Domain Events
- No event-driven infrastructure is configured yet
- File naming conventions support EDA:
  - `*.event.ts` — Event definitions
  - `*.adapter.ts` — Event handlers

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
