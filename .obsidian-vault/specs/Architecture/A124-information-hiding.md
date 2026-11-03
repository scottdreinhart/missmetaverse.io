---
slug: information-hiding
sources:
  - https://en.wikipedia.org/wiki/Information_hiding
  - https://www.cs.utexas.edu/users/EWD/ewd03xx/EWD339.PDF
date: 2026-11-02
tags:
  - information-hiding
  - encapsulation
  - principles
  - dijkstra
# Information Hiding

## Definition

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Information Hiding is the principle that **a module should hide internal details and expose only what is necessary for interaction**. Other modules should not depend on internal implementation details.

> "Information hiding is the distribution of functions among program components in such a way as to minimize the amount of information that must be known by one program component in order to write or read another." â€” David Parnas (1972)

## Problem Addressed

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without information hiding:
- **Fragile dependencies**: Internal changes break external code
- **Testing difficulty**: Hard to test without understanding internals
- **Security risks**: Sensitive data exposed unnecessarily
- **Team coordination**: Developers need to understand too much

## Scope and Boundaries

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Information hiding is about **access control**, not just encapsulation
- It applies at all levels: modules, classes, functions, variables
- Information hiding â‰  Privacy (a security concept)

## When to Apply

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When designing module interfaces
- When choosing between public and private members
- When structuring data flow between components
- When evaluating API design

## Tradeoffs and When to Avoid

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

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
| **Over-hiding** | Hiding too much makes debugging harder |
| **False security** | Hiding doesn't prevent determined access |
| **Complexity** | Too many access levels add cognitive load |

## Common Misuses

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Private everything**: Making everything private when some should be internal
- **Public everything**: No information hiding at all
- **Confusing with encapsulation**: Information hiding is about what's exposed, encapsulation is about bundling

## Related Concepts

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Encapsulation** â€” Bundling data and behavior together
- **Single Responsibility Principle** â€” Hides implementation details of a single concern
- **Low Coupling** â€” Information hiding enables low coupling

## Project Observations

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- TypeScript's `private`, `protected`, and `public` modifiers support information hiding
- File naming conventions (`*.port.ts` for interfaces, `*.adapter.ts` for implementations) enforce information hiding at the file level
- No evidence of information hiding violations in existing code

## Sources

## concept_id
a124-information-hiding

## title
Information Hiding

## aliases
- A124-information-hiding

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]



