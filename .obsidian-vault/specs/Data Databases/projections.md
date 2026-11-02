---
slug: projections
sources:
  - https://www.postgresql.org/docs/
  - https://martinfowler.com/bliki/Projection.html
date: 2026-11-02
tags:
  - database
  - projections
  - event-sourcing
  - cqs
---

# Projections

## Definition

Projections are **read-optimized views of data derived from domain events or source data, used to serve queries without modifying the source of truth**.

> "A projection is a read-optimized view of data derived from the event store, used to serve queries." — Martin Fowler

## Problem Addressed

Without projections:
- **Slow reads**: Querying the source of truth is slow
- **CQRS separation**: Can't separate read and write models
- **Performance**: Complex queries are expensive
- **Scalability**: Can't scale reads independently

## Scope and Boundaries

- Projections ≠ Event Sourcing (projections read from events, event sourcing stores events as the source of truth)
- Projections = Read Model (projections serve as read models)
- Projections is a **CQRS building block**, not a pattern

## When to Apply

- When building CQRS systems
- when read performance is critical
- when the read model differs from the write model
- when event sourcing is used

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Projections add architectural complexity |
| **Time** — Implementing projections takes time |
| **Eventual consistency** — Projections may be stale |

## Common Misuses

- **Everything a projection**: Not every query needs a projection
- **Ignoring consistency**: Projections may be eventually consistent
- **Confusing with materialized views**: Projections are derived from events, materialized views are derived from queries

## Related Concepts

- [Event Sourcing](Data Databases/event-sourcing.md) — Projections read from event stores
- [CQRS](Architecture/cqrs-pattern.md) — Projections are a CQRS building block
- [Materialized Views](Data Databases/materialized-views.md) — Materialized views are similar to projections

## Project Observations

- The project uses projections:
  - PostgreSQL supports projections
  - The project's architecture patterns note covers CQRS concepts
  - No evidence of projections in existing code (src/ is empty)
- File naming conventions support projections:
  - `*.projection.ts` — Projection files
  - `*.schema.ts` — Schema files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
