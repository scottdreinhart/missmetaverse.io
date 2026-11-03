---
slug: unidirectional-data-flow
sources:
  - https://react.dev/learn/you-make-the-ui-by-responding-to-events
  - https://en.wikipedia.org/wiki/Unidirectional_data_flow
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
  - react
  - data-flow
  - state
  - unidirectional
---

# Unidirectional Data Flow

## Definition

Unidirectional Data Flow is a **data flow pattern where data flows in one direction: from parent to child via props, and from child to parent via callbacks**.

> "React enforces a unidirectional data flow, where data flows down and actions flow up." — React Documentation

## Problem Addressed

Bidirectional data flow leads to:
- **Unpredictable state**: Changes can come from anywhere
- **Debugging difficulty**: Hard to trace state changes
- **Testing difficulty**: Hard to test without understanding all sources
- **Race conditions**: Concurrent updates cause conflicts

## Scope and Boundaries

- Unidirectional ≠ Immutable (data can be mutable, but flow is one-directional)
- Unidirectional ≠ React (other frameworks also use this pattern)
- Unidirectional is a **data flow pattern**, not a state management pattern

## When to Apply

- When building React components
- When designing state management
- When debugging state issues
- When testing components

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Prop drilling** — Passing data through many levels |
| **Boilerplate** — Callbacks for every state change |
| **Complexity** — State management can become complex |

## Common Misuses

- **Global state everywhere**: Not everything needs global state
- **Confusing with Redux**: Unidirectional ≠ Redux
- **Ignoring local state**: Some state should be local

## Related Concepts

- [React Patterns](../React/react-patterns) — React's data flow
- [State Machines](Architecture/atomic-design.md) — State management
- [Immutability](Architecture/immutable-data.md) — Unidirectional flow works best with immutable data

## Project Observations

- React 19 enforces unidirectional data flow by default
- The project's React patterns note covers data flow
- File naming conventions support unidirectional flow:
  - `*.view.tsx` — Presentational (receives data)
  - `*.logic.ts` — Business logic (processes data)
  - `*.hook.ts` — State management (manages flow)

## Sources

- [[Sources/react-docs-2026|react-docs-2026]]




