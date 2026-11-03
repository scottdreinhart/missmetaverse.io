---
slug: iterator-pattern
tags:
  - design-patterns   - patterns   - reusable-solutions
---

# Iterator Pattern

> **Purpose:** Traverse collections with Iterator Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`iterator-pattern`

## title
Iterator Pattern

## aliases
- Iterator
- Cursor Pattern
- Iterator Design Pattern
- Collection Traversal

## category
design-patterns

## concept_type
behavioral-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Collection traversal
- Uniform access
- Multiple traversals
- Encapsulation hiding

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- iterator-pattern
- generator-pattern
- collection-abstraction
- enumerable-pattern

## Definition

Iterator Pattern provides a way to access the elements of a collection sequentially without exposing its underlying representation.

## Problem Addressed

Without Iterator:
- Traversal logic is scattered
- Collections are exposed
- Multiple traversals are complex
- Access is inconsistent

## Scope of Boundaries

Iterator applies to:
- Collection traversal
- Uniform access
- Multiple traversals
- Encapsulation hiding

Iterator does not apply to:
- Object creation
- Object structure
- Data access
- Algorithm selection

## When to Apply

- Needing collection traversal
- Wanting uniform access
- Needing multiple traversals
- Hiding collection details

## Tradeoffs and When to Avoid

- **Not for simple arrays**: Simple arrays don't need Iterator
- **Not for performance**: Iterator may add overhead
- **Not for random access**: Iterator is sequential only
- **Not for simple apps**: Simple apps don't need Iterator

## Implementation Guidance

1. **Define iterator interface**: Define iterator interface
2. **Implement iterator**: Implement concrete iterator
3. **Create aggregate**: Create aggregate interface
4. **Create iterator**: Create iterator for aggregate
5. **Traverse collection**: Traverse collection using iterator

## Verification

- [ ] Iterator interface defined
- [ ] Iterator implemented
- [ ] Aggregate created
- [ ] Iterator created
- [ ] Collection traversed

## Common Misuses

- **Over-engineering**: Using Iterator for simple arrays
- **Not testing**: Not testing traversal
- **Not encapsulating**: Not encapsulating collection details
- **Not supporting multiple**: Not supporting multiple traversals

## Related Concepts

- [[Design Patterns/iterator-pattern]] â€” Iterator Pattern
- [[Design Patterns/generator-pattern]] â€” Generator Pattern
- [[Design Patterns/collection-abstraction]] â€” Collection Abstraction
- [[Design Patterns/enumerable-pattern]] â€” Enumerable Pattern

## Project Observations

The project uses Iterator Pattern through:
- Collection traversal interfaces
- Uniform access patterns
- Multiple concurrent traversals
- Encapsulated collection details

## Sources

- [[Sources/gof-design-patterns|GoF Design Patterns]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Iterator Pattern Note**
