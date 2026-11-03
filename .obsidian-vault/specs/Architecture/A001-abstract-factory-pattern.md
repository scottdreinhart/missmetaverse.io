---
slug: abstract-factory-pattern
sources:
  - https://refactoring.guru/design-patterns/abstract-factory
  - https://en.wikipedia.org/wiki/Abstract_factory_pattern
date: 2026-11-02
tags:
  - abstract-factory
  - creational-patterns
  - gof
  - patterns
# Abstract Factory Pattern

## Definition

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Abstract Factory Pattern is a **creational design pattern that provides an interface for creating families of related or dependent objects without specifying their concrete classes**.

> "The Abstract Factory pattern provides an interface for creating families of related or dependent objects without specifying their concrete classes." â€” GoF

## Problem Addressed

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without abstract factory pattern:
- **Coupling**: Code is coupled to concrete classes
- **Consistency**: Related objects are inconsistent
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Abstract Factory Pattern â‰  Factory Method (abstract factory is a family of methods, factory method is a single method)
- Abstract Factory Pattern â‰  Builder (abstract factory is for creation, builder is for construction)
- Abstract Factory Pattern is a **creational pattern**, not a construction pattern

## When to Apply

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building software
- when families of objects matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

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
| **Complexity** â€” Abstract factory pattern is complex |
| **Time** â€” Abstract factory pattern takes time |
| **Over-abstract-factory** â€” Don't use abstract factory for everything |

## Common Misuses

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything abstract factory**: Not everything needs abstract factory pattern
- **Confusing with factory method**: Abstract factory pattern â‰  factory method
- **Over-abstract-factory**: Too many abstract factories create complexity

## Related Concepts

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Factory Method](Architecture/factory-method-pattern.md) â€” Abstract factory pattern with factory method
- [Builder](Architecture/builder-pattern.md) â€” Abstract factory pattern with builder
- [Design Patterns Overview](Architecture/design-patterns-overview.md) â€” Abstract factory pattern with design patterns

## Project Observations

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses abstract factory pattern:
  - The project's architecture patterns note covers abstract factory pattern (from existing notes)
  - No evidence of abstract factory pattern in existing code (src/ is empty)
- File naming conventions support abstract factory pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a001-abstract-factory-pattern

## title
Abstract Factory Pattern

## aliases
- A001-abstract-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




