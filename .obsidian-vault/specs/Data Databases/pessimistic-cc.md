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
---

# Pessimistic Concurrency Control

## Definition

Pessimistic Concurrency Control is **a concurrency control method that assumes conflicts will occur and locks resources to prevent concurrent modifications**.

> "Pessimistic concurrency control assumes that concurrent transactions are likely to conflict, so it locks resources before they are accessed." — Wikipedia

## Problem Addressed

Without pessimistic concurrency control:
- **Lost updates**: Concurrent updates overwrite each other
- **Data corruption**: Data is corrupted by concurrent modifications
- **Inconsistent reads**: Reads see partially updated data
- **Non-repeatable reads**: Same query returns different results

## Scope and Boundaries

- Pessimistic CC ≠ Optimistic CC (pessimistic locks resources, optimistic checks at commit time)
- Pessimistic CC = Locking (pessimistic concurrency control uses locks)
- Pessimistic CC is a **concurrency strategy**, not a pattern

## When to Apply

- When concurrent modifications are common
- when data consistency is critical
- when conflicts are likely
- when read-heavy workloads are not the primary concern

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Performance** — Locks reduce concurrency |
| **Deadlocks** — Locks can cause deadlocks |
| **Blocking** — Other transactions must wait |

## Common Misuses

- **Locking everything**: Not every operation needs locking
- **Long locks**: Long locks reduce concurrency
- **Confusing with optimistic**: Pessimistic locks resources, optimistic checks at commit time

## Related Concepts

- [Optimistic Concurrency](Data Databases/optimistic-cc.md) — Optimistic concurrency is the alternative to pessimistic concurrency
- [Transaction Boundaries](Data Databases/transaction-boundaries.md) — Transactions use concurrency control
- [ACID](Data Databases/acid.md) — ACID properties include isolation

## Project Observations

- The project uses pessimistic concurrency control:
  - PostgreSQL supports pessimistic locking
  - MySQL supports pessimistic locking
  - The project's architecture patterns note covers database concepts
  - No evidence of pessimistic concurrency control in existing code (src/ is empty)
- File naming conventions support pessimistic concurrency control:
  - `*.repository.ts` — Repository files
  - `*.migration.ts` — Migration files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

