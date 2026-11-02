---
slug: hook-file-convention
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

# *.hook.ts

## Definition

`*.hook.ts` is **a file naming convention for React custom hook files that encapsulate reusable stateful logic**.

> "The *.hook.ts convention identifies React custom hook files that encapsulate reusable stateful logic." — React Docs

## Problem Addressed

Without `*.hook.ts` convention:
- **Confusion**: Don't know which files contain custom hooks
- **Mixing concerns**: Hooks are mixed with components
- **Testing**: Hard to test hooks separately
- **Maintenance**: Hard to maintain hooks

## Scope and Boundaries

- `*.hook.ts` ≠ `*.view.tsx` (`*.hook.ts` is for hooks, `*.view.tsx` is for UI)
- `*.hook.ts` = Hooks (`*.hook.ts` is for custom hooks)
- `*.hook.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building React applications
- when custom hooks are used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every hook needs a separate file |

## Common Misuses

- **Everything a hook**: Not every piece of logic needs a hook
- **Mixing concerns**: Hooks should not contain UI code
- **Confusing with logic**: Hooks encapsulate stateful logic, logic files contain business logic

## Related Concepts

- [Custom Hooks](Architecture/custom-hooks-composables.md) — Custom hooks are the pattern behind `*.hook.ts`
- [Logic File Convention](Project File Conventions/logic-file-convention.md) — Logic file convention separates business logic
- [View File Convention](Project File Conventions/view-file-convention.md) — View file convention separates UI

## Project Observations

- The project uses `*.hook.ts`:
  - React supports `*.hook.ts` through custom hook system
  - TypeScript supports `*.hook.ts` through module system
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.hook.ts` in existing code (src/ is empty)
- File naming conventions support `*.hook.ts`:
  - `*.hook.ts` — Hook files
  - `*.view.tsx` — View files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
