---
slug: strategy-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Strategy_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - strategy-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Strategy Pattern Patterns

## Definition

Strategy Pattern Patterns are **design patterns for working with strategy architecture**.

> "The Strategy pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable." — GoF

## Problem Addressed

Without strategy pattern patterns:
- **Complexity**: Algorithms are complex and hard to change
- **Duplication**: Algorithms are duplicated across code
- **Testing**: Hard to test algorithms
- **Maintenance**: Hard to maintain algorithms

## Scope and Boundaries

- Strategy Pattern Patterns ≠ Strategy Pattern (strategy pattern patterns are patterns, strategy pattern is a behavioral pattern)
- Strategy Pattern Patterns ≠ State (strategy pattern patterns are patterns, state is a behavioral pattern)
- Strategy Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when algorithms matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Strategy pattern patterns are complex |
| **Time** — Strategy pattern patterns take time |
| **Over-strategy-pattern** — Don't use strategy pattern for everything |

## Common Misuses

- **Everything strategy pattern**: Not everything needs strategy pattern patterns
- **Confusing with state**: Strategy pattern patterns ≠ state
- **Over-strategy-pattern**: Too many strategy patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Strategy pattern patterns with DDD
- [State Pattern](Architecture/state-pattern.md) — Strategy pattern patterns with state
- [Template Method Pattern](Architecture/template-method-pattern.md) — Strategy pattern patterns with template method

## Project Observations

- The project uses strategy pattern patterns:
  - The project's architecture patterns note covers strategy pattern patterns (from existing notes)
  - No evidence of strategy pattern patterns in existing code (src/ is empty)
- File naming conventions support strategy pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
