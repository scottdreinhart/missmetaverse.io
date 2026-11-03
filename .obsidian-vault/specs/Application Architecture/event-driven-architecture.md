---
slug: event-driven-architecture
---

# Event-Driven Architecture

> **Purpose:** Build systems with Event-Driven Architecture.
> **Last Updated:** 2026-11-03

## concept_id
`event-driven-architecture`

## title
Event-Driven Architecture

## aliases
- EDA
- Event-Driven
- Event Architecture
- Event Sourcing

## category
application-architecture

## concept_type
architectural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Async systems
- Event processing
- Service communication
- Real-time systems

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- microservices-patterns

## related_concept_ids
- event-driven-architecture
- event-sourcing
- cqs-pattern
- message-queue

## Definition

Event-Driven Architecture is an architectural pattern where services communicate through producing and consuming events, enabling loose coupling and async processing.

## Problem Addressed

Without EDA:
- Services are tightly coupled
- Sync calls block
- Real-time is difficult
- Scalability is limited

## Scope of Boundaries

EDA applies to:
- Async systems
- Event processing
- Service communication
- Real-time systems

EDA does not apply to:
- Simple apps
- Sync systems
- UI rendering
- Database design

## When to Apply

- Building async systems
- Processing events
- Communicating between services
- Building real-time systems

## Tradeoffs and When to Avoid

- **Complexity**: EDA adds complexity
- **Not for simple apps**: Simple apps don't need EDA
- **Not for sync**: Sync systems don't need EDA
- **Not for debugging**: EDA is hard to debug

## Implementation Guidance

1. **Define events**: Define event schema
2. **Create producer**: Create event producer
3. **Create consumer**: Create event consumer
4. **Handle ordering**: Handle event ordering
5. **Handle failures**: Handle event failures

## Verification

- [ ] Events defined
- [ ] Producer created
- [ ] Consumer created
- [ ] Ordering handled
- [ ] Failures handled

## Common Misuses

- **Not handling failures**: Not handling event failures
- **Not ordering**: Not handling event ordering
- **Not testing**: Not testing async scenarios
- **Over-eventing**: Creating too many events

## Related Concepts

- [[Application Architecture/event-driven-architecture]] â€” Event-Driven Architecture
- [[Data Databases/event-sourcing]] â€” Event Sourcing
- [[Architecture/command-query-separation]] â€” Command-Query Separation
- [[APIs Distributed Systems/message-queue-pattern]] â€” Message Queue

## Project Observations

The project uses Event-Driven Architecture through:
- Event schema definition
- Event producer/consumer implementation
- Event ordering handling
- Failure handling strategies

## Sources

- [[Sources/martinfowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/microservices-patterns|Microservices Patterns â€” Christensen]]

**End of Event-Driven Architecture Note**
