---
slug: active-record-pattern-patterns
sources:
  - https://martinfowler.com/eaaDatasource.html
  - https://en.wikipedia.org/wiki/Active_record_pattern
date: 2026-11-02
tags:
  - active-record-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Active Record Pattern Patterns

## Definition

Active Record Pattern Patterns are **design patterns for working with active record architecture**.

> "The Active Record pattern organizes domain logic into the domain objects themselves, combining data and behavior." — Martin Fowler

## Problem Addressed

Without active record pattern patterns:
- **Complexity**: Domain logic is complex and hard to maintain
- **Coupling**: Data is coupled to behavior
- **Testing**: Hard to test domain logic
- **Maintenance**: Hard to maintain domain logic

## Scope and Boundaries

- Active Record Pattern Patterns ≠ Active Record Pattern (active record pattern patterns are patterns, active record pattern is an architectural pattern)
- Active Record Pattern Patterns = Transaction Script (active record pattern patterns are patterns, transaction script is an architectural pattern)
- Active Record Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when domain logic matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Active record pattern patterns are complex |
| **Time** — Active record pattern patterns take time |
| **Over-active-record-pattern** — Don't use active record pattern for everything |

## Common Misuses

- **Everything active record pattern**: Not everything needs active record pattern patterns
- **Confusing with transaction script**: Active record pattern patterns ≠ transaction script
- **Over-active-record-pattern**: Too many active records create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Active record pattern patterns with DDD
- [Transaction Script Pattern](Architecture/transaction-script-pattern-patterns.md) — Active record pattern patterns with transaction script
- [Identity Map Pattern](Architecture/identity-map-pattern-patterns.md) — Active record pattern patterns with identity map

## Project Observations

- The project uses active record pattern patterns:
  - The project's architecture patterns note covers active record pattern patterns (from existing notes)
  - No evidence of active record pattern patterns in existing code (src/ is empty)
- File naming conventions support active record pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
