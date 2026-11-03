# Hexagonal Architecture

> **Purpose:** Architecture pattern that separates core domain from external concerns.
> **Last Updated:** 2026-11-03

---

## concept_id
`arch-hexagonal-architecture`

## title
Hexagonal Architecture

## aliases
- Ports and Adapters
- Hexagonal Architecture
- Layered Architecture (alternative name)

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
- Systems with multiple external interfaces
- Applications requiring testability
- Systems needing technology independence

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- harel-statecharts

## related_concept_ids
- arch-clean-architecture
- arch-onion-architecture
- arch-domain-driven-design
- arch-dependency-injection
- ddd-repository
- arch-port-file-convention

---

## Definition

Hexagonal Architecture (also known as Ports and Adapters) is an architectural pattern that separates the core domain logic from external concerns (databases, UI, APIs) by defining clear boundaries and adaptation layers.

The architecture consists of:
1. **Domain Core**: The heart of the application containing business logic
2. **Ports**: Interfaces that define how the domain interacts with the outside
3. **Adapters**: Implementations that connect ports to external systems

## Problem Addressed

Without hexagonal architecture:
- Business logic is coupled to infrastructure
- Testing requires external dependencies
- Changing technology requires refactoring domain logic
- The application is difficult to maintain and extend

## Scope and Boundaries

Hexagonal architecture applies to:
- Application architecture design
- Separation of concerns between domain and infrastructure
- Testability through dependency inversion

Hexagonal architecture does not directly address:
- UI implementation details
- Database schema design
- Deployment strategies
- Performance optimization

## When to Apply

- The domain logic is complex and valuable
- The application needs to be easily testable
- The application may need to integrate with multiple external systems
- The technology stack may change over time

## Tradeoffs and When to Avoid

- **Over-engineering risk**: Simple applications don't need hexagonal architecture
- **Learning curve**: Requires understanding of ports, adapters, and dependency inversion
- **Boilerplate**: Creating ports and adapters adds code
- **Not for CRUD apps**: Simple applications don't benefit

## Implementation Guidance

1. **Identify the domain core**: Extract business logic into a separate layer
2. **Define ports**: Create interfaces for external concerns (repositories, services)
3. **Create adapters**: Implement ports for specific technologies (SQL, REST, gRPC)
4. **Wire dependencies**: Use dependency injection to connect adapters to ports
5. **Keep domain pure**: The domain core should have no external dependencies

## Verification

- [ ] Domain core has no external dependencies
- [ ] Ports are defined as interfaces
- [ ] Adapters implement ports
- [ ] Dependencies flow inward (from adapters to domain)
- [ ] Domain can be tested without external dependencies

## Common Misuses

- **Confusing with layered architecture**: Hexagonal is about ports and adapters, not just layers
- **Creating too many ports**: Not every external interaction needs a port
- **Putting infrastructure in domain**: Domain should remain pure
- **Ignoring adapter testing**: Adapters should be tested separately

## Related Concepts

- [[Architecture/clean-architecture]] — Clean Architecture
- [[Architecture/onion-architecture]] — Onion Architecture
- [[Architecture/domain-driven-design]] — Domain-Driven Design
- [[Architecture/dependency-injection]] — Dependency Injection
- [[DDD/repository]] — Repository Pattern

## Project Observations

The project uses TypeScript, which supports hexagonal architecture through:
- Interfaces for ports (`*.port.ts` files)
- Implementations for adapters (`*.adapter.ts` files)
- Dependency injection for wiring
- Strict typing for type safety

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/harel-statecharts|David Harel — Statecharts: A Visual Formalism for Complex Systems]]

---

**End of Hexagonal Architecture Note**
