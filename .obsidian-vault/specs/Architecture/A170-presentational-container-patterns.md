---
slug: presentational-container-pattern-patterns
sources:
  - https://medium.com/@dan_abramov/smart-and-dumb-components-7ca29
  - https://react.dev/
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
  - presentational-container
  - react
  - patterns
  - frontend
---

# Presentational/Container Pattern Patterns

## Definition

Presentational/Container Pattern Patterns are **design patterns for working with presentational/container architecture**.

> "Presentational components are concerned with how things look, container components are concerned with how things work." — Dan Abramov

## Problem Addressed

Without presentational/container pattern patterns:
- **Complexity**: Components are complex and hard to understand
- **Coupling**: UI is coupled to business logic
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain components

## Scope and Boundaries

- Presentational/Container Pattern Patterns ≠ Presentational/Container (presentational/container pattern patterns are patterns, presentational/container is a React pattern)
- Presentational/Container Pattern Patterns ≠ Smart/Dumb (presentational/container pattern patterns are patterns, smart/dumb is a term)
- Presentational/Container Pattern Patterns is a **patterns**, not a React pattern

## When to Apply

- When building React applications
- when separation of concerns matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Presentational/container pattern patterns are complex |
| **Time** — Presentational/container pattern patterns take time |
| **Over-presentational/container** — Don't use presentational/container for everything |

## Common Misuses

- **Everything presentational/container**: Not everything needs presentational/container pattern patterns
- **Confusing with smart/dumb**: Presentational/container pattern patterns ≠ smart/dumb
- **Over-presentational/container**: Too many presentational/container components create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — Presentational/container pattern patterns with React
- [Headless Components](Architecture/headless-components.md) — Presentational/container pattern patterns with headless components
- [Component Composition](Architecture/component-composition.md) — Presentational/container pattern patterns with composition

## Project Observations

- The project uses presentational/container pattern patterns:
  - The project's architecture patterns note covers presentational/container pattern patterns (from existing notes)
  - No evidence of presentational/container pattern patterns in existing code (src/ is empty)
- File naming conventions support presentational/container pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]





