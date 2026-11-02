---
slug: composition-root
sources:
  - https://blog.ploeh.dk/2011/07/28/CompositionRoot/
  - https://en.wikipedia.org/wiki/Dependency_injection
date: 2026-11-02
tags:
  - composition-root
  - dependency-injection
  - architecture
  - patterns
---

# Composition Root

## Definition

Composition Root is a **location where dependencies are assembled and injected into components**.

> "A composition root is a place in an application where modules are composed together." — Mark Seemann

## Problem Addressed

Without composition root:
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code
- **Flexibility**: Hard to change dependencies

## Scope and Boundaries

- Composition Root ≠ Dependency Injection (composition root is a location, dependency injection is a pattern)
- Composition Root ≠ Dependency Injection Container (composition root is a location, container is a tool)
- Composition Root is a **location**, not a pattern

## When to Apply

- When building applications
- When dependency injection matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Composition root is complex |
| **Time** — Composition root takes time |
| **Over-composition** — Don't compose everything |

## Common Misuses

- **Everything composed**: Not everything needs composition root
- **Confusing with dependency injection**: Composition root ≠ dependency injection
- **Over-composition**: Too much composition creates complexity

## Related Concepts

- [Dependency Injection](Architecture/dependency-injection.md) — Composition root with DI
- [Clean Architecture](Architecture/clean-architecture.md) — Composition root with clean architecture
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Composition root with SoC

## Project Observations

- The project uses composition root:
  - The project's architecture patterns note covers composition root (from existing notes)
  - No evidence of composition root in existing code (src/ is empty)
- File naming conventions support composition root:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
