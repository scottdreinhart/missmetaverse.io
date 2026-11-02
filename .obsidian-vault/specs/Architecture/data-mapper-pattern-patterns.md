---
slug: data-mapper-pattern-patterns
sources:
  - https://martinfowler.com/eaaDatasource.html
  - https://en.wikipedia.org/wiki/Data_mapper_pattern
date: 2026-11-02
tags:
  - data-mapper-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Data Mapper Pattern Patterns

## Definition

Data Mapper Pattern Patterns are **design patterns for working with data mapper architecture**.

> "The Data Mapper is a layer of software that separates the in-memory domain from the database." — Martin Fowler

## Problem Addressed

Without data mapper pattern patterns:
- **Complexity**: Data access is complex and hard to maintain
- **Coupling**: Domain is coupled to database
- **Testing**: Hard to test data access
- **Maintenance**: Hard to maintain data access

## Scope and Boundaries

- Data Mapper Pattern Patterns ≠ Data Mapper Pattern (data mapper pattern patterns are patterns, data mapper pattern is an architectural pattern)
- Data Mapper Pattern Patterns = Service Layer (data mapper pattern patterns are patterns, service layer is an architectural pattern)
- Data Mapper Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when data access matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Data mapper pattern patterns are complex |
| **Time** — Data mapper pattern patterns take time |
| **Over-data-mapper-pattern** — Don't use data mapper pattern for everything |

## Common Misuses

- **Everything data mapper pattern**: Not everything needs data mapper pattern patterns
- **Confusing with service layer**: Data mapper pattern patterns ≠ service layer
- **Over-data-mapper-pattern**: Too many data mappers create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Data mapper pattern patterns with DDD
- [Service Layer Pattern](Architecture/service-layer-pattern-patterns.md) — Data mapper pattern patterns with service layer
- [Lazy Loading Pattern](Architecture/lazy-loading-pattern-patterns.md) — Data mapper pattern patterns with lazy loading

## Project Observations

- The project uses data mapper pattern patterns:
  - The project's architecture patterns note covers data mapper pattern patterns (from existing notes)
  - No evidence of data mapper pattern patterns in existing code (src/ is empty)
- File naming conventions support data mapper pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
