---
slug: low-coupling
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# Low Coupling

> **Purpose:** Minimize dependencies between modules.
> **Last Updated:** 2026-11-03

## concept_id
`arch-low-coupling`

## title
Low Coupling

## aliases
- Low Coupling
- Loose Coupling
- Coupling

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
- Architecture design
- API design
- Component design

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
- arch-high-cohesion
- arch-separation-of-concerns
- arch-dependency-inversion
- arch-composition-over-inheritance

## Definition

Low Coupling is a design principle where dependencies between modules are minimized. Modules should be independent and interact through well-defined interfaces.

## Problem Addressed

Without low coupling:
- Changes in one module affect others
- Testing requires mocking many dependencies
- Reuse is difficult
- Maintenance becomes error-prone

## Scope and Boundaries

Low coupling applies to:
- Module design
- Architecture design
- API design
- Component design

Low coupling does not address:
- Cohesion within modules
- Implementation details
- Performance

## When to Apply

- Designing system architecture
- Creating modules and components
- Defining APIs
- Refactoring tightly coupled code

## Tradeoffs and When to Avoid

- **Over-decoupling**: Too many abstractions increase complexity
- **Communication overhead**: Decoupled modules need interfaces
- **Not for simple code**: Simple code doesn't need low coupling
- **Not for prototypes**: Prototypes don't need low coupling

## Implementation Guidance

1. **Use interfaces**: Define interfaces for dependencies
2. **Inject dependencies**: Use dependency injection
3. **Minimize dependencies**: Reduce number of dependencies
4. **Use events**: Decouple modules through events
5. **Enforce boundaries**: Prevent cross-boundary dependencies

## Verification

- [ ] Dependencies are minimized
- [ ] Interfaces define communication
- [ ] Modules are independent
- [ ] Boundaries are enforced

## Common Misuses

- **Over-decoupling**: Too many abstractions
- **Ignoring cohesion**: Low coupling with low cohesion is bad
- **Not using interfaces**: Direct dependencies instead of interfaces
- **Violating boundaries**: Allowing cross-boundary dependencies

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/high-cohesion]] â€” High Cohesion
- [[Architecture/separation-of-concerns]] â€” Separation of Concerns
- [[Architecture/dependency-inversion-principle]] â€” Dependency Inversion Principle

## Project Observations

The project follows low coupling through:
- Interface-based design
- Dependency injection
- Event-driven communication
- Clear API boundaries

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994.md|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Low Coupling Note**
