---
slug: inbox-pattern
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/guide/components/inbox-outbox
  - https://microservices.io/patterns/data/transactional-outbox.html
date: 2026-11-02
tags:









  - inbox-pattern
  - distributed-systems
  - messaging
  - reliability
---

# Inbox Pattern

## Definition

Inbox Pattern is **a distributed systems pattern that prevents duplicate processing of messages by tracking which messages have already been processed**.

> "The inbox pattern prevents duplicate processing by tracking which messages have been processed by a service." — Microsoft

## Problem Addressed

Without inbox pattern:
- **Duplicate processing**: Messages processed multiple times
- **Data corruption**: Duplicate processing corrupts data
- **Financial issues**: Charges applied multiple times
- **Inconsistent state**: System state is inconsistent

## Scope and Boundaries

- Inbox Pattern ≠ Outbox Pattern (inbox prevents duplicate processing of incoming messages, outbox ensures reliable delivery of outgoing messages)
- Inbox Pattern = Deduplication (inbox pattern prevents duplicate processing)
- Inbox Pattern is a **reliability pattern**, not a design pattern

## When to Apply

- When building distributed systems with message queues
- when at-least-once delivery is used
- when duplicate processing causes problems
- when financial transactions are involved

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Inbox pattern requires tracking |
| **Storage** — Need to track processed messages |
| **Time** — Implementing inbox pattern takes time |

## Common Misuses

- **Everything inbox**: Not every message needs inbox tracking
- **Ignoring storage**: Processed message tracking requires storage
- **Confusing with outbox**: Inbox prevents duplicates, outbox ensures delivery

## Related Concepts

- [Transactional Outbox](Architecture/transactional-outbox.md) — Transactional outbox is the complement to inbox pattern
- [Message Deduplication](APIs Distributed Systems/message-deduplication.md) — Message deduplication is related to inbox pattern
- [Idempotency](Data Databases/idempotency.md) — Idempotency complements inbox pattern

## Project Observations

- The project uses inbox pattern:
  - Node.js supports inbox pattern through message tracking
  - TypeScript can enforce inbox pattern through type system
  - The project's architecture patterns note covers distributed systems concepts
  - No evidence of inbox pattern in existing code (src/ is empty)
- File naming conventions support inbox pattern:
  - `*.event.ts` — Event files
  - `*.repository.ts` — Repository files

## Sources

- [[]
- [[Sources/react-docs-2026|react-docs-2026]]




