---
slug: design-systems
sources:
  - https://design-systems.dev/
  - https://www.patterns.dev/
date: 2026-11-02
tags:
  - design-systems
  - ui
  - patterns
  - frontend
---

# Design Systems

## Definition

Design Systems are a **collection of reusable components, guided by clear standards, that can be assembled to build any number of applications**.

> "A design system is a collection of reusable components, guided by clear standards, that can be assembled to build any number of applications." — PatternS

## Problem Addressed

Without design systems:
- **Inconsistency**: UI is inconsistent
- **Duplication**: Components are duplicated
- **Maintenance**: Hard to maintain UI
- **Scalability**: Hard to scale UI

## Scope and Boundaries

- Design Systems ≠ Component Library (design systems are broader, component libraries are specific)
- Design Systems ≠ UI Kit (design systems are broader, UI kits are specific)
- Design Systems is a **collection**, not a specific pattern

## When to Apply

- When building applications
- When consistency matters
- When scalability is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Design systems are complex |
| **Time** — Design systems take time |
| **Over-design-systems** — Don't use design systems for everything |

## Common Misuses

- **Everything design system**: Not everything needs design systems
- **Confusing with component library**: Design systems ≠ component library
- **Over-design-systems**: Too many design systems create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — Design systems with React
- [Design Tokens](Architecture/design-tokens.md) — Design systems with design tokens
- [Component Composition](Architecture/component-composition.md) — Design systems with composition

## Project Observations

- The project uses design systems:
  - The project's architecture patterns note covers design systems (from existing notes)
  - No evidence of design systems in existing code (src/ is empty)
- File naming conventions support design systems:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]


