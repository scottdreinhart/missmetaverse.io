---
slug: a066-database-migrations
sources:
  - https://en.wikipedia.org/wiki/Database_migration
  - https://www.npmjs.com/package/knex
date: 2026-11-02
tags:
  - database-migrations
  - database
  - knex
  - schema
# Database Migrations

## Definition

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Database Migrations are a **technique for managing database schema changes over time**.

> "Database migration is the process of upgrading or downgrading a database schema." â€” Wikipedia

## Problem Addressed

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without database migrations:
- **Inconsistency**: Schema is inconsistent across environments
- **Versioning**: Schema changes are not versioned
- **Rollback**: Hard to rollback schema changes
- **Collaboration**: Hard to collaborate on schema changes

## Scope and Boundaries

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Database Migrations â‰  ORM (database migrations are for schema changes, ORM is for database access)
- Database Migrations â‰  SQL (database migrations are for schema changes, SQL is a language)
- Database Migrations is a **technique**, not a tool

## When to Apply

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when schema changes matter
- when versioning is important
- when collaboration is important

## Tradeoffs and When to Avoid

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

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
| **Complexity** â€” Database migrations are complex |
| **Time** â€” Database migrations take time |
| **Over-migrations** â€” Don't use migrations for everything |

## Common Misuses

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything migrations**: Not everything needs database migrations
- **Confusing with ORM**: Database migrations â‰  ORM
- **Over-migrations**: Too many migrations create complexity

## Related Concepts

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Database Design](Architecture/database-design.md) â€” Database migrations with database design
- [SQL Fundamentals](Architecture/sql-fundamentals.md) â€” Database migrations with SQL
- [ORM Patterns](Architecture/orm-patterns.md) â€” Database migrations with ORM

## Project Observations

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses database migrations:
  - The project's architecture patterns note covers database migrations (from existing notes)
  - No evidence of database migrations in existing code (src/ is empty)
- File naming conventions support database migrations:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a066-database-migrations

## title
Database Migrations

## aliases
- A066-database-migrations

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




