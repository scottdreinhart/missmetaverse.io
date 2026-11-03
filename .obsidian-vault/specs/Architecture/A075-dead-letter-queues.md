---
slug: dead-letter-queues
sources:
  - https://www.enterpriseintegrationpatterns.com/patterns/messaging/DeadLetterChannel.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/dead-letter-queue
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - status/complete
  - type/reference
  - domain/architecture
  - dlq
  - messaging
  - distributed-systems
  - patterns
---

# Dead-Letter Queues

## Definition

Dead-Letter Queues (DLQs) are **queues where messages that can't be processed are sent for later inspection and handling**.

> "A dead-letter channel captures messages that cannot be processed or routed to their intended destination." — Enterprise Integration Patterns

## Problem Addressed

Without DLQs:
- **Lost messages**: Failed messages are lost
- **Queue blocking**: Failed messages block the queue
- **Debugging difficulty**: Hard to find failed messages
- **Data loss**: Messages are silently dropped

## Scope and Boundaries

- DLQ ≠ Retry (DLQ is for messages that can't be processed, retry tries again)
- DLQ ≠ Error handling (DLQ is a storage mechanism, error handling is a process)
- DLQ is a **messaging pattern**, not a general error handling pattern

## When to Apply

- When using message queues
- When message processing can fail
- When messages need to be inspected later
- When building event-driven systems

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Storage** — DLQs use storage |
| **Monitoring** — DLQs need monitoring |
| **Complexity** — DLQ handling adds complexity |

## Common Misuses

- **Every queue**: Not every queue needs a DLQ
- **Ignoring DLQs**: DLQs need monitoring and handling
- **Confusing with retry**: DLQ ≠ retry

## Related Concepts

- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — DLQs in EDA
- [Transaction Outbox](Architecture/transactional-outbox.md) — Reliable event publishing
- [Observability](Architecture/quality-delivery-maintainability.md) — DLQs need monitoring

## Project Observations

- No message queues are implemented yet
- The project's architecture patterns note covers DLQs
- DDD patterns note covers Domain Events (used with DLQs)

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]



