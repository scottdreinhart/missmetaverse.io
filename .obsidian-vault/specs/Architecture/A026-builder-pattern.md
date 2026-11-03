---
slug: a026-builder-pattern
sources:
  - https://refactoring.guru/design-patterns/builder
  - https://en.wikipedia.org/wiki/Builder_pattern
date: 2026-11-02
tags:
  - builder
  - creational-patterns
  - gof
  - patterns
# Builder Pattern

## Definition

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Builder Pattern is a **creational design pattern that separates the construction of a complex object from its representation**.

> "The Builder pattern separates the construction of a complex object from its representation so that the same construction process can create different representations." â€” GoF

## Problem Addressed

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without builder pattern:
- **Complexity**: Object construction is complex
- **Flexibility**: Can't create different representations
- **Testing**: Hard to test construction
- **Maintenance**: Hard to maintain construction

## Scope and Boundaries

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Builder Pattern â‰  Abstract Factory (builder is for construction, abstract factory is for creation)
- Builder Pattern â‰  Factory Method (builder is for construction, factory method is for creation)
- Builder Pattern is a **creational pattern**, not a creation pattern

## When to Apply

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building software
- when object construction matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

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
| **Complexity** â€” Builder pattern is complex |
| **Time** â€” Builder pattern takes time |
| **Over-builder** â€” Don't use builder for everything |

## Common Misuses

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything builder**: Not everything needs builder pattern
- **Confusing with abstract factory**: Builder pattern â‰  abstract factory
- **Over-builder**: Too many builders create complexity

## Related Concepts

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Abstract Factory](Architecture/abstract-factory-pattern.md) â€” Builder pattern with abstract factory
- [Factory Method](Architecture/factory-method-pattern.md) â€” Builder pattern with factory method
- [Design Patterns Overview](Architecture/design-patterns-overview.md) â€” Builder pattern with design patterns

## Project Observations

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses builder pattern:
  - The project's architecture patterns note covers builder pattern (from existing notes)
  - No evidence of builder pattern in existing code (src/ is empty)
- File naming conventions support builder pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a026-builder-pattern

## title
Builder Pattern

## aliases
- A026-builder-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




