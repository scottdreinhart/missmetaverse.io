---
slug: normalization
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:










  - database
  - normalization
  - data-modeling
  - sql
---

# Normalization

## Definition

Normalization is **the process of organizing data in a database to reduce redundancy and improve data integrity through decomposition**.

> "Normalization is the process of efficiently organizing data in a database. Two goals are the organization of data to minimize redundancy and minimize modification anomalies." — Wikipedia

## Problem Addressed

Without normalization:
- **Redundancy**: Same data stored multiple times
- **Update anomalies**: Updating data in one place but not others
- **Insert anomalies**: Can't insert data without other data
- **Delete anomalies**: Deleting data loses other data

## Scope and Boundaries

- Normalization ≠ Denormalization (normalization reduces redundancy, denormalization introduces it for performance)
- Normalization = Integrity (normalization improves data integrity)
- Normalization is a **database design principle**, not a pattern

## When to Apply

- When designing relational databases
- when data integrity is critical
- when data redundancy causes problems
- when update anomalies occur

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Normalized databases require more joins |
| **Performance** — More joins can slow queries |
| **Over-normalization** — Don't normalize when performance is critical |

## Common Misuses

- **Normalizing everything**: Not every database needs full normalization
- **Ignoring denormalization**: Sometimes denormalization is necessary for performance
- **Confusing with indexing**: Normalization is about structure, indexing is about access

## Related Concepts

- [Denormalization](Data Databases/denormalization.md) — Denormalization is the opposite of normalization
- [Database Design](Data Databases/database-design.md) — Database design includes normalization
- [Referential Integrity](Data Databases/referential-integrity.md) — Referential integrity is maintained through normalization

## Project Observations

- The project uses normalization:
  - PostgreSQL supports normalization
  - MySQL supports normalization
  - The project's architecture patterns note covers database concepts
  - No evidence of normalized databases in existing code (src/ is empty)
- File naming conventions support normalization:
  - `*.schema.ts` — Schema files
  - `*.migration.ts` — Migration files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




