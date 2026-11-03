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
  - --
# Transaction Script Pattern

## Definition

Transaction Script Pattern is a **design pattern that organizes business logic into procedures where each transaction is a single unit of work**.

> "The Transaction Script pattern organizes business logic into procedures where each transaction is a single unit of work." â€” Martin Fowler

## Problem Addressed

Without transaction script pattern:
- **Complexity**: Business logic is complex
- **Duplication**: Business logic is duplicated
- **Testing**: Hard to test business logic
- **Maintenance**: Hard to maintain business logic

## Scope and Boundaries

- Transaction Script Pattern â‰  Service Layer (transaction script pattern is for transactions, service layer is for boundaries)
- Transaction Script Pattern â‰  Business Logic (transaction script pattern is a pattern, business logic is a concept)
- Transaction Script Pattern is a **design pattern**, not a business logic pattern

## When to Apply

- When building applications
- when transaction coordination matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Transaction script pattern is complex |
| **Time** â€” Transaction script pattern takes time |
| **Over-transaction-script** â€” Don't use transaction script for everything |

## Common Misuses

- **Everything transaction script**: Not everything needs transaction script pattern
- **Confusing with service layer**: Transaction script pattern â‰  service layer
- **Over-transaction-script**: Too many transaction scripts create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) â€” Transaction script pattern with DDD
- [Service Layer Pattern](Architecture/service-layer-pattern.md) â€” Transaction script pattern with service layer
- [Business Logic](Architecture/business-logic.md) â€” Transaction script pattern with business logic

## Project Observations

- The project uses transaction script pattern:
  - The project's architecture patterns note covers transaction script pattern (from existing notes)
  - No evidence of transaction script pattern in existing code (src/ is empty)
- File naming conventions support transaction script pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




