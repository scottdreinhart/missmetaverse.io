---
slug: materialized-views
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/optimization
  - status/complete
  - type/reference
  - domain/database
  - database
  - materialized-views
  - performance
  - caching
---

# Materialized Views

## Definition

Materialized Views are **database objects that store the result of a query, providing pre-computed results for faster access**.

> "A materialized view is a database object that contains the results of a query. It is stored on disk and can be refreshed periodically." — PostgreSQL Docs

## Problem Addressed

Without materialized views:
- **Slow queries**: Complex queries are slow
- **Performance issues**: Real-time computation is expensive
- **Scalability**: Can't scale reads efficiently
- **User experience**: Users wait too long for results

## Scope and Boundaries

- Materialized Views ≠ Regular Views (materialized views store results, regular views are virtual)
- Materialized Views = Performance (materialized views improve performance)
- Materialized Views is a **database feature**, not a pattern

## When to Apply

- When running complex queries frequently
- when real-time data is not required
- when read performance is critical
- when caching at the application level is not sufficient

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Staleness** — Data may be stale |
| **Storage** — Materialized views consume storage |
| **Refresh** — Must refresh materialized views |

## Common Misuses

- **Everything a materialized view**: Not every query needs a materialized view
- **Ignoring refresh**: Materialized views must be refreshed
- **Confusing with caching**: Materialized views are at the database level, caching is at the application level

## Related Concepts

- [Caching Strategies](Data Databases/caching-strategies.md) — Caching strategies complement materialized views
- [Database Design](Data Databases/database-design.md) — Database design includes materialized views
- [Projections](Data Databases/projections.md) — Projections are similar to materialized views

## Project Observations

- The project uses materialized views:
  - PostgreSQL supports materialized views
  - MySQL supports materialized views (through views)
  - The project's architecture patterns note covers database concepts
  - No evidence of materialized views in existing code (src/ is empty)
- File naming conventions support materialized views:
  - `*.schema.ts` — Schema files
  - `*.migration.ts` — Migration files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]




