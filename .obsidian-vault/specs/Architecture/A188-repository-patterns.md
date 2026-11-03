---
slug: repository-pattern-patterns
sources:
  - https://martinfowler.com/eaaDatasource.html
  - https://en.wikipedia.org/wiki/Repository_pattern
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - domain/frontend
  - status/complete
  - type/reference
  - domain/architecture
  - repository-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Repository Pattern Patterns

## Definition

Repository Pattern Patterns are **design patterns for working with repository architecture**.

> "The Repository pattern mediates between the domain and data mapping layers, providing a collection-like interface for accessing domain objects." — Martin Fowler

## Problem Addressed

Without repository pattern patterns:
- **Complexity**: Data access is complex and hard to test
- **Coupling**: Domain is coupled to data access
- **Testing**: Hard to test domain logic
- **Maintenance**: Hard to maintain data access

## Scope and Boundaries

- Repository Pattern Patterns ≠ Repository Pattern (repository pattern patterns are patterns, repository pattern is a behavioral pattern)
- Repository Pattern Patterns = Specification (repository pattern patterns are patterns, specification is a behavioral pattern)
- Repository Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when data access matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Repository pattern patterns are complex |
| **Time** — Repository pattern patterns take time |
| **Over-repository-pattern** — Don't use repository pattern for everything |

## Common Misuses

- **Everything repository pattern**: Not everything needs repository pattern patterns
- **Confusing with specification**: Repository pattern patterns ≠ specification
- **Over-repository-pattern**: Too many repository patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Repository pattern patterns with DDD
- [Specification Pattern](Architecture/specification-pattern-patterns.md) — Repository pattern patterns with specification
- [Memento Pattern](Architecture/memento-pattern-patterns.md) — Repository pattern patterns with memento

## Project Observations

- The project uses repository pattern patterns:
  - The project's architecture patterns note covers repository pattern patterns (from existing notes)
  - No evidence of repository pattern patterns in existing code (src/ is empty)
- File naming conventions support repository pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




