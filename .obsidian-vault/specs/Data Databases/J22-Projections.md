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
# Projections

## Definition

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Projections are **read-optimized views of data derived from domain events or source data, used to serve queries without modifying the source of truth**.

> "A projection is a read-optimized view of data derived from the event store, used to serve queries." â€” Martin Fowler

## Problem Addressed

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Without projections:
- **Slow reads**: Querying the source of truth is slow
- **CQRS separation**: Can't separate read and write models
- **Performance**: Complex queries are expensive
- **Scalability**: Can't scale reads independently

## Scope and Boundaries

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- Projections â‰  Event Sourcing (projections read from events, event sourcing stores events as the source of truth)
- Projections = Read Model (projections serve as read models)
- Projections is a **CQRS building block**, not a pattern

## When to Apply

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- When building CQRS systems
- when read performance is critical
- when the read model differs from the write model
- when event sourcing is used

## Tradeoffs and When to Avoid

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Projections add architectural complexity |
| **Time** â€” Implementing projections takes time |
| **Eventual consistency** â€” Projections may be stale |

## Common Misuses

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- **Everything a projection**: Not every query needs a projection
- **Ignoring consistency**: Projections may be eventually consistent
- **Confusing with materialized views**: Projections are derived from events, materialized views are derived from queries

## Related Concepts

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [Event Sourcing](Data Databases/event-sourcing.md) â€” Projections read from event stores
- [CQRS](Architecture/cqrs-pattern.md) â€” Projections are a CQRS building block
- [Materialized Views](Data Databases/materialized-views.md) â€” Materialized views are similar to projections

## Project Observations

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- The project uses projections:
  - PostgreSQL supports projections
  - The project's architecture patterns note covers CQRS concepts
  - No evidence of projections in existing code (src/ is empty)
- File naming conventions support projections:
  - `*.projection.ts` â€” Projection files
  - `*.schema.ts` â€” Schema files

## Sources

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




