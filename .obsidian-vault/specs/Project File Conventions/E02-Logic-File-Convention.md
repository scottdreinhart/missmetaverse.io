---
slug: logic-file-convention
sources:
  - https://react.dev/
  - https://vitejs.dev/
date: 2026-11-02
tags:








  - file-conventions
  - react
  - typescript
  - project-structure
---

# *.logic.ts

## Definition

`*.logic.ts` is **a file naming convention for TypeScript files that contain business logic, separated from UI components**.

> "The *.logic.ts convention identifies TypeScript files that contain business logic." — React Docs

## Problem Addressed

Without `*.logic.ts` convention:
- **Confusion**: Don't know which files contain business logic
- **Mixing concerns**: Business logic is mixed with UI
- **Testing**: Hard to test business logic separately
- **Maintenance**: Hard to maintain business logic

## Scope and Boundaries

- `*.logic.ts` ≠ `*.view.tsx` (`*.logic.ts` is for business logic, `*.view.tsx` is for UI)
- `*.logic.ts` = Business Logic (`*.logic.ts` is for business logic)
- `*.logic.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building React applications
- when separating business logic from UI is important
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every file needs a logic file |

## Common Misuses

- **Everything a logic file**: Not every file is a logic file
- **Mixing concerns**: Logic files should not contain UI code
- **Confusing with view**: Logic files are for business logic, views are for UI

## Related Concepts

- [Custom Hooks](Architecture/custom-hooks-composables.md) — Custom hooks implement `*.logic.ts`
- [Presentational/Container Pattern](Architecture/presentational-container-pattern.md) — Presentational/container pattern supports `*.logic.ts`
- [Component Composition](Architecture/component-composition.md) — Component composition supports `*.logic.ts`

## Project Observations

- The project uses `*.logic.ts`:
  - TypeScript supports `*.logic.ts` through module system
  - React supports `*.logic.ts` through custom hooks
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.logic.ts` in existing code (src/ is empty)
- File naming conventions support `*.logic.ts`:
  - `*.logic.ts` — Logic files
  - `*.view.tsx` — View files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]



