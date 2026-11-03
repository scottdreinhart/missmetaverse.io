---
slug: container-presentational-pattern
sources:
  - https://medium.com/@dan_abramov/smart-and-dumb-components-7ca29d34cf21
  - https://react.dev/
date: 2026-11-02
tags:
  - container-presentational
  - frontend
  - react
  - separation-of-concerns
# Container & Presentational Components

## Definition

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Container & Presentational Components is **a React pattern that separates components into container components (logic) and presentational components (UI)**.

> "Container components contain logic, presentational components contain UI. This separation enables testing and reusability." â€” Dan Abramov

## Problem Addressed

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without container-presentational pattern:
- **Tight coupling**: UI is coupled to logic
- **Testing**: Hard to test logic without UI
- **Reusability**: UI can't be reused with different logic
- **Maintenance**: Changes to logic break UI

## Scope and Boundaries

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Container-Presentational â‰  MVC (container-presentational is for React, MVC is a general pattern)
- Container-Presentational = Separation (container-presentational separates logic from UI)
- Container-Presentational is a **React pattern**, not an architectural pattern

## When to Apply

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building React applications
- when testing is important
- when reusability is needed
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

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
| **Complexity** â€” Container-presentational adds component count |
| **Time** â€” Implementing separation takes time |
| **Over-separation**: Not every component needs separation |

## Common Misuses

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything separated**: Not every component needs container/presentational split
- **Ignoring custom hooks**: Custom hooks can achieve separation without container components
- **Confusing with MVP**: Container-presentational is for React, MVP is a general pattern

## Related Concepts

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Custom Hooks](Architecture/custom-hooks-composables.md) â€” Custom hooks can replace container components
- [Presentation-Logic Separation](Architecture/presentation-logic-separation.md) â€” Presentation-logic separation is the principle
- [Component Composition](Architecture/component-composition.md) â€” Component composition supports separation

## Project Observations

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses container-presentational pattern:
  - React supports container-presentational pattern through components
  - TypeScript supports container-presentational pattern through type system
  - The project's architecture patterns note covers React patterns
  - No evidence of container-presentational pattern in existing code (src/ is empty)
- File naming conventions support container-presentational pattern:
  - `*.view.tsx` â€” Presentational component files
  - `*.logic.ts` â€” Container component files

## Sources

## concept_id
a052-container-presentational-pattern

## title
Container & Presentational Components

## aliases
- A052-container-presentational-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




