# Message Queue Pattern

> **Purpose:** Decouple services with Message Queues.
> **Last Updated:** 2026-11-03

---

## concept_id
`message-queue-pattern`

## title
Message Queue Pattern

## aliases
- Message Queue
- MQ Pattern
- Async Messaging
- Queue Pattern

## category
apis-distributed-systems

## concept_type
integration-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Async communication
- Service decoupling
- Task processing
- Event distribution

## tags
- type/pattern
- domain/distributed
- status/verified
- priority/high

## source_ids
- eip-hohpe-woolf
- martinfowler-patterns

## related_concept_ids
- message-queue-pattern
- pub-sub-pattern
- event-driven-architecture
- saga-pattern

---

## Definition

Message Queue Pattern enables asynchronous communication between services by decoupling producers and consumers through a message broker.

## Problem Addressed

Without Message Queues:
- Services are tightly coupled
- Synchronous calls block
- Task processing is manual
- Event distribution is difficult

## Scope of Boundaries

Message Queue applies to:
- Async communication
- Service decoupling
- Task processing
- Event distribution

Message Queue does not apply to:
- Real-time communication
- Simple APIs
- Synchronous calls
- UI rendering

## When to Apply

- Needing async communication
- Decoupling services
- Processing tasks asynchronously
- Distributing events

## Tradeoffs and When to Avoid

- **Complexity**: Message queues add complexity
- **Not for simple apps**: Simple apps don't need message queues
- **Not for real-time**: Real-time needs WebSockets
- **Not for sync**: Synchronous calls don't need queues

## Implementation Guidance

1. **Choose broker**: Choose message broker (RabbitMQ, SQS, etc.)
2. **Define queues**: Define message queues
3. **Implement producer**: Implement message producer
4. **Implement consumer**: Implement message consumer
5. **Handle failures**: Handle message failures

## Verification

- [ ] Broker chosen
- [ ] Queues defined
- [ ] Producer implemented
- [ ] Consumer implemented
- [ ] Failures handled

## Common Misuses

- **Not handling failures**: Not handling message failures
- **Not idempotent**: Not ensuring idempotent consumers
- **Not monitoring**: Not monitoring queue health
- **Not scaling**: Not scaling consumers

## Related Concepts

- [[APIs Distributed Systems/message-queue-pattern]] — Message Queue Pattern
- [[APIs Distributed Systems/pub-sub-pattern]] — Pub-Sub Pattern
- [[APIs Distributed Systems/event-driven-architecture]] — Event-Driven Architecture
- [[APIs Distributed Systems/saga-pattern]] — Saga Pattern

## Project Observations

The project uses Message Queue Pattern through:
- Message broker integration
- Queue definition and management
- Producer/consumer implementation
- Failure handling strategies

## Sources

- [[Sources/eip-hohpe-woolf|Enterprise Integration Patterns — Hohpe & Woolf]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Message Queue Pattern Note**
