---
slug: db-constraints
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - database
  - constraints
  - data-modeling
  - integrity
# Database Constraints

## Definition

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Database Constraints are **rules enforced by the database to ensure data validity and integrity at the schema level**.

> "A constraint is a property assigned to a column or column set that is used to specify rules governing the values allowed in the column." â€” Microsoft

## Problem Addressed

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Without constraints:
- **Invalid data**: Invalid data can enter the database
- **No enforcement**: Data validity is not enforced at the database level
- **Duplication**: Duplicate data can be inserted
- **Null issues**: Null values can cause problems

## Scope and Boundaries

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- Constraints â‰  Application Validation (constraints are at the database level, validation is at the application level)
- Constraints = Integrity (constraints ensure data integrity)
- Constraints are a **database feature**, not a pattern

## When to Apply

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- When designing relational databases
- when data validity is critical
- when database-level enforcement is needed
- when application validation is not sufficient

## Tradeoffs and When to Avoid

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

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
| **Complexity** â€” More constraints to manage |
| **Performance** â€” Constraints add overhead |
| **Rigidity** â€” Harder to make changes |

## Common Misuses

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- **Every rule a constraint**: Not every rule needs to be a constraint
- **Ignoring application validation**: Constraints should complement, not replace, application validation
- **Confusing with indexes**: Constraints enforce rules, indexes improve performance

## Related Concepts

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [Referential Integrity](Data Databases/referential-integrity.md) â€” Referential integrity is a type of constraint
- [Database Design](Data Databases/database-design.md) â€” Database design includes constraints
- [Input Validation](Security/input-validation.md) â€” Input validation complements database constraints

## Project Observations

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- The project uses constraints:
  - PostgreSQL supports constraints
  - MySQL supports constraints
  - The project's architecture patterns note covers database concepts
  - No evidence of constraints in existing code (src/ is empty)
- File naming conventions support constraints:
  - `*.schema.ts` â€” Schema files
  - `*.migration.ts` â€” Migration files

## Sources

## concept_id
j10-database-constraints

## title
Database Constraints

## aliases
- J10-Database-Constraints

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




