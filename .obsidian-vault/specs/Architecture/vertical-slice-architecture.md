---
slug: vertical-slice-architecture
sources:
  - https://www.jimmybogard.com/vertical-slice-architecture/
  - https://en.wikipedia.org/wiki/Vertical_slice
date: 2026-11-02
tags:
  - vertical-slice-architecture
  - architecture
  - patterns
  - separation-of-concerns
---

# Vertical Slice Architecture

## Definition

Vertical Slice Architecture is an **architecture style that organizes code by business capability rather than technical layer**.

> "Vertical Slice Architecture organizes code by business capability rather than technical layer." — Jimmy Bogard

## Problem Addressed

Without vertical slice architecture:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Layers are tightly coupled
- **Testing**: Hard to test individual slices
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Vertical Slice Architecture ≠ Layered Architecture (vertical slice organizes by capability, layered organizes by technical layer)
- Vertical Slice Architecture ≠ Modular Monolith (vertical slice is a specific type of modular monolith)
- Vertical Slice Architecture is an **architecture style**, not a specific pattern

## When to Apply

- When building applications
- When separation of concerns matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Vertical slice architecture is complex |
| **Time** — Vertical slice architecture takes time |
| **Over-vertical-slice** — Don't vertical slice everything |

## Common Misuses

- **Everything vertical slice**: Not everything needs vertical slice architecture
- **Confusing with layered architecture**: Vertical slice architecture ≠ layered architecture
- **Over-vertical-slice**: Too many slices create complexity

## Related Concepts

- [Layered Architecture](Architecture/layered-architecture.md) — Vertical slice architecture with layered architecture
- [Modular Monolith](Architecture/modular-monolith.md) — Vertical slice architecture with modular monolith
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Vertical slice architecture with SoC

## Project Observations

- The project uses vertical slice architecture:
  - The project's architecture patterns note covers vertical slice architecture (from existing notes)
  - No evidence of vertical slice architecture in existing code (src/ is empty)
- File naming conventions support vertical slice architecture:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
