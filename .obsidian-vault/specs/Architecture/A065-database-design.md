---
slug: database-design
sources:
  - https://en.wikipedia.org/wiki/Database_design
  - https://www.postgresql.org/
date: 2026-11-02
tags:
  - database-design
  - sql
  - postgresql
  - normalization
# Database Design

## Definition

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Database Design is the **process of creating a database schema that represents data and relationships according to requirements**.

> "Database design is the process of producing a detailed data model of a database." â€” Wikipedia

## Problem Addressed

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without database design:
- **Data integrity**: Data is inconsistent
- **Performance**: Queries are slow
- **Scalability**: Hard to scale
- **Maintenance**: Hard to maintain

## Scope and Boundaries

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Database Design â‰  SQL (database design is a process, SQL is a language)
- Database Design â‰  ORM (database design is a process, ORM is a tool)
- Database Design is a **process**, not a tool

## When to Apply

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when data integrity matters
- when performance is important
- when scalability is important

## Tradeoffs and When to Avoid

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Database design is complex |
| **Time** â€” Database design takes time |
| **Over-design** â€” Don't over-design databases |

## Common Misuses

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything database design**: Not everything needs database design
- **Confusing with SQL**: Database design â‰  SQL
- **Over-design**: Too much design creates complexity

## Related Concepts

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [SQL Fundamentals](Architecture/sql-fundamentals.md) â€” Database design with SQL
- [NoSQL Patterns](Architecture/nosql-patterns.md) â€” Database design with NoSQL
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) â€” Database design with data mapper

## Project Observations

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses database design:
  - The project's architecture patterns note covers database design (from existing notes)
  - No evidence of database design in existing code (src/ is empty)
- File naming conventions support database design:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a065-database-design

## title
Database Design

## aliases
- A065-database-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




