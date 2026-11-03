---
slug: database-migrations
tags:
  - core-concepts

  - database   - data   - backend
---

# Database Migrations

> **Purpose:** Manage schema changes with Database Migrations.
> **Last Updated:** 2026-11-03

## concept_id
`database-migrations`

## title
Database Migrations

## aliases
- Schema Migrations
- Database Migration
- Migration Scripts
- Version Control for Database

## category
data-databases

## concept_type
database-concept

## research_status
verified

## project_adoption
declared

## applicability
- Schema versioning
- Deployment automation
- Environment synchronization
- Rollback support

## tags
- type/concept
- domain/database
- status/verified
- priority/high

## source_ids
- database-design-hoffer
- martinfowler-patterns

## related_concept_ids
- database-migrations
- schema-versioning
- migration-strategy
- database-deployment

## Definition

Database Migrations are version-controlled scripts that manage incremental, reversible changes to database schemas, enabling consistent deployments across environments.

## Problem Addressed

Without Migrations:
- Schema changes are manual
- Environments are inconsistent
- Rollbacks are difficult
- Deployment is error-prone

## Scope of Boundaries

Migrations apply to:
- Schema versioning
- Deployment automation
- Environment synchronization
- Rollback support

Migrations do not apply to:
- Data modeling
- Query optimization
- Connection management
- Security

## When to Apply

- Needing schema versioning
- Wanting deployment automation
- Synchronizing environments
- Supporting rollbacks

## Tradeoffs and When to Avoid

- **Complexity**: Migrations add complexity
- **Not for simple apps**: Simple apps don't need migrations
- **Not for static schemas**: Static schemas don't need migrations
- **Not for manual deployment**: Manual deployment doesn't need migrations

## Implementation Guidance

1. **Choose tool**: Choose migration tool
2. **Create initial migration**: Create initial schema migration
3. **Version migrations**: Version migration scripts
4. **Apply migrations**: Apply migrations on deployment
5. **Test rollbacks**: Test rollback procedures

## Verification

- [ ] Migration tool chosen
- [ ] Initial migration created
- [ ] Migrations versioned
- [ ] Migrations applied
- [ ] Rollbacks tested

## Common Misuses

- **Not versioning**: Not versioning migrations
- **Not testing rollbacks**: Not testing rollback procedures
- **Breaking changes**: Making breaking changes in migrations
- **Not documenting**: Not documenting migration changes

## Related Concepts

- [[Data Databases/database-migrations]] â€” Database Migrations
- [[Data Databases/database-migrations]] â€” Schema Versioning
- [[Data Databases/database-migrations]] â€” Migration Strategy
- [[Data Databases/database-migrations]] â€” Database Deployment

## Project Observations

The project uses Database Migrations through:
- Version-controlled migration scripts
- Incremental schema changes
- Deployment automation
- Rollback support

## Sources

- [[Sources/S030-database-design-hoffer|Database Design â€” Hoffer]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Database Migrations Note**
