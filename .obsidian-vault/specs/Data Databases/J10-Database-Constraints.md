---
slug: db-constraints
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/optimization
  - status/complete
  - type/reference
  - domain/database
  - database
  - constraints
  - data-modeling
  - integrity
---

# Database Constraints

## Definition

Database Constraints are **rules enforced by the database to ensure data validity and integrity at the schema level**.

> "A constraint is a property assigned to a column or column set that is used to specify rules governing the values allowed in the column." — Microsoft

## Problem Addressed

Without constraints:
- **Invalid data**: Invalid data can enter the database
- **No enforcement**: Data validity is not enforced at the database level
- **Duplication**: Duplicate data can be inserted
- **Null issues**: Null values can cause problems

## Scope and Boundaries

- Constraints ≠ Application Validation (constraints are at the database level, validation is at the application level)
- Constraints = Integrity (constraints ensure data integrity)
- Constraints are a **database feature**, not a pattern

## When to Apply

- When designing relational databases
- when data validity is critical
- when database-level enforcement is needed
- when application validation is not sufficient

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — More constraints to manage |
| **Performance** — Constraints add overhead |
| **Rigidity** — Harder to make changes |

## Common Misuses

- **Every rule a constraint**: Not every rule needs to be a constraint
- **Ignoring application validation**: Constraints should complement, not replace, application validation
- **Confusing with indexes**: Constraints enforce rules, indexes improve performance

## Related Concepts

- [Referential Integrity](Data Databases/referential-integrity.md) — Referential integrity is a type of constraint
- [Database Design](Data Databases/database-design.md) — Database design includes constraints
- [Input Validation](Security/input-validation.md) — Input validation complements database constraints

## Project Observations

- The project uses constraints:
  - PostgreSQL supports constraints
  - MySQL supports constraints
  - The project's architecture patterns note covers database concepts
  - No evidence of constraints in existing code (src/ is empty)
- File naming conventions support constraints:
  - `*.schema.ts` — Schema files
  - `*.migration.ts` — Migration files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]




