---
slug: prototype-pattern
sources:
  - https://refactoring.guru/design-patterns/prototype
  - https://en.wikipedia.org/wiki/Prototype_pattern
date: 2026-11-02
tags:
  - maturity/experimental
  - prototype
  - creational-patterns
  - gof
  - patterns
# Prototype Pattern

## Definition

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Prototype Pattern is a **creational design pattern that creates new objects by copying an existing object**.

> "The Prototype pattern creates new objects by copying an existing object." â€” GoF

## Problem Addressed

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without prototype pattern:
- **Complexity**: Object creation is complex
- **Duplication**: Objects are duplicated
- **Testing**: Hard to test creation
- **Maintenance**: Hard to maintain creation

## Scope and Boundaries

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Prototype Pattern â‰  Factory Method (prototype is for copying, factory method is for creation)
- Prototype Pattern â‰  Abstract Factory (prototype is for copying, abstract factory is for creation)
- Prototype Pattern is a **creational pattern**, not a creation pattern

## When to Apply

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building software
- when object copying matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

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
| **Complexity** â€” Prototype pattern is complex |
| **Time** â€” Prototype pattern takes time |
| **Over-prototype** â€” Don't use prototype for everything |

## Common Misuses

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything prototype**: Not everything needs prototype pattern
- **Confusing with factory method**: Prototype pattern â‰  factory method
- **Over-prototype**: Too many prototypes create complexity

## Related Concepts

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Factory Method](Architecture/factory-method-pattern.md) â€” Prototype pattern with factory method
- [Abstract Factory](Architecture/abstract-factory-pattern.md) â€” Prototype pattern with abstract factory
- [Design Patterns Overview](Architecture/design-patterns-overview.md) â€” Prototype pattern with design patterns

## Project Observations

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses prototype pattern:
  - The project's architecture patterns note covers prototype pattern (from existing notes)
  - No evidence of prototype pattern in existing code (src/ is empty)
- File naming conventions support prototype pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a175-prototype-pattern

## title
Prototype Pattern

## aliases
- A175-prototype-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




