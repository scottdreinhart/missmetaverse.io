---
slug: view-file-convention
sources:
  - https://react.dev/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - type/reference
  - file-conventions
  - react
  - typescript
  - project-structure
---

# *.view.tsx

## Definition

`*.view.tsx` is **a file naming convention for React components that represent the UI view layer, separating presentation from business logic**.

> "The *.view.tsx convention identifies React components that represent the UI view layer." — React Docs

## Problem Addressed

Without `*.view.tsx` convention:
- **Confusion**: Don't know which components are views
- **Mixing concerns**: Views mix presentation and business logic
- **Testing**: Hard to test views separately
- **Maintenance**: Hard to maintain views

## Scope and Boundaries

- `*.view.tsx` ≠ `*.logic.ts` (`*.view.tsx` is for UI, `*.logic.ts` is for business logic)
- `*.view.tsx` = Presentation (`*.view.tsx` is for presentation)
- `*.view.tsx` is a **file naming convention**, not a pattern

## When to Apply

- When building React applications
- when separating presentation from business logic is important
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every component needs a view file |

## Common Misuses

- **Everything a view**: Not every component is a view
- **Mixing concerns**: Views should not contain business logic
- **Confusing with container**: Views are for presentation, containers are for logic

## Related Concepts

- [Presentational/Container Pattern](Architecture/presentational-container-pattern.md) — Presentational/container pattern supports `*.view.tsx`
- [Component Composition](Architecture/component-composition.md) — Component composition supports `*.view.tsx`
- [Custom Hooks](Architecture/custom-hooks-composables.md) — Custom hooks separate logic from views

## Project Observations

- The project uses `*.view.tsx`:
  - React supports `*.view.tsx` through component system
  - Vite supports `*.view.tsx` through build system
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.view.tsx` in existing code (src/ is empty)
- File naming conventions support `*.view.tsx`:
  - `*.view.tsx` — View files
  - `*.logic.ts` — Logic files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]



