---
slug: layered-architecture
sources:
  - https://martinfowler.com/eaaDev/Archi.html
  - https://en.wikipedia.org/wiki/Layered_architecture
date: 2026-11-02
tags:
  - layered-architecture
  - architecture
  - patterns
  - separation-of-concerns
---

# Layered Architecture

## Definition

Layered Architecture is an **architecture style that organizes code into layers, where each layer has a specific responsibility**.

> "Layered architecture organizes code into layers, where each layer has a specific responsibility." — Martin Fowler

## Problem Addressed

Without layered architecture:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Layers are tightly coupled
- **Testing**: Hard to test individual components
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Layered Architecture ≠ N-Tier (layered architecture is a style, n-tier is a specific type)
- Layered Architecture ≠ Separation of Concerns (layered architecture is a specific type of SoC)
- Layered Architecture is an **architecture style**, not a specific pattern

## When to Apply

- When building applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Layered architecture is complex |
| **Time** — Layered architecture takes time |
| **Over-layering** — Don't layer everything |

## Common Misuses

- **Everything layered**: Not everything needs layered architecture
- **Confusing with n-tier**: Layered architecture ≠ n-tier
- **Over-layering**: Too many layers create complexity

## Related Concepts

- [Separation of Concerns](Architecture/separation-of-concerns.md) — Layered architecture with SoC
- [Clean Architecture](Architecture/clean-architecture.md) — Layered architecture with clean architecture
- [DDD Patterns](Architecture/ddd-patterns.md) — Layered architecture with DDD

## Project Observations

- The project uses layered architecture:
  - The project's architecture patterns note covers layered architecture (from existing notes)
  - No evidence of layered architecture in existing code (src/ is empty)
- File naming conventions support layered architecture:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
