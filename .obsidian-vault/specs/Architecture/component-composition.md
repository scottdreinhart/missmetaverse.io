---
slug: component-composition
sources:
  - https://react.dev/learn/composing-components
  - https://en.wikipedia.org/wiki/Component-based_software_engineering
date: 2026-11-02
tags:
  - react
  - components
  - composition
  - atomic-design
---

# Component Composition

## Definition

Component Composition is the principle that **complex UIs should be built by combining simple, reusable components rather than creating large, monolithic components**.

> "Composition is one of the core principles of React. It enables you to create complex UIs from simple, reusable pieces." — React Documentation

## Problem Addressed

Without composition:
- **Monolithic components**: Large, hard-to-maintain components
- **Duplication**: Similar components with slight differences
- **Testing difficulty**: Hard to test large components
- **Reusability**: Hard to reuse parts of large components

## Scope and Boundaries

- Composition ≠ Inheritance (composition is preferred over inheritance)
- Composition ≠ Aggregation (composition is about UI structure)
- Composition is a **design pattern**, not a framework feature

## When to Apply

- When building complex UIs
- When components have similar structure
- When components need to be tested independently
- When components need to be reused

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Prop drilling** — Passing data through many levels |
| **Abstraction** — Too many levels of composition |
| **Performance** — More components = more renders |

## Common Misuses

- **Over-composition**: Too many small components
- **Confusing with inheritance**: Composition ≠ class inheritance
- **Ignoring performance**: Too many components can hurt performance

## Related Concepts

- [Atomic Design](Architecture/atomic-design.md) — Composition at the UI level
- [React Patterns](../React/react-patterns) — React component composition
- [Composition over Inheritance](Architecture/composition-over-inheritance.md) — General principle

## Project Observations

- React 19 encourages component composition
- The project's Atomic Design note covers composition at the UI level
- File naming conventions support composition:
  - `*.view.tsx` — Composable UI components
  - `*.hook.ts` — Composable logic

## Sources

- [[Sources/react-docs-2026|react-docs-2026]]

