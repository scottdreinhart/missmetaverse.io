---
slug: repository-file-convention
tags:
  - core-concepts

  - conventions   - file-structure   - organization
---

# Repository File Convention

> **Purpose:** Implement repository pattern for data access.
> **Last Updated:** 2026-11-03

## concept_id
`project-repository-file`

## title
*.repository.ts File Convention

## aliases
- Repository File Convention
- *.repository.ts
- Repository Implementation

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- Domain-driven design
- Repository pattern
- Data access abstraction
- Project organization

## tags
- type/convention
- domain/ddd
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- goF-1994

## related_concept_ids
- project-port-file
- project-adapter-file
- project-view-file
- project-logic-file
- ddd-repository

## Definition

The *.repository.ts file convention designates files that implement the repository pattern â€” data access layers that provide collection-like interface for accessing domain objects.

## Problem Addressed

Without file conventions:
- Data access is scattered
- Repositories are inconsistent
- Testing is difficult
- Architecture is inconsistent

## Scope and Boundaries

Repository files apply to:
- Data access abstraction
- Repository pattern implementation
- Database operations
- Domain object persistence

Repository files do not apply to:
- Business logic
- UI rendering
- Domain logic
- State management

## When to Apply

- Implementing repository pattern
- Abstracting data access
- Building database layers
- Testing domain logic

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every data access needs repository
- **Not for logic**: Repository files should not contain business logic
- **Not for UI**: Repository files should not render UI
- **Not for domain**: Repository files should not contain domain logic

## Implementation Guidance

1. **Define interface**: Define repository interface
2. **Implement**: Implement repository for data source
3. **Use in domain**: Use repository in domain logic
4. **Mock for testing**: Mock repository for testing
5. **Keep simple**: Keep repository interface simple

## Verification

- [ ] Interface is defined
- [ ] Repository is implemented
- [ ] Repository is used in domain
- [ ] Repository can be mocked
- [ ] Interface is simple

## Common Misuses

- **Not defining interface**: Not defining repository interface
- **Not implementing**: Not implementing repository
- **Not mocking**: Not mocking repository for testing
- **Not keeping simple**: Not keeping interface simple

## Related Concepts

- [[Project File Conventions/port-file-convention]] â€” *.port.ts File Convention
- [[Project File Conventions/adapter-file-convention]] â€” *.adapter.ts File Convention
- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[DDD/repository]] â€” Repository Pattern

## Project Observations

The project follows repository file convention through:
- *.repository.ts files for data access
- *.port.ts files for interfaces
- Dependency injection
- Domain-driven design

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994.md|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Repository File Convention Note**
