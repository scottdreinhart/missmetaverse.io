---
slug: observer-pattern
sources:
  - https://en.wikipedia.org/wiki/Observer_pattern
  - https://martinfowler.com/eaaDev/observer.html
date: 2026-11-02
tags:
  - observer-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
# Observer Pattern

## Definition

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Observer Pattern is a **behavioral design pattern that defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified**.

> "The Observer pattern defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified." â€” GoF

## Problem Addressed

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without observer pattern:
- **Coupling**: Objects are tightly coupled
- **Inconsistency**: Objects are inconsistent
- **Testing**: Hard to test objects
- **Maintenance**: Hard to maintain objects

## Scope and Boundaries

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Observer Pattern â‰  Event Emitter (observer pattern is a pattern, event emitter is an implementation)
- Observer Pattern â‰  Pub/Sub (observer pattern is one-to-many, pub/sub is many-to-many)
- Observer Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When state changes matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

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
| **Complexity** â€” Observer pattern is complex |
| **Time** â€” Observer pattern takes time |
| **Over-observer** â€” Don't use observer for everything |

## Common Misuses

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything observer**: Not everything needs observer pattern
- **Confusing with event emitter**: Observer pattern â‰  event emitter
- **Over-observer**: Too many observers create complexity

## Related Concepts

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Observer pattern with DDD
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) â€” Observer pattern with EDA
- [State Pattern](Architecture/state-pattern.md) â€” Observer pattern with state

## Project Observations

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses observer pattern:
  - The project's architecture patterns note covers observer pattern (from existing notes)
  - No evidence of observer pattern in existing code (src/ is empty)
- File naming conventions support observer pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a157-observer-pattern

## title
Observer Pattern

## aliases
- A157-observer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




