---
slug: state-pattern
sources:
  - https://en.wikipedia.org/wiki/State_pattern
  - https://martinfowler.com/eaaDev/stateMemento.html
date: 2026-11-02
tags:
  - state-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
  - --
# State Pattern

## Definition

State Pattern is a **behavioral design pattern that allows an object to alter its behavior when its internal state changes**.

> "The State pattern allows an object to alter its behavior when its internal state changes, appearing to change its class." â€” GoF

## Problem Addressed

Without state pattern:
- **Complexity**: State management is complex
- **Coupling**: State is coupled to behavior
- **Testing**: Hard to test state
- **Maintenance**: Hard to maintain state

## Scope and Boundaries

- State Pattern â‰  Strategy (state pattern is for states, strategy pattern is for algorithms)
- State Pattern â‰  State Machines (state pattern is a pattern, state machines are a model)
- State Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When state changes matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” State pattern is complex |
| **Time** â€” State pattern takes time |
| **Over-state** â€” Don't use state for everything |

## Common Misuses

- **Everything state**: Not everything needs state pattern
- **Confusing with strategy**: State pattern â‰  strategy
- **Over-state**: Too many states create complexity

## Related Concepts

- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” State pattern with DDD
- [Strategy Pattern](Architecture/strategy-pattern.md) â€” State pattern with strategy
- [State Machines](Architecture/state-machines.md) â€” State pattern with state machines

## Project Observations

- The project uses state pattern:
  - The project's architecture patterns note covers state pattern (from existing notes)
  - No evidence of state pattern in existing code (src/ is empty)
- File naming conventions support state pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




