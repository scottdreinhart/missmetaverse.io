---
slug: expand-contract
sources:
  - https://martinfowler.com/articles/evodb.html
  - https://www.postgresql.org/docs/
date: 2026-11-02
tags:
  - maturity/deprecated
  - database
  - migrations
  - schema
  - zero-downtime
# Expand-Contract Migrations

## Definition

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Expand-Contract Migrations are **a two-phase migration strategy: first expand (add new functionality without removing old), then contract (remove old functionality)**.

> "The expand/contract pattern is a way to evolve a database schema without downtime." â€” Martin Fowler

## Problem Addressed

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Without expand-contract:
- **Downtime**: Schema changes require downtime
- **Breaking changes**: Changes break existing code
- **Rollback issues**: Can't rollback schema changes
- **Team conflicts**: Multiple teams make conflicting changes

## Scope and Boundaries

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- Expand-Contract â‰  Direct Migration (expand-contract is two-phase, direct migration is one-phase)
- Expand-Contract = Zero Downtime (expand-contract enables zero downtime)
- Expand-Contract is a **migration strategy**, not a pattern

## When to Apply

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- When managing database schemas in production
- when zero downtime is required
- when multiple services access the same database
- when rolling deployments are used

## Tradeoffs and When to Avoid

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Time** â€” Two-phase migrations take longer |
| **Complexity** â€” More complex migration process |
| **Storage** â€” Temporary redundancy during expand phase |

## Common Misuses

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- **Skipping the contract phase**: Always complete both phases
- **Expanding too much**: Don't add unnecessary functionality in the expand phase
- **Ignoring rollback**: Always provide rollback scripts

## Related Concepts

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [Schema Migrations](Data Databases/schema-migrations.md) â€” Schema migrations use expand-contract
- [Database Design](Data Databases/database-design.md) â€” Database design includes migration strategies
- [CI/CD](DevOps/ci-cd.md) â€” CI/CD pipelines run expand-contract migrations

## Project Observations

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- The project uses expand-contract migrations:
  - Knex supports expand-contract migrations
  - PostgreSQL supports expand-contract migrations
  - The project's architecture patterns note covers database concepts
  - No evidence of expand-contract migrations in existing code (src/ is empty)
- File naming conventions support expand-contract migrations:
  - `*.migration.ts` â€” Migration files
  - `*.schema.ts` â€” Schema files

## Sources

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




