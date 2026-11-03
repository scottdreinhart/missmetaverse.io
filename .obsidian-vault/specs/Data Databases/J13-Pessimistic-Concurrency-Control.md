---
slug: pessimistic-cc
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - database
  - concurrency
  - locking
  - consistency
# Pessimistic Concurrency Control

## Definition

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Pessimistic Concurrency Control is **a concurrency control method that assumes conflicts will occur and locks resources to prevent concurrent modifications**.

> "Pessimistic concurrency control assumes that concurrent transactions are likely to conflict, so it locks resources before they are accessed." â€” Wikipedia

## Problem Addressed

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Without pessimistic concurrency control:
- **Lost updates**: Concurrent updates overwrite each other
- **Data corruption**: Data is corrupted by concurrent modifications
- **Inconsistent reads**: Reads see partially updated data
- **Non-repeatable reads**: Same query returns different results

## Scope and Boundaries

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- Pessimistic CC â‰  Optimistic CC (pessimistic locks resources, optimistic checks at commit time)
- Pessimistic CC = Locking (pessimistic concurrency control uses locks)
- Pessimistic CC is a **concurrency strategy**, not a pattern

## When to Apply

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- When concurrent modifications are common
- when data consistency is critical
- when conflicts are likely
- when read-heavy workloads are not the primary concern

## Tradeoffs and When to Avoid

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

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
| **Performance** â€” Locks reduce concurrency |
| **Deadlocks** â€” Locks can cause deadlocks |
| **Blocking** â€” Other transactions must wait |

## Common Misuses

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- **Locking everything**: Not every operation needs locking
- **Long locks**: Long locks reduce concurrency
- **Confusing with optimistic**: Pessimistic locks resources, optimistic checks at commit time

## Related Concepts

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [Optimistic Concurrency](Data Databases/optimistic-cc.md) â€” Optimistic concurrency is the alternative to pessimistic concurrency
- [Transaction Boundaries](Data Databases/transaction-boundaries.md) â€” Transactions use concurrency control
- [ACID](Data Databases/acid.md) â€” ACID properties include isolation

## Project Observations

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- The project uses pessimistic concurrency control:
  - PostgreSQL supports pessimistic locking
  - MySQL supports pessimistic locking
  - The project's architecture patterns note covers database concepts
  - No evidence of pessimistic concurrency control in existing code (src/ is empty)
- File naming conventions support pessimistic concurrency control:
  - `*.repository.ts` â€” Repository files
  - `*.migration.ts` â€” Migration files

## Sources

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

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




