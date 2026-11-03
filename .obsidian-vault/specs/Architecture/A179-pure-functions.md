---
slug: a179-pure-functions
sources:
  - https://en.wikipedia.org/wiki/Pure_function
  - https://wiki.c2.com/?PureFunction
date: 2026-11-02
tags:
  - pure-functions
  - functional
  - typescript
  - design
# Pure Functions

## Definition

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
A Pure Function is a function that **always produces the same output for the same input and has no side effects**. It doesn't modify external state or depend on external state.

> "A pure function is a function that has the following properties: 1. It always returns the same result given the same arguments. 2. It has no side effects." â€” Functional programming definition

## Problem Addressed

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Impure functions lead to:
- **Unpredictability**: Same input can produce different output
- **Testing difficulty**: Hard to test without mocking
- **Debugging difficulty**: Hard to trace side effects
- **Concurrency issues**: Side effects cause race conditions

## Scope and Boundaries

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Pure â‰  Simple (complex calculations can be pure)
- Pure â‰  No I/O (pure functions can be composed with impure functions)
- Pure â‰  Functional (functional programming uses pure functions but is broader)

## When to Apply

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When writing business logic
- When writing utility functions
- When writing calculations
- When writing data transformations

## Tradeoffs and When to Avoid

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

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
| **Immutability overhead** â€” Pure functions need immutable inputs |
| **Composition complexity** â€” Composing many pure functions can be complex |
| **I/O handling** â€” Pure functions can't do I/O directly |

## Common Misuses

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything pure**: I/O must be impure
- **False purity**: Functions that appear pure but depend on external state
- **Over-engineering**: Not everything needs to be pure

## Related Concepts

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Immutability](Architecture/immutable-data.md) â€” Pure functions need immutable inputs
- [Command-Query Separation](Architecture/command-query-separation.md) â€” Queries should be pure
- [Parse, Don't Validate](Architecture/parse-dont-validate.md) â€” Parsing is a pure operation

## Project Observations

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- TypeScript supports pure functions through:
  - Type inference (return types)
  - No implicit any (forces explicit types)
  - Strict mode (catches side effects)
- File naming conventions support purity:
  - `*.logic.ts` â€” Business logic should be pure
  - `*.data.ts` â€” Data access is impure (by design)

## Sources

## concept_id
a179-pure-functions

## title
Pure Functions

## aliases
- A179-pure-functions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



