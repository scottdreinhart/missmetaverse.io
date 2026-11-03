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
  - --
# MVVM Pattern

## Definition

MVVM (Model-View-ViewModel) is an **architecture pattern that separates application into Model, View, and ViewModel components**.

> "MVVM separates application into Model (data), View (UI), and ViewModel (presentation logic)." â€” Wikipedia

## Problem Addressed

Without MVVM:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- MVVM â‰  MVP (MVVM has ViewModel, MVP has Presenter)
- MVVM â‰  MVC (MVVM has ViewModel, MVC has Controller)
- MVVM is an **architecture pattern**, not a specific pattern

## When to Apply

- When building applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” MVVM is complex |
| **Time** â€” MVVM takes time |
| **Over-mvvm** â€” Don't use MVVM for everything |

## Common Misuses

- **Everything MVVM**: Not everything needs MVVM
- **Confusing with MVP**: MVVM â‰  MVP
- **Over-mvvm**: Too many MVVM components create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) â€” MVVM with React
- [State Machines](Architecture/state-machines.md) â€” MVVM with state machines
- [Statecharts](Architecture/statecharts.md) â€” MVVM with statecharts

## Project Observations

- The project uses MVVM:
  - The project's architecture patterns note covers MVVM (from existing notes)
  - No evidence of MVVM in existing code (src/ is empty)
- File naming conventions support MVVM:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]





