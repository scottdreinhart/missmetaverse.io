---
slug: repository-pattern
tags:
  - core-concepts

  - design-patterns   - patterns   - reusable-solutions
---

# Repository Pattern

> **Purpose:** Abstract data access with Repository Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`repository-pattern`

## title
Repository Pattern

## aliases
- Repository
- Data Access Object
- DAO Pattern
- Persistence Abstraction

## category
design-patterns

## concept_type
structural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Data access abstraction
- Domain model protection
- Testability
- Multiple data sources

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- eip-hohpe-woolf
- martinfowler-patterns

## related_concept_ids
- data-access-object
- unit-of-work
- specification-pattern
- collection-abstraction

## Definition

Repository Pattern provides an abstraction over data access, presenting a collection-like interface for domain objects while protecting the domain from data access infrastructure details.

## Problem Addressed

Without Repository:
- Data access is scattered
- Domain is coupled to infrastructure
- Testing is difficult
- Multiple data sources are complex

## Scope of Boundaries

Repository applies to:
- Data access abstraction
- Domain model protection
- Testability
- Multiple data sources

Repository does not apply to:
- Business logic
- UI rendering
- State management
- Event handling

## When to Apply

- Needing data access abstraction
- Wanting to protect domain
- Needing testability
- Using multiple data sources

## Tradeoffs and When to Avoid

- **Complexity**: Repository adds complexity
- **Not for simple apps**: Simple apps don't need Repository
- **Not for ORM**: ORM already provides abstraction
- **Not for performance**: Repository may add overhead

## Implementation Guidance

1. **Define interface**: Define repository interface
2. **Implement repository**: Implement repository for data source
3. **Use in domain**: Use repository in domain logic
4. **Mock for tests**: Mock repository for testing
5. **Handle errors**: Handle data access errors

## Verification

- [ ] Interface defined
- [ ] Repository implemented
- [ ] Domain uses repository
- [ ] Tests use mocks
- [ ] Errors handled

## Common Misuses

- **Anemic domain**: Using Repository with anemic domain
- **Too many repositories**: Creating too many repository interfaces
- **Not mocking**: Not mocking repository for tests
- **Leaking infrastructure**: Leaking data access details to domain

## Related Concepts

- [[Design Patterns/data-access-object]] â€” Data Access Object
- [[Design Patterns/unit-of-work]] â€” Unit of Work
- [[Design Patterns/specification-pattern]] â€” Specification Pattern
- [[Design Patterns/collection-abstraction]] â€” Collection Abstraction

## Project Observations

The project uses Repository Pattern through:
- Repository interfaces for data access
- Domain models protected from infrastructure
- Mocked repositories for testing
- Multiple data source support

## Sources

- [[Sources/eip-hohpe-woolf|Enterprise Integration Patterns â€” Hohpe & Woolf]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Repository Pattern Note**
