---
slug: factory-pattern
tags:
  - design-patterns   - patterns   - reusable-solutions
---

# Factory Pattern

> **Purpose:** Abstract object creation with Factory Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`factory-pattern`

## title
Factory Pattern

## aliases
- Factory
- Factory Method
- Object Factory
- Creator Pattern

## category
design-patterns

## concept_type
creational-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Object creation abstraction
- Polymorphic creation
- Dependency injection
- Testing mocks

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- factory-pattern
- abstract-factory-pattern
- builder-pattern
- dependency-injection

## Definition

Factory Pattern defines an interface for creating objects, but lets subclasses alter the type of objects that will be created, providing abstraction over object instantiation.

## Problem Addressed

Without Factory:
- Object creation is scattered
- Dependencies are hardcoded
- Testing is difficult
- Polymorphism is limited

## Scope of Boundaries

Factory applies to:
- Object creation abstraction
- Polymorphic creation
- Dependency injection
- Testing mocks

Factory does not apply to:
- Object structure
- Object behavior
- Data access
- Event handling

## When to Apply

- Needing object creation abstraction
- Wanting polymorphic creation
- Needing dependency injection
- Wanting testability

## Tradeoffs and When to Avoid

- **Complexity**: Factory adds complexity
- **Not for simple apps**: Simple apps don't need Factory
- **Not for fixed types**: Fixed types don't need Factory
- **Not for performance**: Factory may add overhead

## Implementation Guidance

1. **Define interface**: Define product interface
2. **Implement products**: Implement concrete products
3. **Create factory**: Create factory class
4. **Use factory**: Use factory for creation
5. **Test creation**: Test object creation

## Verification

- [ ] Interface defined
- [ ] Products implemented
- [ ] Factory created
- [ ] Factory used
- [ ] Creation tested

## Common Misuses

- **Over-engineering**: Using Factory for simple cases
- **Not using DI**: Not using dependency injection
- **Not testing**: Not testing creation
- **Too many factories**: Creating too many factory classes

## Related Concepts

- [[Design Patterns/factory-pattern]] â€” Factory Pattern
- [[Architecture/abstract-factory-pattern]] â€” Abstract Factory Pattern
- [[Design Patterns/builder-pattern]] â€” Builder Pattern
- [[Architecture/dependency-injection]] â€” Dependency Injection

## Project Observations

The project uses Factory Pattern through:
- Factory classes for object creation
- Polymorphic creation interfaces
- Dependency injection containers
- Test mock factories

## Sources

- [[Sources/gof-design-patterns|GoF Design Patterns]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Factory Pattern Note**
