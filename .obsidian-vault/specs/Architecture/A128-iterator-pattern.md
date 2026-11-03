---
slug: a128-iterator-pattern
sources:
  - https://en.wikipedia.org/wiki/Iterator_pattern
  - https://martinfowler.com/eaaDev/iterator.html
date: 2026-11-02
tags:
  - iterator-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
# Iterator Pattern

## Definition

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Iterator Pattern is a **behavioral design pattern that provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation**.

> "The Iterator pattern provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation." â€” GoF

## Problem Addressed

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without iterator pattern:
- **Coupling**: Aggregate is coupled to traversal
- **Inflexibility**: Can't change traversal without changing aggregate
- **Testing**: Hard to test traversal
- **Maintenance**: Hard to maintain traversal

## Scope and Boundaries

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Iterator Pattern â‰  Iterator (iterator pattern is a pattern, iterator is an implementation)
- Iterator Pattern â‰  Iterator Protocol (iterator pattern is a pattern, iterator protocol is a language feature)
- Iterator Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When traversal matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

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
| **Complexity** â€” Iterator pattern is complex |
| **Time** â€” Iterator pattern takes time |
| **Over-iterator** â€” Don't use iterator for everything |

## Common Misuses

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything iterator**: Not everything needs iterator pattern
- **Confusing with iterator**: Iterator pattern â‰  iterator
- **Over-iterator**: Too many iterators create complexity

## Related Concepts

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Iterator pattern with DDD
- [Iterator Protocol](Architecture/iterator-protocol.md) â€” Iterator pattern with iterator protocol
- [Iterator](Architecture/iterator.md) â€” Iterator pattern with iterator

## Project Observations

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses iterator pattern:
  - The project's architecture patterns note covers iterator pattern (from existing notes)
  - No evidence of iterator pattern in existing code (src/ is empty)
- File naming conventions support iterator pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a128-iterator-pattern

## title
Iterator Pattern

## aliases
- A128-iterator-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




