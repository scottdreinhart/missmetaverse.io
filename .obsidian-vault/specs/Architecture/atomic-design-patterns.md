---
slug: atomic-design-patterns
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

# Atomic Design Patterns

## Definition

Atomic Design Patterns are **design patterns for working with atomic design methodology**.

> "Atomic Design is a methodology for creating design systems that consists of five distinct stages: atoms, molecules, organisms, templates, and pages." — Brad Frost

## Problem Addressed

Without atomic design patterns:
- **Inconsistency**: UI is inconsistent
- **Duplication**: Components are duplicated
- **Maintenance**: Hard to maintain UI
- **Scalability**: Hard to scale UI

## Scope and Boundaries

- Atomic Design Patterns ≠ Atomic Design (atomic design patterns are patterns, atomic design is a methodology)
- Atomic Design Patterns ≠ Design Systems (atomic design patterns are patterns, design systems are a collection)
- Atomic Design Patterns is a **patterns**, not a methodology

## When to Apply

- When building applications
- when consistency matters
- when scalability is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Atomic design patterns are complex |
| **Time** — Atomic design patterns take time |
| **Over-atomic-design** — Don't use atomic design for everything |

## Common Misuses

- **Everything atomic**: Not everything needs atomic design patterns
- **Confusing with design systems**: Atomic design patterns ≠ design systems
- **Over-atomic-design**: Too many atoms create complexity

## Related Concepts

- [React Patterns](../React/react-patterns) — Atomic design patterns with React
- [Design Systems](Architecture/design-systems-patterns.md) — Atomic design patterns with design systems
- [Design Tokens](Architecture/design-tokens.md) — Atomic design patterns with design tokens

## Project Observations

- The project uses atomic design patterns:
  - The project's architecture patterns note covers atomic design patterns (from existing notes)
  - No evidence of atomic design patterns in existing code (src/ is empty)
- File naming conventions support atomic design patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]


