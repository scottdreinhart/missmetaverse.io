---
slug: data-mapper-pattern
sources:
  - https://martinfowler.com/eaaDev/dataMapper.html
  - https://en.wikipedia.org/wiki/Data_mapper_pattern
date: 2026-11-02
tags:
  - data-mapper-pattern
  - enterprise-patterns
  - patterns
  - architecture
---

# Data Mapper Pattern

## Definition

Data Mapper Pattern is a **design pattern that separates in-memory objects from databases by mapping data between them**.

> "The Data Mapper pattern separates in-memory objects from databases by mapping data between them, using a memory-area dataset for mediation." — Martin Fowler

## Problem Addressed

Without data mapper pattern:
- **Coupling**: Objects are coupled to databases
- **Testing**: Hard to test objects
- **Maintenance**: Hard to maintain objects
- **Flexibility**: Hard to change databases

## Scope and Boundaries

- Data Mapper Pattern ≠ ORM (data mapper pattern is a pattern, ORM is a tool)
- Data Mapper Pattern ≠ Repository (data mapper pattern is for mapping, repository is for data access)
- Data Mapper Pattern is a **design pattern**, not a data access pattern

## When to Apply

- When building applications
- when database separation matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Data mapper pattern is complex |
| **Time** — Data mapper pattern takes time |
| **Over-data-mapper** — Don't use data mapper for everything |

## Common Misuses

- **Everything data mapper**: Not everything needs data mapper pattern
- **Confusing with ORM**: Data mapper pattern ≠ ORM
- **Over-data-mapper**: Too many data mappers create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Data mapper pattern with DDD
- [Repository Pattern](Architecture/repository-pattern-ddd.md) — Data mapper pattern with repository
- [ORM](Architecture/orm.md) — Data mapper pattern with ORM

## Project Observations

- The project uses data mapper pattern:
  - The project's architecture patterns note covers data mapper pattern (from existing notes)
  - No evidence of data mapper pattern in existing code (src/ is empty)
- File naming conventions support data mapper pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

