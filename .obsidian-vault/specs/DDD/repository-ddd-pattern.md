---
slug: repository-ddd-pattern
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Repository.html
date: 2026-11-02
tags:
  - ddd
  - repository
  - domain-modeling
  - data-access
---

# Repository (DDD)

## Definition

Repository (DDD) is **a mechanism for encapsulating storage, retrieval, and search behavior which emulates a collection of objects**.

> "A repository performs the tasks of an intermediary between the domain model and data mapping, acting similarly to a collection." — Martin Fowler

## Problem Addressed

Without repositories:
- **Data access leakage**: Domain code directly accesses data access mechanisms
- **Testing difficulty**: Hard to test domain logic without real database
- **Persistence ignorance**: Domain model depends on persistence details
- **Duplication**: Query logic duplicated across the codebase

## Scope and Boundaries

- Repository ≠ Data Mapper (repository provides collection-like interface, data mapper handles object-relational mapping)
- Repository = Collection (repository emulates a collection in memory)
- Repository is a **domain model building block**, not a pattern

## When to Apply

- When building domain models with complex queries
- when persistence ignorance is important
- when testing domain logic without a database is needed
- when query logic needs to be centralized

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Repositories add an abstraction layer |
| **Time** — Implementing repositories takes time |
| **Over-repository** — Simple CRUD may not need a repository |

## Common Misuses

- **Query objects as repositories**: Repositories should not become query objects
- **Domain logic in repositories**: Repositories should not contain domain logic
- **Confusing with data mapper**: Repository provides collection interface, data mapper handles mapping

## Related Concepts

- [Data Mapper](Architecture/data-mapper-pattern.md) — Data mapper handles object-relational mapping
- [Unit of Work](Architecture/unit-of-work-pattern.md) — Unit of work coordinates repositories
- [Aggregate Root](DDD/aggregate-root.md) — Repositories typically manage aggregate roots

## Project Observations

- The project uses repositories:
  - TypeScript interfaces can serve as repository abstractions
  - The project's architecture patterns note covers DDD concepts
  - No evidence of repositories in existing code (src/ is empty)
- File naming conventions support repositories:
  - `*.repository.ts` — Repository files
  - `*.port.ts` — Port files

## Sources

- [[Sources/evans-ddd-ddd-2003|evans-ddd-ddd-2003]]
- [[Sources/fowler-ddd-ddd-2003|fowler-ddd-ddd-2003]]
