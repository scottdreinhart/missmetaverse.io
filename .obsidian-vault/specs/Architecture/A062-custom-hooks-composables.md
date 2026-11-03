---
slug: custom-hooks-composables
sources:
  - https://react.dev/reference/react
  - https://vuejs.org/guide/extras/composition-api-faq.html
date: 2026-11-02
tags:
  - react
  - hooks
  - composables
  - patterns
  - --
# Custom Hooks / Composables

## Definition

Custom Hooks (React) / Composables (Vue) are **reusable functions that encapsulate stateful logic and side effects**. They enable code sharing between components without changing the component hierarchy.

> "A custom hook is a JavaScript function that can use React hooks." â€” React Documentation

## Problem Addressed

Without custom hooks:
- **Duplicated logic**: Same state logic in multiple components
- **Testing difficulty**: Hard to test shared logic
- **Code sharing**: Hard to share logic between components
- **Component bloat**: Components become too large

## Scope and Boundaries

- Custom Hooks â‰  Higher-Order Components (HOCs)
- Custom Hooks â‰  Render Props (different pattern for sharing logic)
- Custom Hooks are **React-specific** (Vue uses Composables)

## When to Apply

- When the same state logic is used in multiple components
- When a component has too many hooks
- When logic needs to be tested independently
- When logic needs to be shared between projects

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Abstraction** â€” Too many hooks add complexity |
| **Naming** â€” Hook names should be clear |
| **Testing** â€” Hooks need proper testing setup |

## Common Misuses

- **Hooks everywhere**: Not every function needs to be a hook
- **Naming confusion**: Hooks must start with `use`
- **Conditional hooks**: Hooks can't be called conditionally

## Related Concepts

- [React Patterns](../React/Architecture/react-patterns) â€” Custom hooks are a core pattern
- [Component Composition](Architecture/atomic-design.md) â€” Hooks enable composition
- [Pure Functions](Architecture/pure-functions.md) â€” Hook logic should be pure

## Project Observations

- The project's React patterns note covers custom hooks
- File naming conventions support hooks:
  - `*.hook.ts` â€” Custom hook files
  - `*.logic.ts` â€” Hook business logic
- No evidence of custom hook violations in existing code

## Sources

- [[Sources/react-docs-2026|react-docs-2026]]




