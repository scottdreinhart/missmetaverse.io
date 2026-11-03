---
slug: a093-event-driven-architecture
sources:
  - https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html
  - https://docs.microsoft.com/en-us/azure/architecture/guide/architecture-styles/event-driven
date: 2026-11-02
tags:
  - event-driven
  - architecture
  - messaging
  - events
# Event-Driven Architecture

## Definition

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Event-Driven Architecture is an **architectural style where systems coordinate through production and consumption of events**. Events are significant occurrences in the system.

> "Event-driven architecture is a software architecture pattern promoting the production, detection, and consumption of events." â€” Wikipedia

## Problem Addressed

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Synchronous communication leads to:
- **Tight coupling**: Services depend on each other's availability
- **Latency**: Synchronous calls add latency
- **Scalability**: Hard to scale independent components
- **Failure propagation**: One failure cascades to others

## Scope and Boundaries

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- EDA â‰  Event Sourcing (EDA is about events as communication, ES is about events as state)
- EDA does **not** require a message broker
- EDA â‰  Real-time (events can be processed asynchronously)

## When to Apply

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When systems need to communicate asynchronously
- When multiple systems react to the same event
- When decoupling is important
- When scalability is needed

## Tradeoffs and When to Avoid

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

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
| **Complexity** â€” Event handling is complex |
| **Eventual consistency** â€” Not immediate consistency |
| **Debugging** â€” Hard to trace event flows |

## Common Misuses

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Events everywhere**: Not everything needs to be event-driven
- **Confusing with ES**: EDA â‰  Event Sourcing
- **No error handling**: Events can be lost without proper handling

## Related Concepts

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Domain Events
- [Transaction Outbox](Architecture/architecture-patterns.md) â€” Reliable event publishing
- [CQRS](Architecture/cqrs-pattern.md) â€” Often used with EDA

## Project Observations

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project's DDD patterns note covers Domain Events
- No event-driven infrastructure is configured yet
- File naming conventions support EDA:
  - `*.event.ts` â€” Event definitions
  - `*.adapter.ts` â€” Event handlers

## Sources

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]

---

## Copilot Instructions

## concept_id
a093-event-driven-architecture

## title
Event-Driven Architecture

## aliases
- A093-event-driven-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### When to Read This Note
- Designing asynchronous communication between modules
- Implementing domain events from DDD
- Decoupling services that need to react to the same occurrence
- Code review: checking for event handling patterns

### What to Do With This Information
1. **Identify events**: Significant occurrences in the domain (OrderCreated, UserRegistered)
2. **Choose topology**: Broker (RabbitMQ) for many-to-many, Mediator (NATS) for request/response
3. **Implement handlers**: Each event can have multiple independent handlers
4. **Handle failures**: Implement dead letter queues, retry logic, idempotent consumers
5. **Validate**: Events should be immutable, versioned, and descriptive

### Tools to Use
- **VS Code Extension**: Error Lens â€” for inline event handler errors
- **npm Package**: `amqplib` â€” for RabbitMQ client
- **npm Package**: `nats` â€” for NATS client
- **Terminal Command**: `pnpm add amqplib` â€” install RabbitMQ client
- **Terminal Command**: `pnpm add nats` â€” install NATS client

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing event flows
- **Security Review Agent**: Run when events contain sensitive data

### Integration with Other Notes
- Read [[Application Architecture/domain-driven-design]] for domain event patterns
- Read [cqrs-pattern](https://learn.microsoft.com/azure/architecture/patterns/cqrs) for CQRS + EDA integration
- Read [transactional-outbox](https://microservices.io/patterns/data/transactional-outbox.html) for reliable event publishing
- Read [circuit-breaker-pattern](https://martinfowler.com/bliki/CircuitBreaker.html) for handling event processing failures

### Common Pitfalls
- Don't make everything event-driven (synchronous is fine for simple cases)
- Don't confuse EDA with Event Sourcing (EDA is communication, ES is state)
- Don't forget error handling (events can be lost without proper handling)
- Don't put business logic in event handlers (use domain services)
- Don't make events mutable (events are facts, they should never change)



