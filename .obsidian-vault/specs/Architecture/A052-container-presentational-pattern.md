---
slug: container-presentational-pattern
sources:
  - https://medium.com/@dan_abramov/smart-and-dumb-components-7ca29d34cf21
  - https://react.dev/
date: 2026-11-02
tags:









  - container-presentational
  - frontend
  - react
  - separation-of-concerns
---

# Container & Presentational Components

## Definition

Container & Presentational Components is **a React pattern that separates components into container components (logic) and presentational components (UI)**.

> "Container components contain logic, presentational components contain UI. This separation enables testing and reusability." — Dan Abramov

## Problem Addressed

Without container-presentational pattern:
- **Tight coupling**: UI is coupled to logic
- **Testing**: Hard to test logic without UI
- **Reusability**: UI can't be reused with different logic
- **Maintenance**: Changes to logic break UI

## Scope and Boundaries

- Container-Presentational ≠ MVC (container-presentational is for React, MVC is a general pattern)
- Container-Presentational = Separation (container-presentational separates logic from UI)
- Container-Presentational is a **React pattern**, not an architectural pattern

## When to Apply

- When building React applications
- when testing is important
- when reusability is needed
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Container-presentational adds component count |
| **Time** — Implementing separation takes time |
| **Over-separation**: Not every component needs separation |

## Common Misuses

- **Everything separated**: Not every component needs container/presentational split
- **Ignoring custom hooks**: Custom hooks can achieve separation without container components
- **Confusing with MVP**: Container-presentational is for React, MVP is a general pattern

## Related Concepts

- [Custom Hooks](Architecture/custom-hooks-composables.md) — Custom hooks can replace container components
- [Presentation-Logic Separation](Architecture/presentation-logic-separation.md) — Presentation-logic separation is the principle
- [Component Composition](Architecture/component-composition.md) — Component composition supports separation

## Project Observations

- The project uses container-presentational pattern:
  - React supports container-presentational pattern through components
  - TypeScript supports container-presentational pattern through type system
  - The project's architecture patterns note covers React patterns
  - No evidence of container-presentational pattern in existing code (src/ is empty)
- File naming conventions support container-presentational pattern:
  - `*.view.tsx` — Presentational component files
  - `*.logic.ts` — Container component files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




