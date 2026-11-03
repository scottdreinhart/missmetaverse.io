---
slug: schema-migrations
sources:
  - https://knexjs.org/
  - https://www.postgresql.org/docs/
date: 2026-11-02
tags:










  - database
  - migrations
  - schema
  - devops
---

# Schema Migrations

## Definition

Schema Migrations are **version-controlled scripts that incrementally modify a database schema, enabling consistent schema changes across environments**.

> "A database migration is a set of defined, incremental, atomic, ordered changes to the database schema." — Wikipedia

## Problem Addressed

Without schema migrations:
- **Inconsistent schemas**: Different environments have different schemas
- **Manual changes**: Schema changes are made manually and forgotten
- **Rollback issues**: Can't rollback schema changes
- **Team conflicts**: Multiple developers make conflicting changes

## Scope and Boundaries

- Schema Migrations ≠ Database Design (schema migrations implement changes, database design defines the structure)
- Schema Migrations = Version Control (schema migrations are version controlled)
- Schema Migrations is a **devops practice**, not a pattern

## When to Apply

- When managing database schemas
- when multiple environments exist
- when multiple developers make schema changes
- when rollback capability is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Migrations add tooling complexity |
| **Time** — Writing migrations takes time |
| **Risk** — Bad migrations can corrupt data |

## Common Misuses

- **Dropping columns**: Dropping columns loses data
- **Incompatible changes**: Changes that break existing code
- **Ignoring rollbacks**: Always provide rollback scripts

## Related Concepts

- [Expand-Contract](Data Databases/expand-contract.md) — Expand-contract is a migration strategy
- [Database Design](Data Databases/database-design.md) — Database design defines the schema
- [CI/CD](DevOps/ci-cd.md) — CI/CD pipelines run migrations

## Project Observations

- The project uses schema migrations:
  - Knex provides migration tooling
  - PostgreSQL supports migrations
  - The project's architecture patterns note covers database concepts
  - No evidence of schema migrations in existing code (src/ is empty)
- File naming conventions support schema migrations:
  - `*.migration.ts` — Migration files
  - `*.schema.ts` — Schema files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




