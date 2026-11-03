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
  - --
# Headless UI Pattern

## Definition

Headless UI Pattern is a **React pattern that provides unstyled, fully accessible components with full control over styling**.

> "Headless UI components are unstyled, fully accessible components that give you full control over styling." â€” Radix UI

## Problem Addressed

Without headless UI:
- **Styling difficulty**: Hard to style components
- **Accessibility**: Hard to make components accessible
- **Flexibility**: Hard to customize components
- **Maintenance**: Hard to maintain components

## Scope and Boundaries

- Headless UI â‰  Component Library (headless UI is unstyled, component libraries are styled)
- Headless UI â‰  UI Kit (headless UI is unstyled, UI kits are styled)
- Headless UI is a **pattern**, not a specific pattern

## When to Apply

- When building React applications
- When styling matters
- When accessibility is important
- When customization is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Headless UI is complex |
| **Time** â€” Headless UI takes time |
| **Over-headless** â€” Don't use headless UI for everything |

## Common Misuses

- **Everything headless**: Not everything needs headless UI
- **Confusing with component library**: Headless UI â‰  component library
- **Over-headless**: Too many headless components create complexity

## Related Concepts

- [React Patterns](../React/Architecture/react-patterns) â€” Headless UI with React
- [Design Systems](Architecture/design-systems.md) â€” Headless UI with design systems
- [Component Composition](Architecture/component-composition.md) â€” Headless UI with composition

## Project Observations

- The project uses headless UI:
  - The project's architecture patterns note covers headless UI (from existing notes)
  - No evidence of headless UI in existing code (src/ is empty)
- File naming conventions support headless UI:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]





