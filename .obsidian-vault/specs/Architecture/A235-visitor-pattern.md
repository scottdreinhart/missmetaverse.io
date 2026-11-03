---
slug: visitor-pattern
sources:
  - https://en.wikipedia.org/wiki/Visitor_pattern
  - https://martinfowler.com/eaaDev/visitor.html
date: 2026-11-02
tags:
  - visitor-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
# Visitor Pattern

## Definition

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Visitor Pattern is a **behavioral design pattern that separates an algorithm from an object structure on which it operates**.

> "The Visitor pattern separates an algorithm from an object structure on which it operates, allowing new operations to be defined without changing the classes." â€” GoF

## Problem Addressed

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without visitor pattern:
- **Coupling**: Algorithm is coupled to object structure
- **Inflexibility**: Can't add new operations without changing classes
- **Testing**: Hard to test algorithm
- **Maintenance**: Hard to maintain algorithm

## Scope and Boundaries

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Visitor Pattern â‰  Visitor (visitor pattern is a pattern, visitor is an implementation)
- Visitor Pattern â‰  Visitor Protocol (visitor pattern is a pattern, visitor protocol is a language feature)
- Visitor Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When algorithms matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

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
| **Complexity** â€” Visitor pattern is complex |
| **Time** â€” Visitor pattern takes time |
| **Over-visitor** â€” Don't use visitor for everything |

## Common Misuses

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything visitor**: Not everything needs visitor pattern
- **Confusing with visitor**: Visitor pattern â‰  visitor
- **Over-visitor**: Too many visitors create complexity

## Related Concepts

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Visitor pattern with DDD
- [Visitor Protocol](Architecture/visitor-protocol.md) â€” Visitor pattern with visitor protocol
- [Visitor](Architecture/visitor.md) â€” Visitor pattern with visitor

## Project Observations

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses visitor pattern:
  - The project's architecture patterns note covers visitor pattern (from existing notes)
  - No evidence of visitor pattern in existing code (src/ is empty)
- File naming conventions support visitor pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a235-visitor-pattern

## title
Visitor Pattern

## aliases
- A235-visitor-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




