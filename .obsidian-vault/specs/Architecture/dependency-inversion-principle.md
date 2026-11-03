---
slug: dependency-inversion-principle
tags:
  - architecture   - design-patterns   - core-concepts
---

# Dependency Inversion Principle

> **Purpose:** Depend on abstractions, not concretions.
> **Last Updated:** 2026-11-03

## concept_id
`arch-dependency-inversion`

## title
Dependency Inversion Principle

## aliases
- DIP
- Dependency Inversion Principle
- Inversion of Control

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
- Module design
- Architecture design
- Testing

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
- arch-dependency-injection
- arch-low-coupling
- arch-high-cohesion
- arch-separation-of-concerns

## Definition

The Dependency Inversion Principle states that high-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions.

## Problem Addressed

Without DIP:
- High-level modules are coupled to low-level details
- Testing requires mocking low-level modules
- Changing low-level modules affects high-level modules
- Reuse is difficult

## Scope and Boundaries

DIP applies to:
- Class design
- Module design
- Architecture design
- Testing

DIP does not apply to:
- Value objects (no dependencies)
- Static utilities
- Simple factories
- Data structures

## When to Apply

- Designing high-level modules
- Creating abstractions
- Building testable code
- Refactoring tightly coupled code

## Tradeoffs and When to Avoid

- **Over-abstraction**: Creating too many abstractions
- **Hidden dependencies**: Dependencies are not visible in code
- **Not for simple cases**: Simple cases don't need DIP
- **Not for prototypes**: Prototypes don't need DIP

## Implementation Guidance

1. **Define abstractions**: Create interfaces or abstract classes
2. **Depend on abstractions**: High-level and low-level modules depend on abstractions
3. **Implement abstractions**: Low-level modules implement abstractions
4. **Inject dependencies**: Use dependency injection
5. **Enforce direction**: Ensure dependencies point to abstractions

## Verification

- [ ] High-level modules depend on abstractions
- [ ] Low-level modules depend on abstractions
- [ ] Abstractions do not depend on details
- [ ] Dependencies are injected

## Common Misuses

- **Over-abstraction**: Creating too many abstractions
- **Service locator**: Using service locator instead of DI
- **Hidden dependencies**: Dependencies are not visible
- **Not enforcing**: Not enforcing dependency direction

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/dependency-injection]] â€” Dependency Injection
- [[Architecture/low-coupling]] â€” Low Coupling
- [[Architecture/high-cohesion]] â€” High Cohesion

## Project Observations

The project uses TypeScript, which supports DIP through:
- Interfaces for abstractions
- Dependency injection
- Type system enforcement
- Strict typing

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Dependency Inversion Principle Note**
