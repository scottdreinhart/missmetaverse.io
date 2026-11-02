---
slug: orm-patterns
sources:
  - https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping
  - https://typeorm.io/
date: 2026-11-02
tags:
  - orm
  - database
  - typeorm
  - prisma
---

# ORM Patterns

## Definition

ORM Patterns are **design patterns for mapping database tables to objects in code**.

> "Object–relational mapping (ORM) is a technique with which the instances of classes are connected to rows of a database table." — Wikipedia

## Problem Addressed

Without ORM patterns:
- **Complexity**: Database access is complex
- **Coupling**: Code is coupled to database
- **Testing**: Hard to test database access
- **Maintenance**: Hard to maintain database access

## Scope and Boundaries

- ORM ≠ SQL (ORM is a tool, SQL is a language)
- ORM ≠ Data Mapper (ORM is a tool, data mapper is a pattern)
- ORM is a **tool**, not a pattern

## When to Apply

- When building applications
- when database access matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — ORM is complex |
| **Time** — ORM takes time |
| **Over-ORM** — Don't use ORM for everything |

## Common Misuses

- **Everything ORM**: Not everything needs ORM
- **Confusing with SQL**: ORM ≠ SQL
- **Over-ORM**: Too much ORM creates complexity

## Related Concepts

- [Database Design](Architecture/database-design.md) — ORM with database design
- [SQL Fundamentals](Architecture/sql-fundamentals.md) — ORM with SQL
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — ORM with data mapper

## Project Observations

- The project uses ORM:
  - The project's architecture patterns note covers ORM (from existing notes)
  - No evidence of ORM in existing code (src/ is empty)
- File naming conventions support ORM:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

