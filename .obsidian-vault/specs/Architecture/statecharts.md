---
slug: statecharts
sources:
  - https://en.wikipedia.org/wiki/State_machine
  - https://statecharts.dev/
date: 2026-11-02
tags:
  - statecharts
  - architecture
  - patterns
  - frontend
---

# Statecharts

## Definition

Statecharts are a **visual notation for describing system behavior, extending state machines with hierarchy and concurrency**.

> "Statecharts are a visual notation for describing system behavior, extending state machines with hierarchy and concurrency." — David Harel

## Problem Addressed

Without statecharts:
- **Complexity**: State management is complex
- **Bugs**: State transitions are error-prone
- **Testing**: Hard to test state transitions
- **Maintenance**: Hard to maintain state management code

## Scope and Boundaries

- Statecharts ≠ State Machines (statecharts are hierarchical, state machines are flat)
- Statecharts ≠ State Management (statecharts are a pattern, state management is a practice)
- Statecharts is a **visual notation**, not a state management pattern

## When to Apply

- When building applications
- When state management matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Statecharts are complex |
| **Time** — Statecharts take time |
| **Over-statecharts** — Don't use statecharts for everything |

## Common Misuses

- **Everything statechart**: Not everything needs statecharts
- **Confusing with state machines**: Statecharts ≠ state machines
- **Over-statecharts**: Too many statecharts create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — Statecharts with React
- [State Machines](Architecture/state-machines.md) — Statecharts with state machines
- [MVVM Pattern](Architecture/mvvm-pattern.md) — Statecharts with MVVM

## Project Observations

- The project uses statecharts:
  - The project's architecture patterns note covers statecharts (from existing notes)
  - No evidence of statecharts in existing code (src/ is empty)
- File naming conventions support statecharts:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]


