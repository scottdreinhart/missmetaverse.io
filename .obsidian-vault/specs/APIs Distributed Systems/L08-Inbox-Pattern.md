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
# Inbox Pattern

## Definition

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Inbox Pattern is **a distributed systems pattern that prevents duplicate processing of messages by tracking which messages have already been processed**.

> "The inbox pattern prevents duplicate processing by tracking which messages have been processed by a service." â€” Microsoft

## Problem Addressed

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Without inbox pattern:
- **Duplicate processing**: Messages processed multiple times
- **Data corruption**: Duplicate processing corrupts data
- **Financial issues**: Charges applied multiple times
- **Inconsistent state**: System state is inconsistent

## Scope and Boundaries

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- Inbox Pattern â‰  Outbox Pattern (inbox prevents duplicate processing of incoming messages, outbox ensures reliable delivery of outgoing messages)
- Inbox Pattern = Deduplication (inbox pattern prevents duplicate processing)
- Inbox Pattern is a **reliability pattern**, not a design pattern

## When to Apply

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- When building distributed systems with message queues
- when at-least-once delivery is used
- when duplicate processing causes problems
- when financial transactions are involved

## Tradeoffs and When to Avoid

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Inbox pattern requires tracking |
| **Storage** â€” Need to track processed messages |
| **Time** â€” Implementing inbox pattern takes time |

## Common Misuses

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- **Everything inbox**: Not every message needs inbox tracking
- **Ignoring storage**: Processed message tracking requires storage
- **Confusing with outbox**: Inbox prevents duplicates, outbox ensures delivery

## Related Concepts

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- [Transactional Outbox](Architecture/transactional-outbox.md) â€” Transactional outbox is the complement to inbox pattern
- [Message Deduplication](APIs Distributed Systems/message-deduplication.md) â€” Message deduplication is related to inbox pattern
- [Idempotency](Data Databases/idempotency.md) â€” Idempotency complements inbox pattern

## Project Observations

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- The project uses inbox pattern:
  - Node.js supports inbox pattern through message tracking
  - TypeScript can enforce inbox pattern through type system
  - The project's architecture patterns note covers distributed systems concepts
  - No evidence of inbox pattern in existing code (src/ is empty)
- File naming conventions support inbox pattern:
  - `*.event.ts` â€” Event files
  - `*.repository.ts` â€” Repository files

## Sources

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- [[]
- [[Sources/react-docs-2026|react-docs-2026]]




