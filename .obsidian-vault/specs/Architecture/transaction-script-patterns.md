---
slug: transaction-script-pattern-patterns
sources:
  - https://martinfowler.com/eaaDatasource.html
  - https://en.wikipedia.org/wiki/Transaction_script_pattern
date: 2026-11-02
tags:
  - transaction-script-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Transaction Script Pattern Patterns

## Definition

Transaction Script Pattern Patterns are **design patterns for working with transaction script architecture**.

> "The Transaction Script pattern organizes application business logic into procedures where each transaction is a single task." — Martin Fowler

## Problem Addressed

Without transaction script pattern patterns:
- **Complexity**: Business logic is complex and hard to maintain
- **Duplication**: Logic is duplicated across transactions
- **Testing**: Hard to test transactions
- **Maintenance**: Hard to maintain transactions

## Scope and Boundaries

- Transaction Script Pattern Patterns ≠ Transaction Script Pattern (transaction script pattern patterns are patterns, transaction script pattern is an architectural pattern)
- Transaction Script Pattern Patterns = Identity Map (transaction script pattern patterns are patterns, identity map is an architectural pattern)
- Transaction Script Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when transactions matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Transaction script pattern patterns are complex |
| **Time** — Transaction script pattern patterns take time |
| **Over-transaction-script-pattern** — Don't use transaction script pattern for everything |

## Common Misuses

- **Everything transaction script pattern**: Not everything needs transaction script pattern patterns
- **Confusing with identity map**: Transaction script pattern patterns ≠ identity map
- **Over-transaction-script-pattern**: Too many transaction scripts create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Transaction script pattern patterns with DDD
- [Identity Map Pattern](Architecture/identity-map-pattern-patterns.md) — Transaction script pattern patterns with identity map
- [Unit of Work Pattern](Architecture/unit-of-work-pattern-patterns.md) — Transaction script pattern patterns with unit of work

## Project Observations

- The project uses transaction script pattern patterns:
  - The project's architecture patterns note covers transaction script pattern patterns (from existing notes)
  - No evidence of transaction script pattern patterns in existing code (src/ is empty)
- File naming conventions support transaction script pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

