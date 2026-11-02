---
slug: repository-pattern
sources:
  - https://martinfowler.com/eaaDev/repository.html
  - https://en.wikipedia.org/wiki/Repository_pattern
date: 2026-11-02
tags:
  - repository-pattern
  - ddd
  - data-access
  - patterns
---

# Repository Pattern

## Definition

Repository Pattern is a **design pattern that provides an abstraction over data access, mediating between domain and data mapping layers**.

> "A Repository mediates between the domain and data mapping layers, acting like an in-memory collection of domain objects." — Martin Fowler

## Problem Addressed

Without repository pattern:
- **Coupling**: Domain is coupled to data access
- **Testing**: Hard to test domain logic
- **Maintenance**: Hard to maintain data access code
- **Flexibility**: Hard to change data access

## Scope and Boundaries

- Repository Pattern ≠ Data Mapper (repository pattern is an abstraction, data mapper is a specific pattern)
- Repository Pattern ≠ Unit of Work (repository pattern is for data access, unit of work is for transactions)
- Repository Pattern is a **design pattern**, not a data access pattern

## When to Apply

- When building applications
- when testing matters
- when maintenance is important
- when flexibility is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Repository pattern is complex |
| **Time** — Repository pattern takes time |
| **Over-repository** — Don't use repository for everything |

## Common Misuses

- **Everything repository**: Not everything needs repository pattern
- **Confusing with data mapper**: Repository pattern ≠ data mapper
- **Over-repository**: Too many repositories create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Repository pattern with DDD
- [Data Mapper](Architecture/data-mapper-pattern.md) — Repository pattern with data mapper
- [Unit of Work](Architecture/unit-of-work-pattern.md) — Repository pattern with unit of work

## Project Observations

- The project uses repository pattern:
  - The project's architecture patterns note covers repository pattern (from existing notes)
  - No evidence of repository pattern in existing code (src/ is empty)
- File naming conventions support repository pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

