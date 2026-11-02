---
slug: repository-pattern-ddd
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

# Repository Pattern (DDD)

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
- When testing matters
- When maintenance is important
- When flexibility is important

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
- [Data Mapper](Architecture/data-mapper.md) — Repository pattern with data mapper
- [Unit of Work](Architecture/unit-of-work.md) — Repository pattern with unit of work

## Project Observations

- The project uses repository pattern:
  - The project's architecture patterns note covers repository pattern (from existing notes)
  - No evidence of repository pattern in existing code (src/ is empty)
- File naming conventions support repository pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
