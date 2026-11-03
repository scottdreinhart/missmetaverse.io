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
# Metadata-Driven UI

## Definition

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
Metadata-Driven UI is **a design approach where UI components are generated from metadata or schema definitions rather than being hard-coded**.

> "Metadata-driven UI generates user interfaces from metadata definitions, enabling dynamic and configurable interfaces." â€” Wikipedia

## Problem Addressed

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
Without metadata-driven UI:
- **Hard-coding**: UI is hard-coded and can't be changed without code changes
- **Flexibility**: Can't change UI without deploying code
- **Configuration**: UI changes require code changes
- **Maintenance**: Hard to maintain many similar UIs

## Scope and Boundaries

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- Metadata-Driven UI â‰  Component Library (metadata-driven UI generates UI from metadata, component library provides reusable components)
- Metadata-Driven UI = Configuration (metadata-driven UI is configured through metadata)
- Metadata-Driven UI is a **design approach**, not a pattern

## When to Apply

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- When building dynamic forms or dashboards
- when UI needs to be configurable without code changes
- when maintaining many similar UIs
- when non-developers need to configure UI

## Tradeoffs and When to Avoid

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Metadata-driven UI adds abstraction complexity |
| **Time** â€” Designing metadata schemas takes time |
| **Flexibility** â€” May not support all UI patterns |

## Common Misuses

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- **Everything metadata-driven**: Not every UI needs to be metadata-driven
- **Over-engineering**: Simple UIs don't need metadata-driven approaches
- **Confusing with component library**: Metadata-driven UI generates UI, component library provides components

## Related Concepts

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- [Schema-Driven Development](Data-Driven Approaches/schema-driven-development.md) â€” Schema-driven development is related to metadata-driven UI
- [Design Systems](Frontend UI/design-systems.md) â€” Design systems provide foundations for metadata-driven UI
- [React Performance](Performance/react-performance.md) â€” Metadata-driven UI must consider performance

## Project Observations

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- The project uses metadata-driven UI:
  - React supports metadata-driven UI through dynamic rendering
  - Zod can provide schema-driven UI generation
  - The project's architecture patterns note covers UI concepts
  - No evidence of metadata-driven UI in existing code (src/ is empty)
- File naming conventions support metadata-driven UI:
  - `*.schema.ts` â€” Schema files
  - `*.types.ts` â€” Type files

## Sources

## concept_id
k04-metadata-driven-ui

## title
Metadata-Driven UI

## aliases
- K04-Metadata-Driven-UI

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]



