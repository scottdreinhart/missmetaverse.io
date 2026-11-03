---
slug: law-of-demeter
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# Law of Demeter

> **Purpose:** Only talk to your immediate friends.
> **Last Updated:** 2026-11-03

## concept_id
`arch-law-of-demeter`

## title
Law of Demeter

## aliases
- LoD
- Law of Demeter
- Principle of Least Knowledge
- Don't Talk to Strangers

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Method design
- API design
- Object interaction
- Module design

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/medium

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-solid-principles
- arch-low-coupling
- arch-high-cohesion
- arch-separation-of-concerns
- arch-tell-dont-ask

## Definition

The Law of Demeter states that a method should only call methods on:
1. Itself
2. Its parameters
3. Objects it creates
4. Its direct component objects

It should not call methods on objects returned by other methods (chaining).

## Problem Addressed

Without Law of Demeter:
- Tight coupling between modules
- Changes propagate through the system
- Code is hard to maintain
- Testing is difficult

## Scope and Boundaries

Law of Demeter applies to:
- Method design
- API design
- Object interaction
- Module design

Law of Demeter does not apply to:
- Fluent interfaces (intentional chaining)
- Query methods (intentional navigation)
- Component hierarchies

## When to Apply

- Designing methods
- Creating APIs
- Refactoring chained calls
- Reducing coupling

## Tradeoffs and When to Avoid

- **Fluent interfaces**: Intentional chaining is acceptable
- **Query methods**: Navigation for queries is acceptable
- **Component hierarchies**: Navigating component trees is acceptable
- **Over-restriction**: Not all chaining is bad

## Implementation Guidance

1. **Limit method calls**: Only call methods on direct dependencies
2. **Use delegates**: Delegate to direct dependencies
3. **Avoid chaining**: Break chained calls into steps
4. **Use intermediaries**: Use intermediaries for complex navigation
5. **Document exceptions**: Document when chaining is intentional

## Verification

- [ ] Methods only call methods on direct dependencies
- [ ] Chained calls are minimized
- [ ] Delegates are used for complex navigation
- [ ] Exceptions are documented

## Common Misuses

- **Ignoring fluent interfaces**: Fluent interfaces are intentional chaining
- **Ignoring query methods**: Navigation for queries is acceptable
- **Over-restriction**: Not all chaining is bad
- **Not documenting**: Not documenting when chaining is intentional

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/low-coupling]] â€” Low Coupling
- [[Architecture/high-cohesion]] â€” High Cohesion
- [[Architecture/separation-of-concerns]] â€” Separation of Concerns

## Project Observations

The project follows Law of Demeter through:
- Method delegation
- Interface-based design
- Dependency injection
- Fluent interfaces (intentional chaining)

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Law of Demeter Note**
