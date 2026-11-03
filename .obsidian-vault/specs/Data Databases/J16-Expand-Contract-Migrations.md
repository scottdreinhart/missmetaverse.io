---
slug: expand-contract
sources:
  - https://martinfowler.com/articles/evodb.html
  - https://www.postgresql.org/docs/
date: 2026-11-02
tags:
  - priority/high
  - maturity/deprecated
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/devops
  - status/complete
  - type/reference
  - domain/database
  - database
  - migrations
  - schema
  - zero-downtime
---

# Expand-Contract Migrations

## Definition

Expand-Contract Migrations are **a two-phase migration strategy: first expand (add new functionality without removing old), then contract (remove old functionality)**.

> "The expand/contract pattern is a way to evolve a database schema without downtime." — Martin Fowler

## Problem Addressed

Without expand-contract:
- **Downtime**: Schema changes require downtime
- **Breaking changes**: Changes break existing code
- **Rollback issues**: Can't rollback schema changes
- **Team conflicts**: Multiple teams make conflicting changes

## Scope and Boundaries

- Expand-Contract ≠ Direct Migration (expand-contract is two-phase, direct migration is one-phase)
- Expand-Contract = Zero Downtime (expand-contract enables zero downtime)
- Expand-Contract is a **migration strategy**, not a pattern

## When to Apply

- When managing database schemas in production
- when zero downtime is required
- when multiple services access the same database
- when rolling deployments are used

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Two-phase migrations take longer |
| **Complexity** — More complex migration process |
| **Storage** — Temporary redundancy during expand phase |

## Common Misuses

- **Skipping the contract phase**: Always complete both phases
- **Expanding too much**: Don't add unnecessary functionality in the expand phase
- **Ignoring rollback**: Always provide rollback scripts

## Related Concepts

- [Schema Migrations](Data Databases/schema-migrations.md) — Schema migrations use expand-contract
- [Database Design](Data Databases/database-design.md) — Database design includes migration strategies
- [CI/CD](DevOps/ci-cd.md) — CI/CD pipelines run expand-contract migrations

## Project Observations

- The project uses expand-contract migrations:
  - Knex supports expand-contract migrations
  - PostgreSQL supports expand-contract migrations
  - The project's architecture patterns note covers database concepts
  - No evidence of expand-contract migrations in existing code (src/ is empty)
- File naming conventions support expand-contract migrations:
  - `*.migration.ts` — Migration files
  - `*.schema.ts` — Schema files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]




