---
slug: sql-fundamentals
sources:
  - https://www.postgresql.org/
  - https://www.mysql.com/
date: 2026-11-02
tags:









  - sql
  - database
  - postgresql
  - mysql
---

# SQL Fundamentals

## Definition

SQL Fundamentals are the **basic concepts and syntax for querying and manipulating relational databases**.

> "SQL (Structured Query Language) is a standard language for storing, manipulating and retrieving data in relational databases." — Wikipedia

## Problem Addressed

Without SQL fundamentals:
- **Data access**: Hard to access data
- **Data manipulation**: Hard to manipulate data
- **Data retrieval**: Hard to retrieve data
- **Data integrity**: Hard to maintain data integrity

## Scope and Boundaries

- SQL ≠ NoSQL (SQL is for relational databases, NoSQL is for non-relational databases)
- SQL ≠ ORM (SQL is a language, ORM is a tool)
- SQL is a **language**, not a tool

## When to Apply

- When building applications
- when database access matters
- when data integrity is important
- when data retrieval is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — SQL is complex |
| **Time** — SQL takes time |
| **Over-SQL** — Don't use SQL for everything |

## Common Misuses

- **Everything SQL**: Not everything needs SQL
- **Confusing with NoSQL**: SQL ≠ NoSQL
- **Over-SQL**: Too much SQL creates complexity

## Related Concepts

- [Database Design](Architecture/database-design.md) — SQL with database design
- [ORM](Architecture/orm.md) — SQL with ORM
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — SQL with data mapper

## Project Observations

- The project uses SQL:
  - The project's architecture patterns note covers SQL (from existing notes)
  - No evidence of SQL in existing code (src/ is empty)
- File naming conventions support SQL:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




