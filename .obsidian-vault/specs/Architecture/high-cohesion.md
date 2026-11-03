---
slug: high-cohesion
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# High Cohesion

> **Purpose:** Keep related functionality together in modules.
> **Last Updated:** 2026-11-03

## concept_id
`arch-high-cohesion`

## title
High Cohesion

## aliases
- High Cohesion
- Cohesion
- Module Cohesion

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Module design
- Class design
- Package design
- API design

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-solid-principles
- arch-single-responsibility
- arch-separation-of-concerns
- arch-low-coupling
- arch-dry

## Definition

High Cohesion is a design principle where a module or class has a single, well-focused purpose. Related functionality is grouped together, and unrelated functionality is separated.

## Problem Addressed

Without high cohesion:
- Modules do too many things
- Changes affect unrelated functionality
- Testing is difficult
- Code is hard to understand

## Scope and Boundaries

High cohesion applies to:
- Module design
- Class design
- Package design
- API design

High cohesion does not address:
- Coupling between modules
- Implementation details
- Performance

## When to Apply

- Designing modules and classes
- Refactoring large modules
- Creating APIs
- Organizing codebases

## Tradeoffs and When to Avoid

- **Over-splitting**: Creating too many small modules
- **Navigation overhead**: Too many files can be hard to navigate
- **Not for simple code**: Simple code doesn't need high cohesion
- **Not for prototypes**: Prototypes don't need high cohesion

## Implementation Guidance

1. **Identify responsibilities**: List what each module does
2. **Group related functionality**: Put related code together
3. **Separate unrelated functionality**: Move unrelated code out
4. **Use clear naming**: Name modules after their purpose
5. **Review regularly**: Check cohesion during code reviews

## Verification

- [ ] Each module has a single purpose
- [ ] Related functionality is grouped together
- [ ] Unrelated functionality is separated
- [ ] Module names reflect their purpose

## Common Misuses

- **Over-splitting**: Creating too many small modules
- **Ignoring coupling**: High cohesion with high coupling is bad
- **Not reviewing**: Not checking cohesion during code reviews
- **Naming issues**: Module names don't reflect purpose

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/single-responsibility-principle]] â€” Single Responsibility Principle
- [[Architecture/separation-of-concerns]] â€” Separation of Concerns
- [[Architecture/low-coupling]] â€” Low Coupling

## Project Observations

The project follows high cohesion through:
- Focused modules
- Clear naming conventions
- Separate files for concerns
- Type definitions in dedicated files

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994.md|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of High Cohesion Note**
