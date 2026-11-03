---
slug: a101-factory-pattern
sources:
  - https://martinfowler.com/eaaDev/repository.html
  - https://en.wikipedia.org/wiki/Factory_method_pattern
date: 2026-11-02
tags:
  - factory-pattern
  - ddd
  - creational-patterns
  - patterns
# Factory Pattern

## Definition

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Factory Pattern is a **creational pattern that encapsulates object creation logic, providing a consistent way to create domain objects**.

> "A Factory is an operation that creates a new object and returns it." â€” Martin Fowler

## Problem Addressed

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without factory pattern:
- **Complexity**: Object creation is complex
- **Inconsistency**: Object creation is inconsistent
- **Testing**: Hard to test object creation
- **Maintenance**: Hard to maintain object creation code

## Scope and Boundaries

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Factory Pattern â‰  Abstract Factory (factory pattern is a specific pattern, abstract factory is a family of factories)
- Factory Pattern â‰  Builder (factory pattern is for creation, builder is for construction)
- Factory Pattern is a **creational pattern**, not a construction pattern

## When to Apply

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when object creation matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

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
| **Complexity** â€” Factory pattern is complex |
| **Time** â€” Factory pattern takes time |
| **Over-factory** â€” Don't use factory for everything |

## Common Misuses

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything factory**: Not everything needs factory pattern
- **Confusing with abstract factory**: Factory pattern â‰  abstract factory
- **Over-factory**: Too many factories create complexity

## Related Concepts

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Factory pattern with DDD
- [Abstract Factory](Architecture/abstract-factory-pattern.md) â€” Factory pattern with abstract factory
- [Builder](Architecture/builder-pattern.md) â€” Factory pattern with builder

## Project Observations

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses factory pattern:
  - The project's architecture patterns note covers factory pattern (from existing notes)
  - No evidence of factory pattern in existing code (src/ is empty)
- File naming conventions support factory pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a101-factory-pattern

## title
Factory Pattern

## aliases
- A101-factory-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




