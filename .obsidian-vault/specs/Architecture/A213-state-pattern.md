---
slug: state-pattern
sources:
  - https://en.wikipedia.org/wiki/State_pattern
  - https://martinfowler.com/eaaDev/stateMemento.html
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
  - state-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# State Pattern

## Definition

State Pattern is a **behavioral design pattern that allows an object to alter its behavior when its internal state changes**.

> "The State pattern allows an object to alter its behavior when its internal state changes, appearing to change its class." — GoF

## Problem Addressed

Without state pattern:
- **Complexity**: State management is complex
- **Coupling**: State is coupled to behavior
- **Testing**: Hard to test state
- **Maintenance**: Hard to maintain state

## Scope and Boundaries

- State Pattern ≠ Strategy (state pattern is for states, strategy pattern is for algorithms)
- State Pattern ≠ State Machines (state pattern is a pattern, state machines are a model)
- State Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When state changes matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — State pattern is complex |
| **Time** — State pattern takes time |
| **Over-state** — Don't use state for everything |

## Common Misuses

- **Everything state**: Not everything needs state pattern
- **Confusing with strategy**: State pattern ≠ strategy
- **Over-state**: Too many states create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — State pattern with DDD
- [Strategy Pattern](Architecture/strategy-pattern.md) — State pattern with strategy
- [State Machines](Architecture/state-machines.md) — State pattern with state machines

## Project Observations

- The project uses state pattern:
  - The project's architecture patterns note covers state pattern (from existing notes)
  - No evidence of state pattern in existing code (src/ is empty)
- File naming conventions support state pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




