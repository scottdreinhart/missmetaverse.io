---
slug: single-source-of-truth
tags:
  - core-concepts

  - data-driven   - declarative   - architecture
---

# Single Source of Truth

> **Purpose:** Ensure data exists in only one place.
> **Last Updated:** 2026-11-03

## concept_id
`data-driven-single-source`

## title
Single Source of Truth

## aliases
- SSOT
- Single Source of Truth
- Source of Truth
- Golden Record

## category
data-driven-approaches

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- State management
- Data architecture
- Database design
- Application architecture

## tags
- type/principle
- domain/architecture
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- data-driven-design
- data-driven-configuration-driven
- data-driven-schema-driven
- arch-dry
- arch-high-cohesion

## Definition

Single Source of Truth is a principle where each piece of data has exactly one authoritative source. This prevents inconsistency and ensures data integrity.

## Problem Addressed

Without single source of truth:
- Data is duplicated
- Inconsistencies arise
- Updates are error-prone
- Trust in data is lost

## Scope and Boundaries

Single source of truth applies to:
- State management
- Data architecture
- Database design
- Application architecture

Single source of truth does not apply to:
- Caches (derived data)
- Projections (derived data)
- Backups (copies)
- Archives (historical data)

## When to Apply

- Designing state management
- Building data architecture
- Designing databases
- Building applications

## Tradeoffs and When to Avoid

- **Performance**: Single source can be a bottleneck
- **Not for caches**: Caches are derived data
- **Not for projections**: Projections are derived data
- **Not for backups**: Backups are copies

## Implementation Guidance

1. **Identify data**: Identify all data in system
2. **Define source**: Define authoritative source for each data
3. **Enforce**: Enforce single source through architecture
4. **Derive others**: Derive other data from source
5. **Monitor**: Monitor for violations

## Verification

- [ ] Data sources are identified
- [ ] Authoritative source is defined
- [ ] Single source is enforced
- [ ] Other data is derived
- [ ] Violations are monitored

## Common Misuses

- **Duplicating data**: Duplicating data without deriving
- **Not enforcing**: Not enforcing single source
- **Not deriving**: Not deriving other data
- **Not monitoring**: Not monitoring for violations

## Related Concepts

- [[Data-Driven Approaches/data-driven-design]] â€” Data-Driven Design
- [[Data-Driven Approaches/configuration-driven-development]] â€” Configuration-Driven Development
- [[Data-Driven Approaches/schema-driven-development]] â€” Schema-Driven Development
- [[Architecture/dry]] â€” DRY Principle

## Project Observations

The project follows single source of truth through:
- Centralized state management (Jotai)
- Single database
- Derived data from source
- Clear data ownership

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Single Source of Truth Note**
