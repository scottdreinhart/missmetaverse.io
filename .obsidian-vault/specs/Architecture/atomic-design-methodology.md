---
slug: atomic-design
sources:
  - https://bradfrost.com/blog/post/atomic-web-design/
  - https://atomicdesign.bradfrost.com/
date: 2026-11-02
tags:
  - atomic-design
  - ui
  - patterns
  - frontend
---

# Atomic Design

## Definition

Atomic Design is a **methodology for creating design systems that consists of five distinct stages**.

> "Atomic Design is a methodology for creating design systems that consists of five distinct stages: atoms, molecules, organisms, templates, and pages." — Brad Frost

## Problem Addressed

Without atomic design:
- **Inconsistency**: UI is inconsistent
- **Duplication**: Components are duplicated
- **Maintenance**: Hard to maintain UI
- **Scalability**: Hard to scale UI

## Scope and Boundaries

- Atomic Design ≠ Design Systems (atomic design is a methodology, design systems are a collection)
- Atomic Design ≠ Component Library (atomic design is a methodology, component libraries are specific)
- Atomic Design is a **methodology**, not a specific pattern

## When to Apply

- When building applications
- When consistency matters
- When scalability is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Atomic design is complex |
| **Time** — Atomic design takes time |
| **Over-atomic** — Don't use atomic design for everything |

## Common Misuses

- **Everything atomic**: Not everything needs atomic design
- **Confusing with design systems**: Atomic design ≠ design systems
- **Over-atomic**: Too many atoms create complexity

## Related Concepts

- [React Patterns](../React/react-patterns.md) — Atomic design with React
- [Design Systems](Architecture/design-systems.md) — Atomic design with design systems
- [Design Tokens](Architecture/design-tokens.md) — Atomic design with design tokens

## Project Observations

- The project uses atomic design:
  - The project's architecture patterns note covers atomic design (from existing notes)
  - No evidence of atomic design in existing code (src/ is empty)
- File naming conventions support atomic design:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
