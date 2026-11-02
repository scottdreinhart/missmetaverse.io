---
slug: nosql-patterns
sources:
  - https://en.wikipedia.org/wiki/NoSQL
  - https://www.mongodb.com/nosql-explained
date: 2026-11-02
tags:
  - nosql
  - database
  - mongodb
  - redis
---

# NoSQL Patterns

## Definition

NoSQL Patterns are **design patterns for working with non-relational databases**.

> "NoSQL (Not only SQL) is a database that stores data in a manner other than tabular relations." — Wikipedia

## Problem Addressed

Without NoSQL patterns:
- **Scalability**: Hard to scale relational databases
- **Flexibility**: Hard to change schema
- **Performance**: Hard to achieve high performance
- **Data types**: Hard to store non-relational data

## Scope and Boundaries

- NoSQL ≠ SQL (NoSQL is for non-relational databases, SQL is for relational databases)
- NoSQL ≠ ORM (NoSQL is a database type, ORM is a tool)
- NoSQL is a **database type**, not a tool

## When to Apply

- When building applications
- when scalability matters
- when flexibility is important
- when performance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — NoSQL is complex |
| **Time** — NoSQL takes time |
| **Over-NoSQL** — Don't use NoSQL for everything |

## Common Misuses

- **Everything NoSQL**: Not everything needs NoSQL
- **Confusing with SQL**: NoSQL ≠ SQL
- **Over-NoSQL**: Too much NoSQL creates complexity

## Related Concepts

- [Database Design](Architecture/database-design.md) — NoSQL with database design
- [SQL Fundamentals](Architecture/sql-fundamentals.md) — NoSQL with SQL
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — NoSQL with data mapper

## Project Observations

- The project uses NoSQL:
  - The project's architecture patterns note covers NoSQL (from existing notes)
  - No evidence of NoSQL in existing code (src/ is empty)
- File naming conventions support NoSQL:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
