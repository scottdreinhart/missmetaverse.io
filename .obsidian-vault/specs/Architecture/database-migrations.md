---
slug: database-migrations
sources:
  - https://en.wikipedia.org/wiki/Database_migration
  - https://www.npmjs.com/package/knex
date: 2026-11-02
tags:
  - database-migrations
  - database
  - knex
  - schema
---

# Database Migrations

## Definition

Database Migrations are a **technique for managing database schema changes over time**.

> "Database migration is the process of upgrading or downgrading a database schema." — Wikipedia

## Problem Addressed

Without database migrations:
- **Inconsistency**: Schema is inconsistent across environments
- **Versioning**: Schema changes are not versioned
- **Rollback**: Hard to rollback schema changes
- **Collaboration**: Hard to collaborate on schema changes

## Scope and Boundaries

- Database Migrations ≠ ORM (database migrations are for schema changes, ORM is for database access)
- Database Migrations ≠ SQL (database migrations are for schema changes, SQL is a language)
- Database Migrations is a **technique**, not a tool

## When to Apply

- When building applications
- when schema changes matter
- when versioning is important
- when collaboration is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Database migrations are complex |
| **Time** — Database migrations take time |
| **Over-migrations** — Don't use migrations for everything |

## Common Misuses

- **Everything migrations**: Not everything needs database migrations
- **Confusing with ORM**: Database migrations ≠ ORM
- **Over-migrations**: Too many migrations create complexity

## Related Concepts

- [Database Design](Architecture/database-design.md) — Database migrations with database design
- [SQL Fundamentals](Architecture/sql-fundamentals.md) — Database migrations with SQL
- [ORM Patterns](Architecture/orm-patterns.md) — Database migrations with ORM

## Project Observations

- The project uses database migrations:
  - The project's architecture patterns note covers database migrations (from existing notes)
  - No evidence of database migrations in existing code (src/ is empty)
- File naming conventions support database migrations:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

