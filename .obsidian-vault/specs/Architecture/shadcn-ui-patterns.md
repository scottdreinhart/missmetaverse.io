---
slug: shadcn-ui-patterns
sources:
  - https://ui.shadcn.com/docs
  - https://ui.shadcn.com/docs/installation
date: 2026-11-02
tags:
  - shadcn
  - ui
  - patterns
  - frontend
---

# shadcn/ui Patterns

## Definition

shadcn/ui Patterns are **design patterns for working with shadcn/ui for building accessible user interfaces**.

> "shadcn/ui is a collection of re-usable components that you can copy and paste into your apps." — shadcn/ui Docs

## Problem Addressed

Without shadcn/ui patterns:
- **Accessibility**: UI is not accessible
- **Consistency**: UI is inconsistent
- **Duplication**: Components are duplicated
- **Maintenance**: Hard to maintain components

## Scope and Boundaries

- shadcn/ui Patterns ≠ shadcn/ui (shadcn/ui patterns are patterns, shadcn/ui is a library)
- shadcn/ui Patterns ≠ UI (shadcn/ui patterns are patterns, UI is a concept)
- shadcn/ui Patterns is a **patterns**, not a library

## When to Apply

- When building web applications
- when accessibility matters
- when consistency is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — shadcn/ui patterns are complex |
| **Time** — shadcn/ui patterns take time |
| **Over-shadcn** — Don't use shadcn for everything |

## Common Misuses

- **Everything shadcn**: Not everything needs shadcn/ui patterns
- **Confusing with shadcn/ui**: shadcn/ui patterns ≠ shadcn/ui
- **Over-shadcn**: Too much shadcn creates complexity

## Related Concepts

- [Tailwind CSS Patterns](Architecture/tailwind-css-patterns.md) — shadcn/ui patterns with Tailwind
- [React Patterns](../React/react-patterns.md) — shadcn/ui patterns with React
- [Design Systems](Architecture/design-systems.md) — shadcn/ui patterns with design systems

## Project Observations

- The project uses shadcn/ui patterns:
  - The project's shadcn/ui note covers shadcn/ui patterns (from existing notes)
  - No evidence of shadcn/ui patterns in existing code (src/ is empty)
- File naming conventions support shadcn/ui patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
