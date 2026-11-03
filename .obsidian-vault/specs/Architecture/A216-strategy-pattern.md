---
slug: strategy-pattern
sources:
  - https://en.wikipedia.org/wiki/Strategy_pattern
  - https://martinfowler.com/eaaDev/strategyObject.html
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
  - strategy-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Strategy Pattern

## Definition

Strategy Pattern is a **behavioral design pattern that defines a family of algorithms, encapsulates each one, and makes them interchangeable**.

> "The Strategy pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable." — GoF

## Problem Addressed

Without strategy pattern:
- **Complexity**: Algorithms are complex
- **Inflexibility**: Can't interchange algorithms
- **Testing**: Hard to test algorithms
- **Maintenance**: Hard to maintain algorithms

## Scope and Boundaries

- Strategy Pattern ≠ State (strategy pattern is for algorithms, state pattern is for states)
- Strategy Pattern ≠ Command (strategy pattern is for algorithms, command pattern is for actions)
- Strategy Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When algorithm interchange matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Strategy pattern is complex |
| **Time** — Strategy pattern takes time |
| **Over-strategy** — Don't use strategy for everything |

## Common Misuses

- **Everything strategy**: Not everything needs strategy pattern
- **Confusing with state**: Strategy pattern ≠ state
- **Over-strategy**: Too many strategies create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Strategy pattern with DDD
- [State Pattern](Architecture/state-pattern.md) — Strategy pattern with state
- [Command Pattern](Architecture/command-pattern.md) — Strategy pattern with command

## Project Observations

- The project uses strategy pattern:
  - The project's architecture patterns note covers strategy pattern (from existing notes)
  - No evidence of strategy pattern in existing code (src/ is empty)
- File naming conventions support strategy pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




