---
slug: mvvm-pattern-patterns
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

# MVVM Pattern Patterns

## Definition

MVVM Pattern Patterns are **design patterns for working with MVVM architecture**.

> "MVVM separates application into Model (data), View (UI), and ViewModel (presentation logic)." — Wikipedia

## Problem Addressed

Without MVVM pattern patterns:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- MVVM Pattern Patterns ≠ MVVM (MVVM pattern patterns are patterns, MVVM is an architecture pattern)
- MVVM Pattern Patterns ≠ MVP (MVVM pattern patterns are patterns, MVP is an architecture pattern)
- MVVM Pattern Patterns is a **patterns**, not an architecture pattern

## When to Apply

- When building applications
- when separation of concerns matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — MVVM pattern patterns are complex |
| **Time** — MVVM pattern patterns take time |
| **Over-MVVM** — Don't use MVVM for everything |

## Common Misuses

- **Everything MVVM**: Not everything needs MVVM pattern patterns
- **Confusing with MVP**: MVVM pattern patterns ≠ MVP
- **Over-MVVM**: Too many MVVM components create complexity

## Related Concepts

- [React Patterns](../React/react-patterns.md) — MVVM pattern patterns with React
- [State Machines](Architecture/state-machines.md) — MVVM pattern patterns with state machines
- [Statecharts](Architecture/statecharts.md) — MVVM pattern patterns with statecharts

## Project Observations

- The project uses MVVM pattern patterns:
  - The project's architecture patterns note covers MVVM pattern patterns (from existing notes)
  - No evidence of MVVM pattern patterns in existing code (src/ is empty)
- File naming conventions support MVVM pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
