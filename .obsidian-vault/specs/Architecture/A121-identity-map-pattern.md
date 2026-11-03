---
slug: identity-map-pattern
sources:
  - https://martinfowler.com/eaaDev/identityMap.html
  - https://en.wikipedia.org/wiki/Identity_map_pattern
date: 2026-11-02
tags:









  - identity-map-pattern
  - enterprise-patterns
  - patterns
  - architecture
---

# Identity Map Pattern

## Definition

Identity Map Pattern is a **design pattern that maintains a list of objects in memory and ensures that each object is loaded only once**.

> "The Identity Map pattern maintains a list of objects in memory and ensures that each object is loaded only once." — Martin Fowler

## Problem Addressed

Without identity map pattern:
- **Duplication**: Objects are loaded multiple times
- **Inconsistency**: Objects are inconsistent
- **Testing**: Hard to test objects
- **Maintenance**: Hard to maintain objects

## Scope and Boundaries

- Identity Map Pattern ≠ Cache (identity map pattern is for objects, cache is for data)
- Identity Map Pattern ≠ Repository (identity map pattern is for objects, repository is for data access)
- Identity Map Pattern is a **design pattern**, not a data access pattern

## When to Apply

- When building applications
- when object deduplication matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Identity map pattern is complex |
| **Time** — Identity map pattern takes time |
| **Over-identity-map** — Don't use identity map for everything |

## Common Misuses

- **Everything identity map**: Not everything needs identity map pattern
- **Confusing with cache**: Identity map pattern ≠ cache
- **Over-identity-map**: Too many identity maps create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Identity map pattern with DDD
- [Repository Pattern](Architecture/repository-pattern-ddd.md) — Identity map pattern with repository
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) — Identity map pattern with data mapper

## Project Observations

- The project uses identity map pattern:
  - The project's architecture patterns note covers identity map pattern (from existing notes)
  - No evidence of identity map pattern in existing code (src/ is empty)
- File naming conventions support identity map pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




