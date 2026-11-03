---
slug: referential-integrity
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - database
  - referential-integrity
  - data-modeling
  - constraints
# Referential Integrity

## Definition

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Referential Integrity is **a database constraint that ensures relationships between tables remain consistent â€” foreign keys must reference existing primary keys**.

> "Referential integrity is a concept in relational databases that ensures that foreign key values in a table exist in the referenced primary key or unique key in another table." â€” Wikipedia

## Problem Addressed

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Without referential integrity:
- **Orphaned records**: Records reference non-existent parents
- **Data corruption**: Relationships are broken
- **Inconsistent data**: Data is inconsistent across tables
- **Query errors**: Queries fail or return incorrect results

## Scope and Boundaries

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- Referential Integrity â‰  Primary Key (referential integrity is about relationships, primary key is about uniqueness)
- Referential Integrity = Relationships (referential integrity ensures relationships are valid)
- Referential Integrity is a **database constraint**, not a pattern

## When to Apply

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- When designing relational databases
- when table relationships are important
- when data consistency is critical
- when foreign keys are used

## Tradeoffs and When to Avoid

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

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
| **Performance** â€” Referential integrity adds overhead |
| **Complexity** â€” More constraints to manage |
| **Rigidity** â€” Harder to make changes |

## Common Misuses

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- **Every relationship enforced**: Not every relationship needs referential integrity
- **Ignoring soft deletes**: Soft deletes can break referential integrity
- **Confusing with normalization**: Referential integrity is about relationships, normalization is about structure

## Related Concepts

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [Database Constraints](Data Databases/db-constraints.md) â€” Referential integrity is a type of constraint
- [Normalization](Data Databases/normalization.md) â€” Normalization relies on referential integrity
- [Database Design](Data Databases/database-design.md) â€” Database design includes referential integrity

## Project Observations

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- The project uses referential integrity:
  - PostgreSQL supports referential integrity
  - MySQL supports referential integrity
  - The project's architecture patterns note covers database concepts
  - No evidence of referential integrity in existing code (src/ is empty)
- File naming conventions support referential integrity:
  - `*.schema.ts` â€” Schema files
  - `*.migration.ts` â€” Migration files

## Sources

## concept_id
j09-referential-integrity

## title
Referential Integrity

## aliases
- J09-Referential-Integrity

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




