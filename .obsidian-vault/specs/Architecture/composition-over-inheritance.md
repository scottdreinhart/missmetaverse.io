---
slug: composition-over-inheritance
---

# Composition over Inheritance

> **Purpose:** Prefer composition over inheritance for flexibility.
> **Last Updated:** 2026-11-03

## concept_id
`arch-composition-over-inheritance`

## title
Composition over Inheritance

## aliases
- Composition over Inheritance
- Favor Composition
- Composition Principle

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Class design
- Component design
- API design
- Domain modeling

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
- arch-open-closed
- arch-dependency-injection
- arch-low-coupling
- arch-high-cohesion

## Definition

Composition over Inheritance is a design principle that favors composing objects from smaller parts over creating deep inheritance hierarchies. Composition provides more flexibility and less coupling.

## Problem Addressed

Without composition over inheritance:
- Inheritance hierarchies become deep and rigid
- Code reuse is limited
- Changes affect many classes
- Testing is difficult

## Scope and Boundaries

Composition applies to:
- Class design
- Component design
- API design
- Domain modeling

Composition does not apply to:
- Type hierarchies (is-a relationships)
- Abstract base classes
- Interface implementations

## When to Apply

- Designing class hierarchies
- Building components
- Creating APIs
- Refactoring deep inheritance

## Tradeoffs and When to Avoid

- **More objects**: Composition creates more objects
- **Complexity**: Composition can be more complex than inheritance
- **Not for type hierarchies**: is-a relationships need inheritance
- **Not for simple cases**: Simple cases don't need composition

## Implementation Guidance

1. **Use composition**: Compose objects from smaller parts
2. **Prefer interfaces**: Use interfaces for behavior
3. **Inject dependencies**: Use dependency injection
4. **Avoid deep hierarchies**: Limit inheritance depth
5. **Use delegation**: Delegate behavior to composed objects

## Verification

- [ ] Composition is used over inheritance
- [ ] Inheritance depth is limited
- [ ] Dependencies are injected
- [ ] Behavior is delegated to composed objects

## Common Misuses

- **Using inheritance**: Using inheritance when composition is better
- **Deep hierarchies**: Creating deep inheritance chains
- **Ignoring type hierarchies**: Not using inheritance for is-a relationships
- **Over-composing**: Creating too many small objects

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/open-closed-principle]] â€” Open/Closed Principle
- [[Architecture/dependency-injection]] â€” Dependency Injection
- [[Architecture/low-coupling]] â€” Low Coupling

## Project Observations

The project follows composition over inheritance through:
- React component composition
- Custom hook composition
- Dependency injection
- Interface-based design

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Composition over Inheritance Note**
