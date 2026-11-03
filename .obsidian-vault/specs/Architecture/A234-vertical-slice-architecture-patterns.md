---
slug: vertical-slice-architecture-patterns
sources:
  - https://www.jimmybogard.com/vertical-slice-architecture/
  - https://en.wikipedia.org/wiki/Vertical_slice
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/frontend
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - vertical-slice-architecture
  - architecture
  - patterns
  - separation-of-concerns
---

# Vertical Slice Architecture Patterns

## Definition

Vertical Slice Architecture Patterns are **design patterns for working with vertical slice architecture**.

> "Vertical Slice Architecture organizes code by business capability rather than technical layer." — Jimmy Bogard

## Problem Addressed

Without vertical slice architecture patterns:
- **Complexity**: Code is complex and hard to understand
- **Coupling**: Layers are tightly coupled
- **Testing**: Hard to test individual slices
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Vertical Slice Architecture Patterns ≠ Vertical Slice Architecture (vertical slice architecture patterns are patterns, vertical slice architecture is an architecture style)
- Vertical Slice Architecture Patterns ≠ Layered Architecture (vertical slice architecture patterns are patterns, layered architecture is an architecture style)
- Vertical Slice Architecture Patterns is a **patterns**, not an architecture style

## When to Apply

- When building applications
- when separation of concerns matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Vertical slice architecture patterns are complex |
| **Time** — Vertical slice architecture patterns take time |
| **Over-vertical-slice-architecture** — Don't use vertical slice architecture for everything |

## Common Misuses

- **Everything vertical slice**: Not everything needs vertical slice architecture patterns
- **Confusing with layered architecture**: Vertical slice architecture patterns ≠ layered architecture
- **Over-vertical-slice-architecture**: Too many slices create complexity

## Related Concepts

- [Layered Architecture](Architecture/layered-architecture-patterns.md) — Vertical slice architecture patterns with layered architecture
- [Modular Monolith](Architecture/modular-monolith.md) — Vertical slice architecture patterns with modular monolith
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Vertical slice architecture patterns with SoC

## Project Observations

- The project uses vertical slice architecture patterns:
  - The project's architecture patterns note covers vertical slice architecture patterns (from existing notes)
  - No evidence of vertical slice architecture patterns in existing code (src/ is empty)
- File naming conventions support vertical slice architecture patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




