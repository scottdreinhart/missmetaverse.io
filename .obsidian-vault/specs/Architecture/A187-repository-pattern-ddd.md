---
slug: repository-pattern-ddd
sources:
  - https://martinfowler.com/eaaDev/repository.html
  - https://en.wikipedia.org/wiki/Repository_pattern
date: 2026-11-02
tags:
  - repository-pattern
  - ddd
  - data-access
  - patterns
# Repository Pattern (DDD)

## Definition

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Repository Pattern is a **design pattern that provides an abstraction over data access, mediating between domain and data mapping layers**.

> "A Repository mediates between the domain and data mapping layers, acting like an in-memory collection of domain objects." â€” Martin Fowler

## Problem Addressed

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without repository pattern:
- **Coupling**: Domain is coupled to data access
- **Testing**: Hard to test domain logic
- **Maintenance**: Hard to maintain data access code
- **Flexibility**: Hard to change data access

## Scope and Boundaries

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Repository Pattern â‰  Data Mapper (repository pattern is an abstraction, data mapper is a specific pattern)
- Repository Pattern â‰  Unit of Work (repository pattern is for data access, unit of work is for transactions)
- Repository Pattern is a **design pattern**, not a data access pattern

## When to Apply

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- When testing matters
- When maintenance is important
- When flexibility is important

## Tradeoffs and When to Avoid

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Repository pattern is complex |
| **Time** â€” Repository pattern takes time |
| **Over-repository** â€” Don't use repository for everything |

## Common Misuses

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything repository**: Not everything needs repository pattern
- **Confusing with data mapper**: Repository pattern â‰  data mapper
- **Over-repository**: Too many repositories create complexity

## Related Concepts

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Repository pattern with DDD
- [Data Mapper](Architecture/data-mapper.md) â€” Repository pattern with data mapper
- [Unit of Work](Architecture/unit-of-work.md) â€” Repository pattern with unit of work

## Project Observations

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses repository pattern:
  - The project's architecture patterns note covers repository pattern (from existing notes)
  - No evidence of repository pattern in existing code (src/ is empty)
- File naming conventions support repository pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a187-repository-pattern-ddd

## title
Repository Pattern (DDD)

## aliases
- A187-repository-pattern-ddd

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




