---
slug: unidirectional-data-flow
sources:
  - https://react.dev/learn/you-make-the-ui-by-responding-to-events
  - https://en.wikipedia.org/wiki/Unidirectional_data_flow
date: 2026-11-02
tags:
  - react
  - data-flow
  - state
  - unidirectional
# Unidirectional Data Flow

## Definition

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Unidirectional Data Flow is a **data flow pattern where data flows in one direction: from parent to child via props, and from child to parent via callbacks**.

> "React enforces a unidirectional data flow, where data flows down and actions flow up." â€” React Documentation

## Problem Addressed

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Bidirectional data flow leads to:
- **Unpredictable state**: Changes can come from anywhere
- **Debugging difficulty**: Hard to trace state changes
- **Testing difficulty**: Hard to test without understanding all sources
- **Race conditions**: Concurrent updates cause conflicts

## Scope and Boundaries

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Unidirectional â‰  Immutable (data can be mutable, but flow is one-directional)
- Unidirectional â‰  React (other frameworks also use this pattern)
- Unidirectional is a **data flow pattern**, not a state management pattern

## When to Apply

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building React components
- When designing state management
- When debugging state issues
- When testing components

## Tradeoffs and When to Avoid

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

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
| **Prop drilling** â€” Passing data through many levels |
| **Boilerplate** â€” Callbacks for every state change |
| **Complexity** â€” State management can become complex |

## Common Misuses

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Global state everywhere**: Not everything needs global state
- **Confusing with Redux**: Unidirectional â‰  Redux
- **Ignoring local state**: Some state should be local

## Related Concepts

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [React Patterns](../React/Architecture/react-patterns) â€” React's data flow
- [State Machines](Architecture/atomic-design.md) â€” State management
- [Immutability](Architecture/immutable-data.md) â€” Unidirectional flow works best with immutable data

## Project Observations

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- React 19 enforces unidirectional data flow by default
- The project's React patterns note covers data flow
- File naming conventions support unidirectional flow:
  - `*.view.tsx` â€” Presentational (receives data)
  - `*.logic.ts` â€” Business logic (processes data)
  - `*.hook.ts` â€” State management (manages flow)

## Sources

## concept_id
a229-unidirectional-data-flow

## title
Unidirectional Data Flow

## aliases
- A229-unidirectional-data-flow

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/react-docs-2026|react-docs-2026]]




