---
slug: onion-architecture-patterns
sources:
  - https://ardalis.com/onion-architecture/
  - https://en.wikipedia.org/wiki/Onion_architecture
date: 2026-11-02
tags:
  - onion-architecture
  - architecture
  - patterns
  - separation-of-concerns
---

# Onion Architecture Patterns

## Definition

Onion Architecture Patterns are **design patterns for working with onion architecture**.

> "Onion architecture is a way of implementing n-tier architecture that keeps the business logic layer independent of the UI, Database, and other layers." — Steve Smith

## Problem Addressed

Without onion architecture patterns:
- **Coupling**: Layers are tightly coupled
- **Testing**: Hard to test business logic
- **Maintenance**: Hard to maintain code
- **Flexibility**: Hard to change infrastructure

## Scope and Boundaries

- Onion Architecture Patterns ≠ Onion Architecture (onion architecture patterns are patterns, onion architecture is an architecture style)
- Onion Architecture Patterns ≠ Clean Architecture (onion architecture patterns are patterns, clean architecture is an architecture style)
- Onion Architecture Patterns is a **patterns**, not an architecture style

## When to Apply

- When building applications
- when separation of concerns matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Onion architecture patterns are complex |
| **Time** — Onion architecture patterns take time |
| **Over-onion-architecture** — Don't use onion architecture for everything |

## Common Misuses

- **Everything onion**: Not everything needs onion architecture patterns
- **Confusing with clean architecture**: Onion architecture patterns ≠ clean architecture
- **Over-onion-architecture**: Too many layers create complexity

## Related Concepts

- [Clean Architecture](Architecture/clean-architecture.md) — Onion architecture patterns with clean architecture
- [Layered Architecture](Architecture/layered-architecture-patterns.md) — Onion architecture patterns with layered architecture
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Onion architecture patterns with SoC

## Project Observations

- The project uses onion architecture patterns:
  - The project's architecture patterns note covers onion architecture patterns (from existing notes)
  - No evidence of onion architecture patterns in existing code (src/ is empty)
- File naming conventions support onion architecture patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
