---
slug: headless-ui-pattern
sources:
  - https://www.radix-ui.com/
  - https://headlessui.dev/
date: 2026-11-02
tags:










  - headless-ui
  - react
  - patterns
  - frontend
---

# Headless UI Pattern

## Definition

Headless UI Pattern is a **React pattern that provides unstyled, fully accessible components with full control over styling**.

> "Headless UI components are unstyled, fully accessible components that give you full control over styling." — Radix UI

## Problem Addressed

Without headless UI:
- **Styling difficulty**: Hard to style components
- **Accessibility**: Hard to make components accessible
- **Flexibility**: Hard to customize components
- **Maintenance**: Hard to maintain components

## Scope and Boundaries

- Headless UI ≠ Component Library (headless UI is unstyled, component libraries are styled)
- Headless UI ≠ UI Kit (headless UI is unstyled, UI kits are styled)
- Headless UI is a **pattern**, not a specific pattern

## When to Apply

- When building React applications
- When styling matters
- When accessibility is important
- When customization is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Headless UI is complex |
| **Time** — Headless UI takes time |
| **Over-headless** — Don't use headless UI for everything |

## Common Misuses

- **Everything headless**: Not everything needs headless UI
- **Confusing with component library**: Headless UI ≠ component library
- **Over-headless**: Too many headless components create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — Headless UI with React
- [Design Systems](Architecture/design-systems.md) — Headless UI with design systems
- [Component Composition](Architecture/component-composition.md) — Headless UI with composition

## Project Observations

- The project uses headless UI:
  - The project's architecture patterns note covers headless UI (from existing notes)
  - No evidence of headless UI in existing code (src/ is empty)
- File naming conventions support headless UI:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]





