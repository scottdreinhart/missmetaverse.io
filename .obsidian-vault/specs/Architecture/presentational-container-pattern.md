---
slug: presentational-container-pattern
sources:
  - https://medium.com/@dan_abramov/smart-and-dumb-components-7ca29
  - https://react.dev/
date: 2026-11-02
tags:
  - presentational-container
  - react
  - patterns
  - frontend
---

# Presentational/Container Pattern

## Definition

Presentational/Container Pattern is a **React pattern that separates UI components from business logic components**.

> "Presentational components are concerned with how things look, container components are concerned with how things work." — Dan Abramov

## Problem Addressed

Without presentational/container pattern:
- **Complexity**: Components are complex and hard to understand
- **Coupling**: UI is coupled to business logic
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain components

## Scope and Boundaries

- Presentational/Container ≠ Smart/Dumb (presentational/container is a pattern, smart/dumb is a term)
- Presentational/Container ≠ HOC (presentational/container is a pattern, HOC is a technique)
- Presentational/Container is a **React pattern**, not a specific technique

## When to Apply

- When building React applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Presentational/container is complex |
| **Time** — Presentational/container takes time |
| **Over-presentational** — Don't use presentational/container for everything |

## Common Misuses

- **Everything presentational**: Not everything needs presentational/container pattern
- **Confusing with smart/dumb**: Presentational/container ≠ smart/dumb
- **Over-presentational**: Too many presentational components create complexity

## Related Concepts

- [React Patterns](../React/react-patterns.md) — Presentational/container with React
- [Headless Components](Architecture/headless-components.md) — Presentational/container with headless components
- [Component Composition](Architecture/component-composition.md) — Presentational/container with composition

## Project Observations

- The project uses presentational/container pattern:
  - The project's architecture patterns note covers presentational/container pattern (from existing notes)
  - No evidence of presentational/container pattern in existing code (src/ is empty)
- File naming conventions support presentational/container pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
