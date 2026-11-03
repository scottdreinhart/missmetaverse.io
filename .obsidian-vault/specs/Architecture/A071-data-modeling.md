---
slug: data-modeling
sources:
  - https://en.wikipedia.org/wiki/Data_modeling
  - https://www.postgresql.org/docs/current/ddl.html
date: 2026-11-02
tags:










  - data-modeling
  - database
  - normalization
  - patterns
---

# Data Modeling

## Definition

Data Modeling is a **process of creating a data model for an information system**.

> "Data modeling is the process of creating a data model for an information system." — Wikipedia

## Problem Addressed

Without data modeling:
- **Data integrity**: Data is inconsistent
- **Performance**: Queries are slow
- **Scalability**: Hard to scale
- **Maintenance**: Hard to maintain

## Scope and Boundaries

- Data Modeling ≠ Database Design (data modeling is a process, database design is a process)
- Data Modeling ≠ SQL (data modeling is a process, SQL is a language)
- Data Modeling is a **process**, not a language

## When to Apply

- When building applications
- when data integrity matters
- when performance is important
- when scalability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Data modeling is complex |
| **Time** — Data modeling takes time |
| **Over-data-modeling** — Don't over-model data |

## Common Misuses

- **Everything data modeled**: Not everything needs data modeling
- **Confusing with database design**: Data modeling ≠ database design
- **Over-data-modeling**: Too much data modeling creates complexity

## Related Concepts

- [Database Design](Architecture/database-design.md) — Data modeling with database design
- [SQL Fundamentals](Architecture/sql-fundamentals.md) — Data modeling with SQL
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — Data modeling with data mapper

## Project Observations

- The project uses data modeling:
  - The project's architecture patterns note covers data modeling (from existing notes)
  - No evidence of data modeling in existing code (src/ is empty)
- File naming conventions support data modeling:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




