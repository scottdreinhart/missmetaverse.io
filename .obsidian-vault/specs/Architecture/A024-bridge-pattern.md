---
slug: bridge-pattern
sources:
  - https://en.wikipedia.org/wiki/Bridge_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - bridge-pattern
  - structural-patterns
  - patterns
  - design-patterns
# Bridge Pattern

## Definition

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Bridge Pattern is a **structural design pattern that decouples an abstraction from its implementation so they can vary independently**.

> "The Bridge pattern decouples an abstraction from its implementation so that the two can vary independently." â€” GoF

## Problem Addressed

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without bridge pattern:
- **Coupling**: Abstraction is coupled to implementation
- **Inflexibility**: Can't vary abstraction and implementation independently
- **Testing**: Hard to test abstraction
- **Maintenance**: Hard to maintain abstraction

## Scope and Boundaries

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Bridge Pattern â‰  Adapter (bridge pattern decouples, adapter pattern adapts)
- Bridge Pattern â‰  Facade (bridge pattern decouples, facade pattern simplifies)
- Bridge Pattern is a **structural pattern**, not a behavioral pattern

## When to Apply

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When decoupling matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

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
| **Complexity** â€” Bridge pattern is complex |
| **Time** â€” Bridge pattern takes time |
| **Over-bridge** â€” Don't use bridge for everything |

## Common Misuses

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything bridge**: Not everything needs bridge pattern
- **Confusing with adapter**: Bridge pattern â‰  adapter
- **Over-bridge**: Too many bridges create complexity

## Related Concepts

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Bridge pattern with DDD
- [Adapter Pattern](Architecture/adapter-pattern.md) â€” Bridge pattern with adapter
- [Facade Pattern](Architecture/facade-pattern.md) â€” Bridge pattern with facade

## Project Observations

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses bridge pattern:
  - The project's architecture patterns note covers bridge pattern (from existing notes)
  - No evidence of bridge pattern in existing code (src/ is empty)
- File naming conventions support bridge pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a024-bridge-pattern

## title
Bridge Pattern

## aliases
- A024-bridge-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




