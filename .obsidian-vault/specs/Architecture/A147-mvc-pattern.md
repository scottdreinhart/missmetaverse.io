---
slug: mvc-pattern
sources:
  - https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller
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
  - mvc
  - architecture
  - patterns
  - frontend
---

# MVC Pattern

## Definition

MVC (Model-View-Controller) is an **architecture pattern that separates application into three interconnected components**.

> "MVC separates application into three components: Model (data), View (UI), and Controller (input handling)." — Wikipedia

## Problem Addressed

Without MVC:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- MVC ≠ MVP (MVC has direct View-Controller communication, MVP has View-Model communication)
- MVC ≠ MVVM (MVC has Controller, MVVM has ViewModel)
- MVC is an **architecture pattern**, not a specific pattern

## When to Apply

- When building applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — MVC is complex |
| **Time** — MVC takes time |
| **Over-mvc** — Don't use MVC for everything |

## Common Misuses

- **Everything MVC**: Not everything needs MVC
- **Confusing with MVP**: MVC ≠ MVP
- **Over-mvc**: Too many MVC components create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — MVC with React
- [State Machines](Architecture/state-machines.md) — MVC with state machines
- [Statecharts](Architecture/statecharts.md) — MVC with statecharts

## Project Observations

- The project uses MVC:
  - The project's architecture patterns note covers MVC (from existing notes)
  - No evidence of MVC in existing code (src/ is empty)
- File naming conventions support MVC:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]





