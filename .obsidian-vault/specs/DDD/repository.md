---
slug: repository
---

# Repository Pattern

> **Purpose:** Abstract data access behind a collection-like interface.
> **Last Updated:** 2026-11-03

## concept_id
`ddd-repository`

## title
Repository Pattern

## aliases
- Repository
- Repository Pattern
- Data Access Object (related)

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Domain modeling
- Data access abstraction
- Testing and mocking
- Multiple data sources

## tags
- type/pattern
- domain/ddd
- domain/architecture
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- evans-ddd-2003

## related_concept_ids
- ddd-aggregate
- ddd-entity
- ddd-value-object
- arch-hexagonal-architecture
- arch-clean-architecture
- arch-port-file-convention

## Definition

The Repository Pattern provides an abstraction over data access, presenting a collection-like interface for accessing domain objects. It separates domain logic from data access logic.

## Problem Addressed

Without repositories:
- Data access is scattered throughout the codebase
- Testing requires real database
- Domain logic is coupled to data access
- Changing data source requires refactoring

## Scope and Boundaries

Repositories apply to:
- Domain modeling
- Data access abstraction
- Testing and mocking
- Multiple data sources

Repositories do not apply to:
- Simple CRUD operations
- Read-only queries
- Reporting queries
- Analytics queries

## When to Apply

- Domain logic needs data access
- Testing requires mocking
- Multiple data sources are possible
- Domain logic should be independent of data access

## Tradeoffs and When to Avoid

- **Over-engineering**: Simple CRUD doesn't need repositories
- **Query complexity**: Complex queries may not fit repository pattern
- **Performance**: Repositories may add overhead
- **Not for reads**: Repositories are for writes

## Implementation Guidance

1. **Define interface**: Create repository interface
2. **Implement for data source**: Implement for specific data source
3. **Use in domain**: Use repository in domain logic
4. **Mock for testing**: Mock repository for testing
5. **Keep simple**: Keep repository interface simple

## Verification

- [ ] Repository interface is defined
- [ ] Implementation is separated from interface
- [ ] Domain logic uses repository
- [ ] Repository can be mocked
- [ ] Interface is simple

## Common Misuses

- **Anemic repository**: Repository with only CRUD methods
- **Query object**: Putting complex queries in repository
- **Not mocking**: Not mocking repository for testing
- **Over-engineering**: Not needed for simple CRUD

## Related Concepts

- [[DDD/aggregate-root]] â€” Aggregate
- [[DDD/entity]] â€” Entity
- [[DDD/value-object]] â€” Value Object
- [[Application Architecture/hexagonal-architecture]] â€” Hexagonal Architecture
- [[Architecture/clean-architecture]] â€” Clean Architecture

## Project Observations

The project uses TypeScript, which supports repositories through:
- Interface definitions
- Dependency injection
- Mock objects for testing
- Type-safe queries

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/evans-ddd-2003|Eric Evans â€” Domain-Driven Design: Tackling Complexity in the Heart of Software]]

**End of Repository Pattern Note**
