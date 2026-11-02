---
slug: mvvm-pattern
sources:
  - https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel
  - https://react.dev/
date: 2026-11-02
tags:
  - mvvm
  - architecture
  - patterns
  - frontend
---

# MVVM Pattern

## Definition

MVVM (Model-View-ViewModel) is an **architecture pattern that separates application into Model, View, and ViewModel components**.

> "MVVM separates application into Model (data), View (UI), and ViewModel (presentation logic)." — Wikipedia

## Problem Addressed

Without MVVM:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- MVVM ≠ MVP (MVVM has ViewModel, MVP has Presenter)
- MVVM ≠ MVC (MVVM has ViewModel, MVC has Controller)
- MVVM is an **architecture pattern**, not a specific pattern

## When to Apply

- When building applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — MVVM is complex |
| **Time** — MVVM takes time |
| **Over-mvvm** — Don't use MVVM for everything |

## Common Misuses

- **Everything MVVM**: Not everything needs MVVM
- **Confusing with MVP**: MVVM ≠ MVP
- **Over-mvvm**: Too many MVVM components create complexity

## Related Concepts

- [React Patterns](../React/react-patterns.md) — MVVM with React
- [State Machines](Architecture/state-machines.md) — MVVM with state machines
- [Statecharts](Architecture/statecharts.md) — MVVM with statecharts

## Project Observations

- The project uses MVVM:
  - The project's architecture patterns note covers MVVM (from existing notes)
  - No evidence of MVVM in existing code (src/ is empty)
- File naming conventions support MVVM:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
