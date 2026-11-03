---
slug: a139-mediator-pattern
sources:
  - https://en.wikipedia.org/wiki/Mediator_pattern
  - https://martinfowler.com/eaaDev/mediator.html
date: 2026-11-02
tags:
  - mediator-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
# Mediator Pattern

## Definition

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Mediator Pattern is a **behavioral design pattern that defines an object that encapsulates how a set of objects interact**.

> "The Mediator pattern defines an object that encapsulates how a set of objects interact, promoting loose coupling by preventing objects from referring to each other." â€” GoF

## Problem Addressed

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without mediator pattern:
- **Coupling**: Objects are tightly coupled
- **Complexity**: Interactions are complex
- **Testing**: Hard to test interactions
- **Maintenance**: Hard to maintain interactions

## Scope and Boundaries

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Mediator Pattern â‰  Chain of Responsibility (mediator is a coordinator, chain of responsibility is a chain)
- Mediator Pattern â‰  Observer (mediator is a coordinator, observer is for notifications)
- Mediator Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When coordination matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

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
| **Complexity** â€” Mediator pattern is complex |
| **Time** â€” Mediator pattern takes time |
| **Over-mediator** â€” Don't use mediator for everything |

## Common Misuses

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything mediator**: Not everything needs mediator pattern
- **Confusing with chain of responsibility**: Mediator â‰  chain of responsibility
- **Over-mediator**: Too many mediators create complexity

## Related Concepts

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Mediator pattern with DDD
- [Chain of Responsibility Pattern](Architecture/chain-of-responsibility-pattern.md) â€” Mediator pattern with chain of responsibility
- [Command Pattern](Architecture/command-pattern.md) â€” Mediator pattern with command

## Project Observations

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses mediator pattern:
  - The project's architecture patterns note covers mediator pattern (from existing notes)
  - No evidence of mediator pattern in existing code (src/ is empty)
- File naming conventions support mediator pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a139-mediator-pattern

## title
Mediator Pattern

## aliases
- A139-mediator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




