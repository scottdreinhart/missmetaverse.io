---
slug: command-query-separation
sources:
  - https://en.wikipedia.org/wiki/Command%E2%80%93query_separation
  - https://en.wikipedia.org/wiki/CQRS
date: 2026-11-02
tags:
  - cqs
  - cqrs
  - principles
  - design
# Command-Query Separation (CQS)

## Definition

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Command-Query Separation is the principle that **methods should either do something (command) or return something (query), not both**. A method should not have side effects when it is a query, and a command should not return meaningful data.

> "Every method should either do something or answer something, but not both." â€” Bertrand Meyer (1988)

## Problem Addressed

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Violating CQS leads to:
- **Unpredictable code**: Calling a method for its return value may have hidden side effects
- **Testing difficulty**: Hard to test without triggering side effects
- **Caching problems**: Can't cache query results if they have side effects
- **Reasoning difficulty**: Hard to understand what a method does

## Scope and Boundaries

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- CQS is about **method behavior**, not about architecture
- CQS â‰  CQRS (CQRS is an architectural pattern that extends CQS)
- CQS is a guideline, not an absolute rule (some methods need both)

## When to Apply

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When designing method interfaces
- When refactoring methods with side effects and return values
- When designing APIs
- When reviewing code for hidden side effects

## Tradeoffs and When to Avoid

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

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
| **More methods** â€” Separating commands and queries increases method count |
| **Boilerplate** â€” Extra methods for what could be one |
| **Performance** â€” Separate calls may be less efficient |

## Common Misuses

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Confusing with CQRS**: CQS is a method-level principle, CQRS is an architectural pattern
- **Over-applying**: Not all methods need strict CQS
- **Ignoring return values**: Commands can return status codes

## Related Concepts

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **CQRS** â€” Architectural extension of CQS
- **Pure Functions** â€” Functions that only query (no side effects)
- **Side Effects** â€” CQS prevents hidden side effects

## Project Observations

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- TypeScript's type system supports CQS through explicit return types
- File naming conventions support CQS:
  - `*.logic.ts` â€” Business logic (commands)
  - `*.data.ts` â€” Data access (queries)
- No evidence of CQS violations in existing code

## Sources

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]



