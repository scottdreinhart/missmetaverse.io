---
slug: active-record-pattern
sources:
  - https://martinfowler.com/eaaDev/activeRecord.html
  - https://en.wikipedia.org/wiki/Active_record_pattern
date: 2026-11-02
tags:
  - active-record-pattern
  - enterprise-patterns
  - patterns
  - architecture
---

# Active Record Pattern

## Definition

Active Record Pattern is a **design pattern that encapsulates database access and business logic in a single object**.

> "The Active Record pattern encapsulates database access and business logic in a single object." — Martin Fowler

## Problem Addressed

Without active record pattern:
- **Complexity**: Database access is complex
- **Coupling**: Database access is coupled to business logic
- **Testing**: Hard to test database access
- **Maintenance**: Hard to maintain database access

## Scope and Boundaries

- Active Record Pattern ≠ ORM (active record pattern is a pattern, ORM is a tool)
- Active Record Pattern ≠ Data Mapper (active record pattern combines database access and business logic, data mapper separates them)
- Active Record Pattern is a **design pattern**, not a database pattern

## When to Apply

- When building applications
- when database access matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Active record pattern is complex |
| **Time** — Active record pattern takes time |
| **Over-active-record** — Don't use active record for everything |

## Common Misuses

- **Everything active record**: Not everything needs active record pattern
- **Confusing with ORM**: Active record pattern ≠ ORM
- **Over-active-record**: Too many active records create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Active record pattern with DDD
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — Active record pattern with data mapper
- [Repository Pattern](Architecture/repository-pattern-ddd.md) — Active record pattern with repository

## Project Observations

- The project uses active record pattern:
  - The project's architecture patterns note covers active record pattern (from existing notes)
  - No evidence of active record pattern in existing code (src/ is empty)
- File naming conventions support active record pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
