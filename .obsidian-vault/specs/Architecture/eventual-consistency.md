---
slug: eventual-consistency
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/consistency-patterns
  - https://en.wikipedia.org/wiki/Eventual_consistency
date: 2026-11-02
tags:
  - consistency
  - distributed-systems
  - eventual-consistency
  - patterns
---

# Eventual Consistency

## Definition

Eventual Consistency is a **consistency model where updates propagate asynchronously and all replicas eventually converge to the same state**.

> "Eventual consistency is a weak consistency model used in distributed computing to achieve high availability rather than immediate consistency." — Wikipedia

## Problem Addressed

Strong consistency leads to:
- **Latency**: Waiting for all replicas to update
- **Availability**: System may be unavailable during updates
- **Scalability**: Hard to scale with strong consistency
- **Cost**: Strong consistency requires expensive coordination

## Scope and Boundaries

- Eventual ≠ Strong (they are different consistency models)
- Eventual ≠ No consistency (eventual guarantees convergence)
- Eventual is a **distributed systems tradeoff**, not a bug

## When to Apply

- When availability is more important than immediate consistency
- When scaling is needed
- When latency matters
- When building distributed systems

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Stale reads** — Users may see old data |
| **Complexity** — Handling stale data is complex |
| **Debugging** — Hard to debug consistency issues |

## Common Misuses

- **Every system**: Not every system needs eventual consistency
- **Ignoring consistency**: Some operations need strong consistency
- **Confusing with caching**: Eventual consistency ≠ cache staleness

## Related Concepts

- [ACID](Architecture/data-modeling-principles.md) — Eventual consistency vs. ACID
- [CQRS](Architecture/cqrs-pattern.md) — Often uses eventual consistency
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Eventual consistency in EDA

## Project Observations

- No distributed system is implemented yet
- The project's architecture patterns note covers eventual consistency
- Docker deployment note covers deployment consistency

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
