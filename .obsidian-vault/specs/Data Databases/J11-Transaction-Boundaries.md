---
slug: transaction-boundaries
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - maturity/deprecated
  - database
  - transactions
  - data-modeling
  - consistency
  - --
# Transaction Boundaries

## Definition

Transaction Boundaries are **the explicit start and end points of a database transaction, ensuring all operations within the boundary succeed or fail together**.

> "A transaction is a single logical unit of work that accesses and possibly modifies data. A transaction may access data in a database or update/modify data." â€” SQL Standard

## Problem Addressed

Without transaction boundaries:
- **Partial updates**: Some operations succeed, others fail
- **Inconsistent state**: Data is left in an inconsistent state
- **Data corruption**: Related data is not updated together
- **Recovery issues**: Hard to recover from failures

## Scope and Boundaries

- Transaction Boundaries â‰  ACID (transaction boundaries define the scope, ACID is a property of transactions)
- Transaction Boundaries = Consistency (transaction boundaries ensure consistency)
- Transaction Boundaries is a **database concept**, not a pattern

## When to Apply

- When performing multiple related database operations
- when all operations must succeed or fail together
- when data consistency is critical
- when recovery from failures is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Performance** â€” Transactions add overhead |
| **Complexity** â€” More transactions to manage |
| **Locking** â€” Transactions can cause locking issues |

## Common Misuses

- **Everything in a transaction**: Not every operation needs a transaction
- **Long transactions**: Long transactions hold locks longer, causing contention
- **Confusing with unit of work**: Transaction boundaries define the scope, unit of work coordinates changes

## Related Concepts

- [ACID](Data Databases/acid.md) â€” ACID properties apply to transactions
- [Unit of Work](Architecture/unit-of-work-pattern.md) â€” Unit of work coordinates transactions
- [Optimistic Concurrency](Data Databases/optimistic-cc.md) â€” Optimistic concurrency control works with transactions

## Project Observations

- The project uses transaction boundaries:
  - PostgreSQL supports transactions
  - MySQL supports transactions
  - The project's architecture patterns note covers database concepts
  - No evidence of transaction boundaries in existing code (src/ is empty)
- File naming conventions support transaction boundaries:
  - `*.migration.ts` â€” Migration files
  - `*.repository.ts` â€” Repository files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




