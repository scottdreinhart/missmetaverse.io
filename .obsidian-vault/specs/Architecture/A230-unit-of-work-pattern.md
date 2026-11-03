---
slug: unit-of-work-pattern
sources:
  - https://martinfowler.com/eaaDev/unitOfWork.html
  - https://en.wikipedia.org/wiki/Unit_of_work_pattern
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - domain/database
  - status/complete
  - type/reference
  - domain/architecture
  - unit-of-work-pattern
  - enterprise-patterns
  - patterns
  - architecture
---

# Unit of Work Pattern

## Definition

Unit of Work Pattern is a **design pattern that maintains a list of objects affected by a business transaction and coordinates the writing out of changes**.

> "The Unit of Work pattern maintains a list of objects affected by a business transaction and coordinates the writing out of changes." — Martin Fowler

## Problem Addressed

Without unit of work pattern:
- **Inconsistency**: Changes are inconsistent
- **Coupling**: Changes are coupled to database
- **Testing**: Hard to test changes
- **Maintenance**: Hard to maintain changes

## Scope and Boundaries

- Unit of Work Pattern ≠ Transaction (unit of work pattern is for tracking changes, transaction is for database operations)
- Unit of Work Pattern ≠ Repository (unit of work pattern is for tracking, repository is for data access)
- Unit of Work Pattern is a **design pattern**, not a database pattern

## When to Apply

- When building applications
- when transaction coordination matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Unit of work pattern is complex |
| **Time** — Unit of work pattern takes time |
| **Over-unit-of-work** — Don't use unit of work for everything |

## Common Misuses

- **Everything unit of work**: Not everything needs unit of work pattern
- **Confusing with transaction**: Unit of work pattern ≠ transaction
- **Over-unit-of-work**: Too many unit of works create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Unit of work pattern with DDD
- [Repository Pattern](Architecture/repository-pattern-ddd.md) — Unit of work pattern with repository
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — Unit of work pattern with data mapper

## Project Observations

- The project uses unit of work pattern:
  - The project's architecture patterns note covers unit of work pattern (from existing notes)
  - No evidence of unit of work pattern in existing code (src/ is empty)
- File naming conventions support unit of work pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




