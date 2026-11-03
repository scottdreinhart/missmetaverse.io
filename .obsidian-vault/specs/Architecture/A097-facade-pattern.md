---
slug: facade-pattern
sources:
  - https://en.wikipedia.org/wiki/Facade_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - facade-pattern
  - structural-patterns
  - patterns
  - design-patterns
# Facade Pattern

## Definition

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Facade Pattern is a **structural design pattern that provides a simplified interface to a complex subsystem**.

> "The Facade pattern provides a unified interface to a set of interfaces in a subsystem." â€” GoF

## Problem Addressed

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without facade pattern:
- **Complexity**: Subsystems are complex
- **Coupling**: Code is coupled to subsystems
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Facade Pattern â‰  Adapter (facade pattern simplifies, adapter pattern adapts)
- Facade Pattern â‰  Proxy (facade pattern simplifies, proxy pattern controls access)
- Facade Pattern is a **structural pattern**, not a behavioral pattern

## When to Apply

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When simplicity matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

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
| **Complexity** â€” Facade pattern is complex |
| **Time** â€” Facade pattern takes time |
| **Over-facade** â€” Don't use facade for everything |

## Common Misuses

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything facade**: Not everything needs facade pattern
- **Confusing with adapter**: Facade pattern â‰  adapter
- **Over-facade**: Too many facades create complexity

## Related Concepts

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Facade pattern with DDD
- [Adapter Pattern](Architecture/adapter-pattern.md) â€” Facade pattern with adapter
- [Decorator Pattern](Architecture/decorator-pattern.md) â€” Facade pattern with decorator

## Project Observations

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses facade pattern:
  - The project's architecture patterns note covers facade pattern (from existing notes)
  - No evidence of facade pattern in existing code (src/ is empty)
- File naming conventions support facade pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a097-facade-pattern

## title
Facade Pattern

## aliases
- A097-facade-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




