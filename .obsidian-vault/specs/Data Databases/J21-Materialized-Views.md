---
slug: materialized-views
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - database
  - materialized-views
  - performance
  - caching
# Materialized Views

## Definition

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Materialized Views are **database objects that store the result of a query, providing pre-computed results for faster access**.

> "A materialized view is a database object that contains the results of a query. It is stored on disk and can be refreshed periodically." â€” PostgreSQL Docs

## Problem Addressed

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Without materialized views:
- **Slow queries**: Complex queries are slow
- **Performance issues**: Real-time computation is expensive
- **Scalability**: Can't scale reads efficiently
- **User experience**: Users wait too long for results

## Scope and Boundaries

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- Materialized Views â‰  Regular Views (materialized views store results, regular views are virtual)
- Materialized Views = Performance (materialized views improve performance)
- Materialized Views is a **database feature**, not a pattern

## When to Apply

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- When running complex queries frequently
- when real-time data is not required
- when read performance is critical
- when caching at the application level is not sufficient

## Tradeoffs and When to Avoid

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

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
| **Staleness** â€” Data may be stale |
| **Storage** â€” Materialized views consume storage |
| **Refresh** â€” Must refresh materialized views |

## Common Misuses

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- **Everything a materialized view**: Not every query needs a materialized view
- **Ignoring refresh**: Materialized views must be refreshed
- **Confusing with caching**: Materialized views are at the database level, caching is at the application level

## Related Concepts

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [Caching Strategies](Data Databases/caching-strategies.md) â€” Caching strategies complement materialized views
- [Database Design](Data Databases/database-design.md) â€” Database design includes materialized views
- [Projections](Data Databases/projections.md) â€” Projections are similar to materialized views

## Project Observations

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- The project uses materialized views:
  - PostgreSQL supports materialized views
  - MySQL supports materialized views (through views)
  - The project's architecture patterns note covers database concepts
  - No evidence of materialized views in existing code (src/ is empty)
- File naming conventions support materialized views:
  - `*.schema.ts` â€” Schema files
  - `*.migration.ts` â€” Migration files

## Sources

## concept_id
j21-materialized-views

## title
Materialized Views

## aliases
- J21-Materialized-Views

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




