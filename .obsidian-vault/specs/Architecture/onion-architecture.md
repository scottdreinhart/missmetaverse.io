---
slug: onion-architecture
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

# Onion Architecture

## Definition

Onion Architecture is an **architecture style that organizes code into concentric layers, with dependencies pointing inward**.

> "Onion architecture is a way of implementing n-tier architecture that keeps the business logic layer independent of the UI, Database, and other layers." — Steve Smith

## Problem Addressed

Without onion architecture:
- **Coupling**: Layers are tightly coupled
- **Testing**: Hard to test business logic
- **Maintenance**: Hard to maintain code
- **Flexibility**: Hard to change infrastructure

## Scope and Boundaries

- Onion Architecture ≠ Clean Architecture (onion architecture is a specific type of clean architecture)
- Onion Architecture ≠ Layered Architecture (onion architecture has dependencies pointing inward, layered architecture has dependencies pointing downward)
- Onion Architecture is an **architecture style**, not a specific pattern

## When to Apply

- When building applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Onion architecture is complex |
| **Time** — Onion architecture takes time |
| **Over-onion** — Don't onion everything |

## Common Misuses

- **Everything onion**: Not everything needs onion architecture
- **Confusing with clean architecture**: Onion architecture ≠ clean architecture
- **Over-onion**: Too many layers create complexity

## Related Concepts

- [Clean Architecture](Architecture/clean-architecture.md) — Onion architecture with clean architecture
- [Layered Architecture](Architecture/layered-architecture.md) — Onion architecture with layered architecture
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Onion architecture with SoC

## Project Observations

- The project uses onion architecture:
  - The project's architecture patterns note covers onion architecture (from existing notes)
  - No evidence of onion architecture in existing code (src/ is empty)
- File naming conventions support onion architecture:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

