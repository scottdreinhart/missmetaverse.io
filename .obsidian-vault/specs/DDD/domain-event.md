---
slug: domain-event
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/DomainEvent.html
date: 2026-11-02
tags:
  - ddd
  - domain-event
  - domain-modeling
  - event-driven
---

# Domain Event

## Definition

Domain Event is **a significant occurrence or change in the domain that is important to other parts of the system**.

> "A domain event is something that happened in the domain that the rest of the domain model needs to know about." — Eric Evans

## Problem Addressed

Without domain events:
- **Tight coupling**: Components are tightly coupled through direct calls
- **Missing side effects**: Important side effects are not triggered
- **No audit trail**: Cannot track domain changes
- **No eventual consistency**: Cannot coordinate across bounded contexts

## Scope and Boundaries

- Domain Event ≠ Application Event (domain event represents domain knowledge, application event represents application state changes)
- Domain Event = Notification (domain events notify other parts of the system)
- Domain Event is a **domain model building block**, not a pattern

## When to Apply

- When building domain models with complex interactions
- when other parts of the system need to react to domain changes
- when an audit trail is needed
- when eventual consistency is required

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Domain events add architectural complexity |
| **Time** — Designing domain events takes time |
| **Over-event** — Not every change needs to be an event |

## Common Misuses

- **Everything an event**: Not every change needs to be an event
- **Domain logic in event handlers**: Event handlers should not contain domain logic
- **Confusing with application event**: Domain events represent domain knowledge, application events represent application state changes

## Related Concepts

- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Domain events are a form of event-driven architecture
- [Domain Invariant](DDD/domain-invariant.md) — Domain events can trigger invariant checks
- [Transactional Outbox](Architecture/transactional-outbox.md) — Transactional outbox ensures domain events are persisted

## Project Observations

- The project uses domain events:
  - TypeScript events can serve as domain events
  - The project's architecture patterns note covers DDD concepts
  - No evidence of domain events in existing code (src/ is empty)
- File naming conventions support domain events:
  - `*.event.ts` — Event files
  - `*.domain-event.ts` — Domain event files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

