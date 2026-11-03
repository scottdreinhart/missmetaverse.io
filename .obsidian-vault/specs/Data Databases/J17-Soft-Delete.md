---
slug: soft-delete
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - database
  - soft-delete
  - data-modeling
  - retention
# Soft Delete

## Definition

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Soft Delete is **a technique where deleting a record marks it as deleted without actually removing it from the database**.

> "Soft delete is a method of marking a record as deleted without actually removing it from the database." â€” Wikipedia

## Problem Addressed

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Without soft delete:
- **Data loss**: Hard to recover deleted data
- **Referential integrity**: Foreign key constraints break
- **Audit trail**: Can't track deleted records
- **Compliance**: Some regulations require keeping deleted data

## Scope and Boundaries

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- Soft Delete â‰  Hard Delete (soft delete marks as deleted, hard delete removes the record)
- Soft Delete = Recovery (soft delete allows recovery of deleted records)
- Soft Delete is a **data modeling technique**, not a pattern

## When to Apply

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- When data recovery is important
- when audit trails are required
- when referential integrity must be maintained
- when compliance requires keeping deleted data

## Tradeoffs and When to Avoid

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

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
| **Storage** â€” Deleted records still consume storage |
| **Query complexity** â€” Queries must filter out deleted records |
| **Index overhead** â€” Indexes include deleted records |

## Common Misuses

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- **Everything soft deleted**: Not every record needs soft delete
- **Ignoring cleanup**: Deleted records should be cleaned up periodically
- **Confusing with retention**: Soft delete is for recovery, retention is for compliance

## Related Concepts

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- [Retention Policies](Data Databases/retention-policies.md) â€” Retention policies manage soft-deleted records
- [Audit Trails](Data Databases/audit-trails.md) â€” Audit trails track soft-deleted records
- [Database Constraints](Data Databases/db-constraints.md) â€” Database constraints must account for soft deletes

## Project Observations

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
- The project uses soft delete:
  - PostgreSQL supports soft delete
  - MySQL supports soft delete
  - The project's architecture patterns note covers database concepts
  - No evidence of soft delete in existing code (src/ is empty)
- File naming conventions support soft delete:
  - `*.entity.ts` â€” Entity files
  - `*.repository.ts` â€” Repository files

## Sources

## concept_id
j17-soft-delete

## title
Soft Delete

## aliases
- J17-Soft-Delete

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




