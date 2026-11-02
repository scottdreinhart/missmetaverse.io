---
slug: custom-hooks-pattern
sources:
  - https://react.dev/reference/react/hooks
  - https://react.dev/learn/reusing-logic-with-custom-hooks
date: 2026-11-02
tags:
  - custom-hooks
  - react
  - patterns
  - frontend
---

# Custom Hooks Pattern

## Definition

Custom Hooks Pattern is a **React pattern that allows reusing stateful logic across components**.

> "Custom hooks allow you to extract and reuse stateful logic without changing your component hierarchy." — React Docs

## Problem Addressed

Without custom hooks:
- **Duplication**: Logic is duplicated across components
- **Maintenance**: Hard to maintain logic
- **Testing**: Hard to test logic
- **Scalability**: Hard to scale logic

## Scope and Boundaries

- Custom Hooks ≠ HOC (custom hooks are functions, HOCs are components)
- Custom Hooks ≠ Render Props (custom hooks are functions, render props are components)
- Custom Hooks is a **React pattern**, not a specific pattern

## When to Apply

- When building React applications
- When logic reuse matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Custom hooks are complex |
| **Time** — Custom hooks take time |
| **Over-custom-hooks** — Don't use custom hooks for everything |

## Common Misuses

- **Everything custom hook**: Not everything needs custom hooks
- **Confusing with HOC**: Custom hooks ≠ HOC
- **Over-custom-hooks**: Too many custom hooks create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — Custom hooks with React
- [Headless UI Pattern](Architecture/headless-ui-pattern.md) — Custom hooks with headless UI
- [Component Composition](Architecture/component-composition.md) — Custom hooks with composition

## Project Observations

- The project uses custom hooks:
  - The project's architecture patterns note covers custom hooks (from existing notes)
  - No evidence of custom hooks in existing code (src/ is empty)
- File naming conventions support custom hooks:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]


