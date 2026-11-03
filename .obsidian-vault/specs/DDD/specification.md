---
slug: specification
tags:
  - core-concepts

  - ddd   - domain-driven-design   - architecture
---

# Specification

> **Purpose:** Validate with Specification.
> **Last Updated:** 2026-11-03

## concept_id
`specification`

## title
Specification

## aliases
- Specification
- Specification Pattern
- Business Rule
- Validation Rule

## category
ddd

## concept_type
ddd-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Business rule validation
- Complex queries
- Composable rules
- Domain logic

## tags
- type/pattern
- domain/ddd
- status/verified
- priority/high

## source_ids
- evans-ddd
- martinfowler-patterns

## related_concept_ids
- specification
- specification-pattern
- business-rule
- validation-rule

## Definition

Specification is a DDD pattern that encapsulates business rules as composable objects that can be evaluated against domain objects.

## Problem Addressed

Without Specification:
- Rules are scattered
- Queries are complex
- Logic is duplicated
- Composition is difficult

## Scope of Boundaries

Specification applies to:
- Business rule validation
- Complex queries
- Composable rules
- Domain logic

Specification does not apply to:
- Infrastructure
- UI
- Database
- External systems

## When to Apply

- Building DDD apps
- Needing business rules
- Complex queries
- Composable logic

## Tradeoffs and When to Avoid

- **Complexity**: Specification adds complexity
- **Not for simple apps**: Simple apps don't need Specification
- **Not for internal**: Internal apps may not need Specification
- **Not for all**: Not all apps need Specification

## Implementation Guidance

1. **Identify rules**: Identify business rules
2. **Create specs**: Create specification objects
3. **Compose**: Compose specifications
4. **Evaluate**: Evaluate against objects
5. **Test**: Test specifications

## Verification

- [ ] Rules identified
- [ ] Specs created
- [ ] Specs composed
- [ ] Objects evaluated
- [ ] Specs tested

## Common Misuses

- **Not identifying**: Not identifying rules
- **Not creating**: Not creating specs
- **Not composing**: Not composing specs
- **Not evaluating**: Not evaluating objects

## Related Concepts

- [[DDD/specification]] â€” Specification
- [[Design Patterns/specification-pattern]] â€” Specification Pattern
- [[DDD/domain-invariant]] â€” Business Rule
- [[DDD/domain-invariant]] â€” Validation Rule

## Project Observations

The project uses Specification through:
- Rule identification
- Spec creation
- Spec composition
- Object evaluation

## Sources

- [[Sources/S002-evans-ddd-2003|Domain-Driven Design by Eric Evans]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Specification Note**
