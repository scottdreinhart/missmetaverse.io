---
slug: state-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/State_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - state-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# State Pattern Patterns

## Definition

State Pattern Patterns are **design patterns for working with state architecture**.

> "The State pattern allows an object to alter its behavior when its internal state changes, appearing to change its class." — GoF

## Problem Addressed

Without state pattern patterns:
- **Complexity**: State logic is complex and hard to maintain
- **Coupling**: State is coupled to behavior
- **Testing**: Hard to test state transitions
- **Maintenance**: Hard to maintain state transitions

## Scope and Boundaries

- State Pattern Patterns ≠ State Pattern (state pattern patterns are patterns, state pattern is a behavioral pattern)
- State Pattern Patterns ≠ Strategy (state pattern patterns are patterns, strategy is a behavioral pattern)
- State Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when state matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — State pattern patterns are complex |
| **Time** — State pattern patterns take time |
| **Over-state-pattern** — Don't use state pattern for everything |

## Common Misuses

- **Everything state pattern**: Not everything needs state pattern patterns
- **Confusing with strategy**: State pattern patterns ≠ strategy
- **Over-state-pattern**: Too many state patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — State pattern patterns with DDD
- [Strategy Pattern](Architecture/strategy-pattern-patterns.md) — State pattern patterns with strategy
- [Template Method Pattern](Architecture/template-method-pattern.md) — State pattern patterns with template method

## Project Observations

- The project uses state pattern patterns:
  - The project's architecture patterns note covers state pattern patterns (from existing notes)
  - No evidence of state pattern patterns in existing code (src/ is empty)
- File naming conventions support state pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
