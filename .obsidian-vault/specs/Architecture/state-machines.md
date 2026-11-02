---
slug: state-machines
sources:
  - https://en.wikipedia.org/wiki/Finite-state_machine
  - https://xstate.js.org/
date: 2026-11-02
tags:
  - state-machines
  - architecture
  - patterns
  - frontend
---

# State Machines

## Definition

State Machines are a **design pattern that models system behavior as states and transitions**.

> "A state machine is a mathematical model of computation that represents system behavior as states and transitions." — Wikipedia

## Problem Addressed

Without state machines:
- **Complexity**: State management is complex
- **Bugs**: State transitions are error-prone
- **Testing**: Hard to test state transitions
- **Maintenance**: Hard to maintain state management code

## Scope and Boundaries

- State Machines ≠ Statecharts (state machines are simple, statecharts are hierarchical)
- State Machines ≠ State Management (state machines are a pattern, state management is a practice)
- State Machines is a **design pattern**, not a state management pattern

## When to Apply

- When building applications
- When state management matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — State machines are complex |
| **Time** — State machines take time |
| **Over-state-machines** — Don't use state machines for everything |

## Common Misuses

- **Everything state machine**: Not everything needs state machines
- **Confusing with statecharts**: State machines ≠ statecharts
- **Over-state-machines**: Too many state machines create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — State machines with React
- [Statecharts](Architecture/statecharts.md) — State machines with statecharts
- [MVVM Pattern](Architecture/mvvm-pattern.md) — State machines with MVVM

## Project Observations

- The project uses state machines:
  - The project's architecture patterns note covers state machines (from existing notes)
  - No evidence of state machines in existing code (src/ is empty)
- File naming conventions support state machines:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]


