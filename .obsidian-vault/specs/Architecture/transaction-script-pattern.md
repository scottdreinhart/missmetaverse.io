---
slug: transaction-script-pattern
sources:
  - https://martinfowler.com/eaaDev/transactionScript.html
  - https://en.wikipedia.org/wiki/Transaction_script_pattern
date: 2026-11-02
tags:
  - transaction-script-pattern
  - enterprise-patterns
  - patterns
  - architecture
---

# Transaction Script Pattern

## Definition

Transaction Script Pattern is a **design pattern that organizes business logic into procedures where each transaction is a single unit of work**.

> "The Transaction Script pattern organizes business logic into procedures where each transaction is a single unit of work." — Martin Fowler

## Problem Addressed

Without transaction script pattern:
- **Complexity**: Business logic is complex
- **Duplication**: Business logic is duplicated
- **Testing**: Hard to test business logic
- **Maintenance**: Hard to maintain business logic

## Scope and Boundaries

- Transaction Script Pattern ≠ Service Layer (transaction script pattern is for transactions, service layer is for boundaries)
- Transaction Script Pattern ≠ Business Logic (transaction script pattern is a pattern, business logic is a concept)
- Transaction Script Pattern is a **design pattern**, not a business logic pattern

## When to Apply

- When building applications
- when transaction coordination matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Transaction script pattern is complex |
| **Time** — Transaction script pattern takes time |
| **Over-transaction-script** — Don't use transaction script for everything |

## Common Misuses

- **Everything transaction script**: Not everything needs transaction script pattern
- **Confusing with service layer**: Transaction script pattern ≠ service layer
- **Over-transaction-script**: Too many transaction scripts create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Transaction script pattern with DDD
- [Service Layer Pattern](Architecture/service-layer-pattern.md) — Transaction script pattern with service layer
- [Business Logic](Architecture/business-logic.md) — Transaction script pattern with business logic

## Project Observations

- The project uses transaction script pattern:
  - The project's architecture patterns note covers transaction script pattern (from existing notes)
  - No evidence of transaction script pattern in existing code (src/ is empty)
- File naming conventions support transaction script pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
