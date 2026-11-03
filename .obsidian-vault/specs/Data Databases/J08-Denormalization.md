---
slug: denormalization
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - database
  - denormalization
  - data-modeling
  - performance
  - --
# Intentional Denormalization

## Definition

Intentional Denormalization is **the deliberate introduction of redundancy into a normalized database to improve read performance**.

> "Denormalization is the intentional introduction of redundancy into a normalized database to improve read performance." â€” Wikipedia

## Problem Addressed

Without denormalization:
- **Slow reads**: Too many joins slow down queries
- **Performance issues**: Complex queries are slow
- **Scalability**: Can't scale reads efficiently
- **Cost**: More database resources needed

## Scope and Boundaries

- Denormalization â‰  Normalization (denormalization introduces redundancy, normalization reduces it)
- Denormalization = Performance (denormalization improves read performance)
- Denormalization is a **database design principle**, not a pattern

## When to Apply

- When read performance is critical
- when joins are too expensive
- when the database is read-heavy
- when caching is not sufficient

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Redundancy** â€” Data is stored multiple times |
| **Update anomalies** â€” Updates must be propagated |
| **Complexity** â€” More complex data management |

## Common Misuses

- **Denormalizing everything**: Only denormalize when performance is an issue
- **Ignoring update anomalies**: Updates must be propagated to all copies
- **Confusing with caching**: Denormalization is at the database level, caching is at the application level

## Related Concepts

- [Normalization](Data Databases/normalization.md) â€” Normalization is the opposite of denormalization
- [Caching Strategies](Data Databases/caching-strategies.md) â€” Caching can reduce the need for denormalization
- [Database Design](Data Databases/database-design.md) â€” Database design includes denormalization decisions

## Project Observations

- The project uses denormalization:
  - PostgreSQL supports denormalization
  - MySQL supports denormalization
  - The project's architecture patterns note covers database concepts
  - No evidence of denormalized databases in existing code (src/ is empty)
- File naming conventions support denormalization:
  - `*.schema.ts` â€” Schema files
  - `*.migration.ts` â€” Migration files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




