# Onion Architecture

> **Purpose:** Architecture pattern with concentric layers.
> **Last Updated:** 2026-11-03

---

## concept_id
`arch-onion-architecture`

## title
Onion Architecture

## aliases
- Onion Architecture
- Concentric Layers Architecture
- Layers Architecture

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
- arch-clean-architecture
- arch-hexagonal-architecture
- arch-domain-driven-design
- arch-dependency-inversion
- arch-entity-file-convention

---

## Definition

Onion Architecture is an architectural pattern that organizes software into concentric layers, with the core domain at the center and external details on the outside. Dependencies point inward.

## Problem Addressed

Without onion architecture:
- Business logic is coupled to infrastructure
- Testing requires external dependencies
- Changing technology requires refactoring business logic
- The application is difficult to maintain and extend

## Scope and Boundaries

Onion architecture applies to:
- Application architecture design
- Separation of concerns between domain and infrastructure
- Testability through dependency inversion

Onion architecture does not directly address:
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

- **Over-engineering risk**: Simple applications don't need onion architecture
- **Learning curve**: Requires understanding of dependency inversion
- **Boilerplate**: Creating layers adds code
- **Not for CRUD apps**: Simple applications don't benefit

## Implementation Guidance

1. **Define core**: Create the innermost layer with domain entities
2. **Define use cases**: Create the next layer with application logic
3. **Define interfaces**: Create interface adapters
4. **Define external**: Create the outermost layer with infrastructure
5. **Enforce direction**: Ensure dependencies point inward

## Verification

- [ ] Core layer has no dependencies
- [ ] Use cases depend only on core
- [ ] Interface adapters depend on use cases
- [ ] External layer depends on interface adapters
- [ ] Dependencies point inward

## Common Misuses

- **Confusing with clean architecture**: Onion is about layers, clean is about dependency rule
- **Creating too many layers**: Not every concern needs its own layer
- **Ignoring dependency direction**: Dependencies must point inward
- **Over-splitting**: Creating too many files for simple concerns

## Related Concepts

- [[Architecture/clean-architecture]] — Clean Architecture
- [[Architecture/hexagonal-architecture]] — Hexagonal Architecture
- [[Architecture/domain-driven-design]] — Domain-Driven Design
- [[Architecture/dependency-inversion-principle]] — Dependency Inversion Principle

## Project Observations

The project uses TypeScript, which supports onion architecture through:
- Layered folder structure
- Type definitions for interfaces
- Dependency injection for wiring
- Strict typing for type safety

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of Onion Architecture Note**
