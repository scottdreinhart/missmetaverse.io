---
slug: a007-adapter-pattern
sources:
  - https://en.wikipedia.org/wiki/Adapter_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - adapter-pattern
  - structural-patterns
  - patterns
  - design-patterns
# Adapter Pattern

## Definition

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Adapter Pattern is a **structural design pattern that allows objects with incompatible interfaces to collaborate**.

> "The Adapter pattern provides a different interface for a class, enabling objects to work together that couldn't otherwise due to incompatible interfaces." â€” GoF

## Problem Addressed

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without adapter pattern:
- **Incompatibility**: Objects can't work together
- **Coupling**: Code is coupled to specific interfaces
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Adapter Pattern â‰  Facade (adapter pattern adapts interfaces, facade simplifies interfaces)
- Adapter Pattern â‰  Decorator (adapter pattern adapts, decorator adds behavior)
- Adapter Pattern is a **structural pattern**, not a behavioral pattern

## When to Apply

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When integration matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

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
| **Complexity** â€” Adapter pattern is complex |
| **Time** â€” Adapter pattern takes time |
| **Over-adapter** â€” Don't use adapter for everything |

## Common Misuses

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything adapter**: Not everything needs adapter pattern
- **Confusing with facade**: Adapter pattern â‰  facade
- **Over-adapter**: Too many adapters create complexity

## Related Concepts

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Adapter pattern with DDD
- [Facade Pattern](Architecture/facade-pattern.md) â€” Adapter pattern with facade
- [Decorator Pattern](Architecture/decorator-pattern.md) â€” Adapter pattern with decorator

## Project Observations

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses adapter pattern:
  - The project's architecture patterns note covers adapter pattern (from existing notes)
  - No evidence of adapter pattern in existing code (src/ is empty)
- File naming conventions support adapter pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a007-adapter-pattern

## title
Adapter Pattern

## aliases
- A007-adapter-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




