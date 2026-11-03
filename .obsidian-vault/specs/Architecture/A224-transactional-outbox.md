---
slug: transactional-outbox
sources:
  - https://microservices.io/patterns/data/transactional-outbox.html
  - https://learn.microsoft.com/en-us/azure/architecture/patterns/transactional-outbox
date: 2026-11-02
tags:
  - outbox
  - distributed-systems
  - events
  - patterns
  - --
# Transactional Outbox

## Definition

The Transactional Outbox pattern is a **reliable event publishing pattern where business changes and event publication intents are persisted in one transaction**.

> "The Outbox pattern ensures that every business transaction that produces events does so in an atomic way." â€” Microsoft Azure Architecture

## Problem Addressed

Without outbox:
- **Lost events**: Events published but business transaction fails
- **Inconsistent state**: Business data and events are out of sync
- **Duplicate events**: Events published multiple times
- **Eventual consistency**: Hard to guarantee consistency

## Scope and Boundaries

- Outbox â‰  Exactly-once delivery (outbox guarantees at-least-once)
- Outbox â‰  Event Sourcing (outbox publishes events, ES stores events as state)
- Outbox is a **reliability pattern**, not a storage pattern

## When to Apply

- When publishing events alongside business transactions
- When consistency between business data and events matters
- When using event-driven architecture
- When building microservices

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Outbox table and worker needed |
| **Storage** â€” Extra table for outbox events |
| **Latency** â€” Event publishing is delayed |

## Common Misuses

- **Every transaction**: Not every transaction needs an outbox
- **Confusing with ES**: Outbox â‰  Event Sourcing
- **Exactly-once**: Outbox doesn't guarantee exactly-once

## Related Concepts

- [Event-Driven Architecture](Architecture/event-driven-architecture.md) â€” Outbox enables reliable EDA
- [DDD Patterns](Architecture/ddd-patterns.md) â€” Domain Events
- [Saga Pattern](Architecture/architecture-patterns.md) â€” Often used with outbox

## Project Observations

- No evidence of outbox in existing code (src/ is empty)
- The project's architecture patterns note covers outbox
- DDD patterns note covers Domain Events

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




