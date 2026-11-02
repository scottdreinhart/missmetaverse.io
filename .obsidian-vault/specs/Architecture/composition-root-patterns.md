---
slug: composition-root-patterns
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

# Composition Root Patterns

## Definition

Composition Root Patterns are **design patterns for working with composition root**.

> "A composition root is a place in an application where modules are composed together." — Mark Seemann

## Problem Addressed

Without composition root patterns:
- **Coupling**: Components are tightly coupled
- **Testing**: Hard to test components
- **Maintenance**: Hard to maintain code
- **Flexibility**: Hard to change dependencies

## Scope and Boundaries

- Composition Root Patterns ≠ Composition Root (composition root patterns are patterns, composition root is a location)
- Composition Root Patterns ≠ Dependency Injection (composition root patterns are patterns, dependency injection is a pattern)
- Composition Root Patterns is a **patterns**, not a location

## When to Apply

- When building applications
- when dependency injection matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Composition root patterns are complex |
| **Time** — Composition root patterns take time |
| **Over-composition-root** — Don't use composition root for everything |

## Common Misuses

- **Everything composed**: Not everything needs composition root patterns
- **Confusing with dependency injection**: Composition root patterns ≠ dependency injection
- **Over-composition-root**: Too many composition roots create complexity

## Related Concepts

- [Dependency Injection](Architecture/dependency-injection.md) — Composition root patterns with DI
- [Clean Architecture](Architecture/clean-architecture.md) — Composition root patterns with clean architecture
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Composition root patterns with SoC

## Project Observations

- The project uses composition root patterns:
  - The project's architecture patterns note covers composition root patterns (from existing notes)
  - No evidence of composition root patterns in existing code (src/ is empty)
- File naming conventions support composition root patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

