---
slug: value-object-file-convention
---

# Value Object File Convention

> **Purpose:** Define value objects in dedicated files.
> **Last Updated:** 2026-11-03

## concept_id
`project-value-object-file`

## title
*.value-object.ts File Convention

## aliases
- Value Object File Convention
- *.value-object.ts
- Value Object Class

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- Domain-driven design
- Value object modeling
- Immutable domain objects
- Project organization

## tags
- type/convention
- domain/ddd
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- goF-1994

## related_concept_ids
- project-entity-file
- project-view-file
- project-logic-file
- project-data-file
- ddd-value-object

## Definition

The *.value-object.ts file convention designates files that define value objects â€” immutable domain objects defined by their attributes, not identity.

## Problem Addressed

Without file conventions:
- Value objects are scattered
- Domain model is inconsistent
- Immutability is not enforced
- Architecture is inconsistent

## Scope and Boundaries

Value object files apply to:
- Value object definitions
- Immutable domain objects
- Objects defined by attributes
- Domain classes

Value object files do not apply to:
- Entities (objects with identity)
- DTOs
- UI components
- Business logic

## When to Apply

- Defining value objects
- Modeling immutable domain objects
- Building domain classes
- Implementing DDD

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every value needs value object file
- **Not for entities**: Entities should be in *.entity.ts files
- **Not for DTOs**: DTOs should be in *.data.ts files
- **Not for UI**: Value object files should not render UI

## Implementation Guidance

1. **Define value objects**: Define value object classes
2. **Make immutable**: Make value objects immutable
3. **Add validation**: Add validation in constructor
4. **Implement equality**: Implement equality by attributes
5. **Test value objects**: Test value object behavior

## Verification

- [ ] Value objects are defined
- [ ] Value objects are immutable
- [ ] Validation is added
- [ ] Equality is implemented
- [ ] Value objects are tested

## Common Misuses

- **Not defining value objects**: Not defining value object files
- **Not making immutable**: Not making value objects immutable
- **Not validating**: Not validating in constructor
- **Not testing**: Not testing value objects

## Related Concepts

- [[Project File Conventions/entity-file-convention]] â€” *.entity.ts File Convention
- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[DDD/value-object]] â€” Value Object

## Project Observations

The project follows value object file convention through:
- *.value-object.ts files for value objects
- *.entity.ts files for entities
- Domain-driven design
- Clear value object boundaries

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Value Object File Convention Note**
