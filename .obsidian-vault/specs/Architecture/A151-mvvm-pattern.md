---
slug: mvvm-pattern
sources:
  - https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel
  - https://react.dev/
date: 2026-11-02
tags:
  - mvvm
  - architecture
  - patterns
  - frontend
# MVVM Pattern

## Definition

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
MVVM (Model-View-ViewModel) is an **architecture pattern that separates application into Model, View, and ViewModel components**.

> "MVVM separates application into Model (data), View (UI), and ViewModel (presentation logic)." â€” Wikipedia

## Problem Addressed

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without MVVM:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- MVVM â‰  MVP (MVVM has ViewModel, MVP has Presenter)
- MVVM â‰  MVC (MVVM has ViewModel, MVC has Controller)
- MVVM is an **architecture pattern**, not a specific pattern

## When to Apply

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

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
| **Complexity** â€” MVVM is complex |
| **Time** â€” MVVM takes time |
| **Over-mvvm** â€” Don't use MVVM for everything |

## Common Misuses

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything MVVM**: Not everything needs MVVM
- **Confusing with MVP**: MVVM â‰  MVP
- **Over-mvvm**: Too many MVVM components create complexity

## Related Concepts

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [React Patterns](../React/Architecture/react-patterns) â€” MVVM with React
- [State Machines](Architecture/state-machines.md) â€” MVVM with state machines
- [Statecharts](Architecture/statecharts.md) â€” MVVM with statecharts

## Project Observations

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses MVVM:
  - The project's architecture patterns note covers MVVM (from existing notes)
  - No evidence of MVVM in existing code (src/ is empty)
- File naming conventions support MVVM:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a151-mvvm-pattern

## title
MVVM Pattern

## aliases
- A151-mvvm-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]





