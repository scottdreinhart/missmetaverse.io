---
slug: metadata-driven-ui
sources:
  - https://react.dev/
  - https://json-schema.org/
date: 2026-11-02
tags:
  - metadata-driven
  - ui
  - react
  - dynamic-forms
---

# Metadata-Driven UI

## Definition

Metadata-Driven UI is **a design approach where UI components are generated from metadata or schema definitions rather than being hard-coded**.

> "Metadata-driven UI generates user interfaces from metadata definitions, enabling dynamic and configurable interfaces." — Wikipedia

## Problem Addressed

Without metadata-driven UI:
- **Hard-coding**: UI is hard-coded and can't be changed without code changes
- **Flexibility**: Can't change UI without deploying code
- **Configuration**: UI changes require code changes
- **Maintenance**: Hard to maintain many similar UIs

## Scope and Boundaries

- Metadata-Driven UI ≠ Component Library (metadata-driven UI generates UI from metadata, component library provides reusable components)
- Metadata-Driven UI = Configuration (metadata-driven UI is configured through metadata)
- Metadata-Driven UI is a **design approach**, not a pattern

## When to Apply

- When building dynamic forms or dashboards
- when UI needs to be configurable without code changes
- when maintaining many similar UIs
- when non-developers need to configure UI

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Metadata-driven UI adds abstraction complexity |
| **Time** — Designing metadata schemas takes time |
| **Flexibility** — May not support all UI patterns |

## Common Misuses

- **Everything metadata-driven**: Not every UI needs to be metadata-driven
- **Over-engineering**: Simple UIs don't need metadata-driven approaches
- **Confusing with component library**: Metadata-driven UI generates UI, component library provides components

## Related Concepts

- [Schema-Driven Development](Data-Driven Approaches/schema-driven-development.md) — Schema-driven development is related to metadata-driven UI
- [Design Systems](Frontend UI/design-systems.md) — Design systems provide foundations for metadata-driven UI
- [React Performance](Performance/react-performance.md) — Metadata-driven UI must consider performance

## Project Observations

- The project uses metadata-driven UI:
  - React supports metadata-driven UI through dynamic rendering
  - Zod can provide schema-driven UI generation
  - The project's architecture patterns note covers UI concepts
  - No evidence of metadata-driven UI in existing code (src/ is empty)
- File naming conventions support metadata-driven UI:
  - `*.schema.ts` — Schema files
  - `*.types.ts` — Type files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

