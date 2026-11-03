---
slug: mvc-pattern
sources:
  - https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller
  - https://martinfowler.com/eaaDev/mvc.html
date: 2026-11-02
tags:
  - mvc
  - architecture
  - patterns
  - frontend
# MVC Pattern

## Definition

## concept_id
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
MVC (Model-View-Controller) is an **architecture pattern that separates application into three interconnected components**.

> "MVC separates application into three components: Model (data), View (UI), and Controller (input handling)." â€” Wikipedia

## Problem Addressed

## concept_id
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without MVC:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

## concept_id
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- MVC â‰  MVP (MVC has direct View-Controller communication, MVP has View-Model communication)
- MVC â‰  MVVM (MVC has Controller, MVVM has ViewModel)
- MVC is an **architecture pattern**, not a specific pattern

## When to Apply

## concept_id
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

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
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

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
| **Complexity** â€” MVC is complex |
| **Time** â€” MVC takes time |
| **Over-mvc** â€” Don't use MVC for everything |

## Common Misuses

## concept_id
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything MVC**: Not everything needs MVC
- **Confusing with MVP**: MVC â‰  MVP
- **Over-mvc**: Too many MVC components create complexity

## Related Concepts

## concept_id
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [React Patterns](../React/Architecture/react-patterns) â€” MVC with React
- [State Machines](Architecture/state-machines.md) â€” MVC with state machines
- [Statecharts](Architecture/statecharts.md) â€” MVC with statecharts

## Project Observations

## concept_id
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses MVC:
  - The project's architecture patterns note covers MVC (from existing notes)
  - No evidence of MVC in existing code (src/ is empty)
- File naming conventions support MVC:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a147-mvc-pattern

## title
MVC Pattern

## aliases
- A147-mvc-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]





