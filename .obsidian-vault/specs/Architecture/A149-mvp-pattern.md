---
slug: mvp-pattern
sources:
  - https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter
  - https://martinfowler.com/eaaDev/mvc.html
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
  - mvp
  - architecture
  - patterns
  - frontend
---

# MVP Pattern

## Definition

MVP (Model-View-Presenter) is an **architecture pattern that separates application into Model, View, and Presenter components**.

> "MVP separates application into Model (data), View (UI), and Presenter (business logic)." — Wikipedia

## Problem Addressed

Without MVP:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- MVP ≠ MVC (MVP has View-Model communication, MVC has View-Controller communication)
- MVP ≠ MVVM (MVP has Presenter, MVVM has ViewModel)
- MVP is an **architecture pattern**, not a specific pattern

## When to Apply

- When building applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — MVP is complex |
| **Time** — MVP takes time |
| **Over-mvp** — Don't use MVP for everything |

## Common Misuses

- **Everything MVP**: Not everything needs MVP
- **Confusing with MVC**: MVP ≠ MVC
- **Over-mvp**: Too many MVP components create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — MVP with React
- [State Machines](Architecture/state-machines.md) — MVP with state machines
- [Statecharts](Architecture/statecharts.md) — MVP with statecharts

## Project Observations

- The project uses MVP:
  - The project's architecture patterns note covers MVP (from existing notes)
  - No evidence of MVP in existing code (src/ is empty)
- File naming conventions support MVP:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]





