---
slug: specification-pattern
tags:
  - core-concepts

  - design-patterns   - patterns   - reusable-solutions
---

# Specification Pattern

> **Purpose:** Combine business rules with Specification Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`specification-pattern`

## title
Specification Pattern

## aliases
- Specification
- Predicate Pattern
- Specification Design Pattern
- Business Rule Pattern

## category
design-patterns

## concept_type
structural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Business rule composition
- Query composition
- Validation rules
- Criteria matching

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- eip-hohpe-woolf
- martinfowler-patterns

## related_concept_ids
- specification-pattern
- repository-pattern
- criteria-pattern
- predicate-pattern

## Definition

Specification Pattern encapsulates business rules or criteria and combines them to form arbitrary complex business rules, enabling composition and reuse.

## Problem Addressed

Without Specification:
- Business rules are scattered
- Queries are duplicated
- Validation is inconsistent
- Rules are not composable

## Scope of Boundaries

Specification applies to:
- Business rule composition
- Query composition
- Validation rules
- Criteria matching

Specification does not apply to:
- Object creation
- Object behavior
- Data access
- Event handling

## When to Apply

- Needing business rule composition
- Wanting query composition
- Needing validation rules
- Building criteria matchers

## Tradeoffs and When to Avoid

- **Complexity**: Specification adds complexity
- **Not for simple apps**: Simple apps don't need Specification
- **Not for fixed rules**: Fixed rules don't need Specification
- **Not for performance**: Specification may add overhead

## Implementation Guidance

1. **Define specification**: Define specification interface
2. **Implement specifications**: Implement concrete specifications
3. **Combine specifications**: Combine specifications with AND/OR
4. **Apply specification**: Apply specification to objects
5. **Test combinations**: Test specification combinations

## Verification

- [ ] Specification interface defined
- [ ] Specifications implemented
- [ ] Specifications combined
- [ ] Specification applied
- [ ] Combinations tested

## Common Misuses

- **Over-engineering**: Using Specification for simple rules
- **Not combining**: Not combining specifications
- **Not testing**: Not testing specification combinations
- **Too many specs**: Creating too many specification classes

## Related Concepts

- [[Design Patterns/specification-pattern]] â€” Specification Pattern
- [[Design Patterns/repository-pattern]] â€” Repository Pattern
- [[Design Patterns/specification-pattern]] â€” Criteria Pattern
- [[Design Patterns/specification-pattern]] â€” Predicate Pattern

## Project Observations

The project uses Specification Pattern through:
- Business rule composition
- Query criteria building
- Validation rule combination
- Reusable specification components

## Sources

- [[Sources/eip-hohpe-woolf|Enterprise Integration Patterns â€” Hohpe & Woolf]]
- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Specification Pattern Note**
