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
# Schema Migrations

## Definition

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Schema Migrations are **version-controlled scripts that incrementally modify a database schema, enabling consistent schema changes across environments**.

> "A database migration is a set of defined, incremental, atomic, ordered changes to the database schema." â€” Wikipedia

## Problem Addressed

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Without schema migrations:
- **Inconsistent schemas**: Different environments have different schemas
- **Manual changes**: Schema changes are made manually and forgotten
- **Rollback issues**: Can't rollback schema changes
- **Team conflicts**: Multiple developers make conflicting changes

## Scope and Boundaries

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- Schema Migrations â‰  Database Design (schema migrations implement changes, database design defines the structure)
- Schema Migrations = Version Control (schema migrations are version controlled)
- Schema Migrations is a **devops practice**, not a pattern

## When to Apply

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- When managing database schemas
- when multiple environments exist
- when multiple developers make schema changes
- when rollback capability is needed

## Tradeoffs and When to Avoid

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

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
| **Complexity** â€” Migrations add tooling complexity |
| **Time** â€” Writing migrations takes time |
| **Risk** â€” Bad migrations can corrupt data |

## Common Misuses

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- **Dropping columns**: Dropping columns loses data
- **Incompatible changes**: Changes that break existing code
- **Ignoring rollbacks**: Always provide rollback scripts

## Related Concepts

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [Expand-Contract](Data Databases/expand-contract.md) â€” Expand-contract is a migration strategy
- [Database Design](Data Databases/database-design.md) â€” Database design defines the schema
- [CI/CD](DevOps/ci-cd.md) â€” CI/CD pipelines run migrations

## Project Observations

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- The project uses schema migrations:
  - Knex provides migration tooling
  - PostgreSQL supports migrations
  - The project's architecture patterns note covers database concepts
  - No evidence of schema migrations in existing code (src/ is empty)
- File naming conventions support schema migrations:
  - `*.migration.ts` â€” Migration files
  - `*.schema.ts` â€” Schema files

## Sources

## concept_id
j15-schema-migrations

## title
Schema Migrations

## aliases
- J15-Schema-Migrations

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




