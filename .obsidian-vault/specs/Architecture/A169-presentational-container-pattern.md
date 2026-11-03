---
slug: presentational-container-pattern
sources:
  - https://medium.com/@dan_abramov/smart-and-dumb-components-7ca29
  - https://react.dev/
date: 2026-11-02
tags:
  - presentational-container
  - react
  - patterns
  - frontend
# Presentational/Container Pattern

## Definition

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Presentational/Container Pattern is a **React pattern that separates UI components from business logic components**.

> "Presentational components are concerned with how things look, container components are concerned with how things work." â€” Dan Abramov

## Problem Addressed

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without presentational/container pattern:
- **Complexity**: Components are complex and hard to understand
- **Coupling**: UI is coupled to business logic
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain components

## Scope and Boundaries

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Presentational/Container â‰  Smart/Dumb (presentational/container is a pattern, smart/dumb is a term)
- Presentational/Container â‰  HOC (presentational/container is a pattern, HOC is a technique)
- Presentational/Container is a **React pattern**, not a specific technique

## When to Apply

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building React applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Presentational/container is complex |
| **Time** â€” Presentational/container takes time |
| **Over-presentational** â€” Don't use presentational/container for everything |

## Common Misuses

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything presentational**: Not everything needs presentational/container pattern
- **Confusing with smart/dumb**: Presentational/container â‰  smart/dumb
- **Over-presentational**: Too many presentational components create complexity

## Related Concepts

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [React Patterns](../React/Architecture/react-patterns) â€” Presentational/container with React
- [Headless Components](Architecture/headless-components.md) â€” Presentational/container with headless components
- [Component Composition](Architecture/component-composition.md) â€” Presentational/container with composition

## Project Observations

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses presentational/container pattern:
  - The project's architecture patterns note covers presentational/container pattern (from existing notes)
  - No evidence of presentational/container pattern in existing code (src/ is empty)
- File naming conventions support presentational/container pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a169-presentational-container-pattern

## title
Presentational/Container Pattern

## aliases
- A169-presentational-container-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]





