---
slug: clean-architecture
tags:
  - architecture-design-patterns

  - architecture-design-patterns-core-concepts
---

# Clean Architecture

> **Purpose:** Architecture pattern that separates concerns into concentric circles.
> **Last Updated:** 2026-11-03

## concept_id
`arch-clean-architecture`

## title
Clean Architecture

## aliases
- Clean Architecture
- Dependency Rule Architecture
- Robert C. Martin Architecture

## category
application-architecture

## concept_type
architectural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Enterprise applications
- Complex business domains
- Systems requiring testability
- Applications needing technology independence

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-hexagonal-architecture
- arch-onion-architecture
- arch-domain-driven-design
- arch-dependency-inversion
- arch-entity-file-convention
- arch-use-case-file-convention

## Definition

Clean Architecture is an architectural pattern that organizes software into concentric circles, with the business rules at the center and external details on the outside. The key principle is the **Dependency Rule**: source code dependencies can only point inward, toward the business rules.

The layers are:
1. **Entities**: Enterprise business rules
2. **Use Case Interfaces**: Application business rules
3. **Interface Adapters**: Controllers, presenters, gateways
4. **Frameworks and Drivers**: Database, Web Framework, UI

## Problem Addressed

Without clean architecture:
- Business logic is coupled to frameworks and databases
- Testing requires external dependencies
- Changing technology requires refactoring business logic
- The application is difficult to maintain and extend

## Scope and Boundaries

Clean architecture applies to:
- Application architecture design
- Separation of concerns between business rules and details
- Testability through dependency inversion

Clean architecture does not directly address:
- UI implementation details
- Database schema design
- Deployment strategies
- Performance optimization

## When to Apply

- The business logic is complex and valuable
- The application needs to be easily testable
- The application may need to change technology over time
- Multiple teams are working on the same codebase

## Tradeoffs and When to Avoid

- **Over-engineering risk**: Simple applications don't need clean architecture
- **Learning curve**: Requires understanding of dependency inversion
- **Boilerplate**: Creating layers adds code
- **Not for CRUD apps**: Simple applications don't benefit

## Implementation Guidance

1. **Identify entities**: Extract enterprise business rules
2. **Define use cases**: Create application business rules
3. **Create interface adapters**: Build controllers, presenters, gateways
4. **Wire dependencies**: Use dependency injection to connect layers
5. **Enforce dependency rule**: Ensure dependencies point inward

## Verification

- [ ] Business rules are independent of frameworks
- [ ] Dependencies point inward
- [ ] Entities can be tested in isolation
- [ ] Use cases are independent of external details
- [ ] Interface adapters adapt external data to internal format

## Common Misuses

- **Confusing with hexagonal architecture**: Clean architecture is about dependency rule, not ports and adapters
- **Creating too many layers**: Not every concern needs its own layer
- **Ignoring dependency rule**: Dependencies must point inward
- **Over-splitting**: Creating too many files for simple concerns

## Related Concepts

- [[Application Architecture/hexagonal-architecture]] â€” Hexagonal Architecture
- [[Application Architecture/onion-architecture]] â€” Onion Architecture
- [[Application Architecture/domain-driven-design]] â€” Domain-Driven Design
- [[Architecture/dependency-inversion-principle]] â€” Dependency Inversion Principle

## Project Observations

The project uses TypeScript, which supports clean architecture through:
- Layered folder structure
- Type definitions for interfaces
- Dependency injection for wiring
- Strict typing for type safety

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Clean Architecture Note**
