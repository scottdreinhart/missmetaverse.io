---
slug: microservices-pattern-patterns
sources:
  - https://martinfowler.com/articles/microservices.html
  - https://en.wikipedia.org/wiki/Microservices
date: 2026-11-02
tags:
  - microservices-pattern
  - distributed-systems-patterns
  - patterns
  - design-patterns
---

# Microservices Pattern Patterns

## Definition

Microservices Pattern Patterns are **design patterns for working with microservices architecture**.

> "Microservices is an architecture style that structures an application as a collection of loosely coupled services." — Martin Fowler

## Problem Addressed

Without microservices pattern patterns:
- **Complexity**: Monoliths are complex and hard to maintain
- **Scalability**: Hard to scale monoliths
- **Testing**: Hard to test monoliths
- **Maintenance**: Hard to maintain monoliths

## Scope and Boundaries

- Microservices Pattern Patterns ≠ Microservices (microservices pattern patterns are patterns, microservices is a distributed systems pattern)
- Microservices Pattern Patterns = Active Record (microservices pattern patterns are patterns, active record is an architectural pattern)
- Microservices Pattern Patterns is a **patterns**, not a distributed systems pattern

## When to Apply

- When building applications
- when scalability matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Microservices pattern patterns are complex |
| **Time** — Microservices pattern patterns take time |
| **Over-microservices** — Don't use microservices for everything |

## Common Misuses

- **Everything microservices**: Not everything needs microservices pattern patterns
- **Confusing with active record**: Microservices pattern patterns ≠ active record
- **Over-microservices**: Too many microservices create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Microservices pattern patterns with DDD
- [Active Record Pattern](Architecture/active-record-pattern-patterns.md) — Microservices pattern patterns with active record
- [Transaction Script Pattern](Architecture/transaction-script-pattern-patterns.md) — Microservices pattern patterns with transaction script

## Project Observations

- The project uses microservices pattern patterns:
  - The project's architecture patterns note covers microservices pattern patterns (from existing notes)
  - No evidence of microservices pattern patterns in existing code (src/ is empty)
- File naming conventions support microservices pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
