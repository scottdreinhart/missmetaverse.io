---
slug: statecharts-patterns
sources:
  - https://en.wikipedia.org/wiki/State_machine
  - https://statecharts.dev/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - status/complete
  - type/reference
  - domain/architecture
  - statecharts
  - architecture
  - patterns
  - frontend
---

# Statecharts Patterns

## Definition

Statecharts Patterns are **design patterns for working with statecharts**.

> "Statecharts are a visual notation for describing system behavior, extending state machines with hierarchy and concurrency." — David Harel

## Problem Addressed

Without statecharts patterns:
- **Complexity**: State management is complex
- **Bugs**: State transitions are error-prone
- **Testing**: Hard to test state transitions
- **Maintenance**: Hard to maintain state management code

## Scope and Boundaries

- Statecharts Patterns ≠ Statecharts (statecharts patterns are patterns, statecharts are a visual notation)
- Statecharts Patterns ≠ State Management (statecharts patterns are patterns, state management is a practice)
- Statecharts Patterns is a **patterns**, not a visual notation

## When to Apply

- When building applications
- when state management matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Statecharts patterns are complex |
| **Time** — Statecharts patterns take time |
| **Over-statecharts** — Don't use statecharts for everything |

## Common Misuses

- **Everything statechart**: Not everything needs statecharts patterns
- **Confusing with state management**: Statecharts patterns ≠ state management
- **Over-statecharts**: Too many statecharts create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — Statecharts patterns with React
- [State Machines](Architecture/state-machines-patterns.md) — Statecharts patterns with state machines
- [MVVM Pattern](Architecture/mvvm-pattern-patterns.md) — Statecharts patterns with MVVM

## Project Observations

- The project uses statecharts patterns:
  - The project's architecture patterns note covers statecharts patterns (from existing notes)
  - No evidence of statecharts patterns in existing code (src/ is empty)
- File naming conventions support statecharts patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]





