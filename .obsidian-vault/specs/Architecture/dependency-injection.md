---
slug: dependency-injection
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# Dependency Injection

> **Purpose:** Provide dependencies from outside rather than creating them internally.
> **Last Updated:** 2026-11-03

## concept_id
`arch-dependency-injection`

## title
Dependency Injection

## aliases
- DI
- Dependency Injection
- Inversion of Control

## category
application-architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Any application architecture
- Testing and mocking
- Loose coupling
- Configuration management

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-dependency-inversion
- arch-composition-root
- arch-hexagonal-architecture
- arch-clean-architecture
- ddd-repository

## Definition

Dependency Injection is a design pattern where dependencies are provided to a component from outside, rather than the component creating them internally. This inverts the flow of control and enables loose coupling.

## Problem Addressed

Without dependency injection:
- Components create their own dependencies
- Testing requires mocking complex dependencies
- Components are tightly coupled
- Configuration is scattered

## Scope and Boundaries

DI applies to:
- Component initialization
- Configuration management
- Testing and mocking
- Loose coupling

DI does not apply to:
- Value objects (no dependencies)
- Static utilities
- Simple factories

## When to Apply

- Components have multiple dependencies
- Testing requires mocking
- Configuration needs to be centralized
- Loose coupling is desired

## Tradeoffs and When to Avoid

- **Complexity**: DI containers can be complex
- **Hidden dependencies**: Dependencies are not visible in code
- **Not for simple cases**: Simple components don't need DI
- **Debugging**: Stack traces can be longer

## Implementation Guidance

1. **Define interfaces**: Create abstractions for dependencies
2. **Inject via constructor**: Pass dependencies through constructor
3. **Use DI container**: Optional, for complex applications
4. **Wire at composition root**: Configure dependencies in one place
5. **Avoid service locator**: Use DI, not service locator pattern

## Verification

- [ ] Dependencies are injected, not created
- [ ] Interfaces are used for dependencies
- [ ] Composition root configures dependencies
- [ ] Components can be tested in isolation

## Common Misuses

- **Service locator**: Using service locator instead of DI
- **DI container everywhere**: Not needed for simple cases
- **Hidden dependencies**: Dependencies should be visible
- **Over-engineering**: Not every class needs DI

## Related Concepts

- [[Architecture/dependency-inversion-principle]] â€” Dependency Inversion Principle
- [[Application Architecture/composition-root]] â€” Composition Root
- [[Application Architecture/hexagonal-architecture]] â€” Hexagonal Architecture
- [[DDD/repository]] â€” Repository Pattern

## Project Observations

The project uses TypeScript, which supports DI through:
- Constructor injection
- Factory functions
- Dependency injection containers (optional)
- Mock objects for testing

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Dependency Injection Note**
