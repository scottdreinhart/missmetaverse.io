---
slug: entity-file-convention
tags:
  - conventions   - file-structure   - organization
---

# Entity File Convention

> **Purpose:** Define domain entities in dedicated files.
> **Last Updated:** 2026-11-03

## concept_id
`project-entity-file`

## title
*.entity.ts File Convention

## aliases
- Entity File Convention
- *.entity.ts
- Entity Class

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
- Entity modeling
- Domain classes
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
- project-value-object-file
- project-view-file
- project-logic-file
- project-data-file
- ddd-entity

## Definition

The *.entity.ts file convention designates files that define domain entities â€” objects with identity that change over time.

## Problem Addressed

Without file conventions:
- Entities are scattered
- Domain model is inconsistent
- Testing is difficult
- Architecture is inconsistent

## Scope and Boundaries

Entity files apply to:
- Domain entity definitions
- Objects with identity
- Objects with lifecycle
- Domain classes

Entity files do not apply to:
- Value objects
- DTOs
- UI components
- Business logic

## When to Apply

- Defining domain entities
- Modeling domain objects
- Building domain classes
- Implementing DDD

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every object needs entity file
- **Not for value objects**: Value objects should be in *.value-object.ts files
- **Not for DTOs**: DTOs should be in *.data.ts files
- **Not for UI**: Entity files should not render UI

## Implementation Guidance

1. **Define entities**: Define entity classes
2. **Add identity**: Add unique identity property
3. **Add behavior**: Add domain behavior
4. **Protect invariants**: Protect domain invariants
5. **Test entities**: Test entity behavior

## Verification

- [ ] Entities are defined
- [ ] Identity is added
- [ ] Behavior is added
- [ ] Invariants are protected
- [ ] Entities are tested

## Common Misuses

- **Not defining entities**: Not defining entity files
- **Not adding identity**: Not adding identity property
- **Not adding behavior**: Not adding domain behavior
- **Not testing**: Not testing entities

## Related Concepts

- [[Project File Conventions/value-object-file-convention]] â€” *.value-object.ts File Convention
- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[DDD/entity]] â€” Entity

## Project Observations

The project follows entity file convention through:
- *.entity.ts files for domain entities
- *.value-object.ts files for value objects
- Domain-driven design
- Clear entity boundaries

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Entity File Convention Note**
