---
slug: component-composition-pattern
sources:
  - https://react.dev/
  - https://react.dev/learn/composing-components
date: 2026-11-02
tags:
  - component-composition
  - react
  - patterns
  - frontend
  - --
# Component Composition Pattern

## Definition

Component Composition Pattern is a **React pattern that builds complex components from simpler ones**.

> "Composition is how React encourages building complex UIs from simpler components." â€” React Docs

## Problem Addressed

Without component composition:
- **Complexity**: Components are complex and hard to understand
- **Duplication**: Logic is duplicated across components
- **Maintenance**: Hard to maintain components
- **Scalability**: Hard to scale components

## Scope and Boundaries

- Component Composition â‰  Inheritance (component composition is composition, inheritance is inheritance)
- Component Composition â‰  HOC (component composition is composition, HOCs are components)
- Component Composition is a **React pattern**, not a specific pattern

## When to Apply

- When building React applications
- When composition matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Component composition is complex |
| **Time** â€” Component composition takes time |
| **Over-composition** â€” Don't compose everything |

## Common Misuses

- **Everything composed**: Not everything needs component composition
- **Confusing with inheritance**: Component composition â‰  inheritance
- **Over-composition**: Too much composition creates complexity

## Related Concepts

- [React Patterns](../React/Architecture/react-patterns) â€” Component composition with React
- [Custom Hooks Pattern](Architecture/custom-hooks-pattern.md) â€” Component composition with custom hooks
- [Headless UI Pattern](Architecture/headless-ui-pattern.md) â€” Component composition with headless UI

## Project Observations

- The project uses component composition:
  - The project's architecture patterns note covers component composition (from existing notes)
  - No evidence of component composition in existing code (src/ is empty)
- File naming conventions support component composition:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]





