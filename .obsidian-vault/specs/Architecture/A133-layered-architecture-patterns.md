---
slug: layered-architecture-patterns
sources:
  - https://martinfowler.com/eaaDev/Archi.html
  - https://en.wikipedia.org/wiki/Layered_architecture
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - status/complete
  - type/reference
  - domain/architecture
  - layered-architecture
  - architecture
  - patterns
  - separation-of-concerns
---

# Layered Architecture Patterns

## Definition

Layered Architecture Patterns are **design patterns for working with layered architecture**.

> "Layered architecture organizes code into layers, where each layer has a specific responsibility." — Martin Fowler

## Problem Addressed

Without layered architecture patterns:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Layers are tightly coupled
- **Testing**: Hard to test individual components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Layered Architecture Patterns ≠ Layered Architecture (layered architecture patterns are patterns, layered architecture is an architecture style)
- Layered Architecture Patterns ≠ N-Tier (layered architecture patterns are patterns, n-tier is a specific type)
- Layered Architecture Patterns is a **patterns**, not an architecture style

## When to Apply

- When building applications
- when separation of concerns matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Layered architecture patterns are complex |
| **Time** — Layered architecture patterns take time |
| **Over-layered-architecture** — Don't use layered architecture for everything |

## Common Misuses

- **Everything layered**: Not everything needs layered architecture patterns
- **Confusing with n-tier**: Layered architecture patterns ≠ n-tier
- **Over-layered-architecture**: Too many layers create complexity

## Related Concepts

- [Separation of Concerns](Architecture/separation-of-concerns.md) — Layered architecture patterns with SoC
- [Clean Architecture](Architecture/clean-architecture.md) — Layered architecture patterns with clean architecture
- [DDD Patterns](Architecture/ddd-patterns.md) — Layered architecture patterns with DDD

## Project Observations

- The project uses layered architecture patterns:
  - The project's architecture patterns note covers layered architecture patterns (from existing notes)
  - No evidence of layered architecture patterns in existing code (src/ is empty)
- File naming conventions support layered architecture patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




