---
slug: unit-of-work-pattern-patterns
sources:
  - https://martinfowler.com/eaaDatasource.html
  - https://en.wikipedia.org/wiki/Unit_of_work
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - unit-of-work-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Unit of Work Pattern Patterns

## Definition

Unit of Work Pattern Patterns are **design patterns for working with unit of work architecture**.

> "The Unit of Work pattern maintains a list of objects affected by a business transaction and coordinates the writing out of changes." — Martin Fowler

## Problem Addressed

Without unit of work pattern patterns:
- **Complexity**: Transaction management is complex and hard to maintain
- **Consistency**: Changes can't be coordinated
- **Testing**: Hard to test transactions
- **Maintenance**: Hard to maintain transactions

## Scope and Boundaries

- Unit of Work Pattern Patterns ≠ Unit of Work Pattern (unit of work pattern patterns are patterns, unit of work pattern is an architectural pattern)
- Unit of Work Pattern Patterns = Data Mapper (unit of work pattern patterns are patterns, data mapper is an architectural pattern)
- Unit of Work Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when transactions matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Unit of work pattern patterns are complex |
| **Time** — Unit of work pattern patterns take time |
| **Over-unit-of-work-pattern** — Don't use unit of work pattern for everything |

## Common Misuses

- **Everything unit of work pattern**: Not everything needs unit of work pattern patterns
- **Confusing with data mapper**: Unit of work pattern patterns ≠ data mapper
- **Over-unit-of-work-pattern**: Too many unit of work patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Unit of work pattern patterns with DDD
- [Data Mapper Pattern](Architecture/data-mapper-pattern-patterns.md) — Unit of work pattern patterns with data mapper
- [Service Layer Pattern](Architecture/service-layer-pattern-patterns.md) — Unit of work pattern patterns with service layer

## Project Observations

- The project uses unit of work pattern patterns:
  - The project's architecture patterns note covers unit of work pattern patterns (from existing notes)
  - No evidence of unit of work pattern patterns in existing code (src/ is empty)
- File naming conventions support unit of work pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




