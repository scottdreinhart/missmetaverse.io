---
slug: vertical-slice-architecture-pattern-patterns
sources:
  - https://www.jimmybogard.com/vertical-slices/
  - https://en.wikipedia.org/wiki/Vertical_slice_architecture
date: 2026-11-02
tags:
  - vertical-slice-architecture-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Vertical Slice Architecture Pattern Patterns

## Definition

Vertical Slice Architecture Pattern Patterns are **design patterns for working with vertical slice architecture**.

> "Vertical slice architecture organizes an application by vertical slices, where each slice crosses all layers and represents a complete feature." — Jimmy Bogard

## Problem Addressed

Without vertical slice architecture pattern patterns:
- **Complexity**: Code is complex and hard to maintain
- **Coupling**: Features are coupled to each other
- **Testing**: Hard to test features
- **Maintenance**: Hard to maintain features

## Scope and Boundaries

- Vertical Slice Architecture Pattern Patterns ≠ Vertical Slice Architecture (vertical slice architecture pattern patterns are patterns, vertical slice architecture is an architectural pattern)
- Vertical Slice Architecture Pattern Patterns = Onion Architecture (vertical slice architecture pattern patterns are patterns, onion architecture is an architectural pattern)
- Vertical Slice Architecture Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when feature-driven development matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Vertical slice architecture pattern patterns are complex |
| **Time** — Vertical slice architecture pattern patterns take time |
| **Over-vertical-slice-architecture** — Don't use vertical slice architecture for everything |

## Common Misuses

- **Everything vertical slice architecture**: Not everything needs vertical slice architecture pattern patterns
- **Confusing with onion architecture**: Vertical slice architecture pattern patterns ≠ onion architecture
- **Over-vertical-slice-architecture**: Too many vertical slices create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Vertical slice architecture pattern patterns with DDD
- [Onion Architecture Pattern](Architecture/onion-architecture-pattern-patterns.md) — Vertical slice architecture pattern patterns with onion architecture
- [Layered Architecture Pattern](Architecture/layered-architecture-pattern-patterns.md) — Vertical slice architecture pattern patterns with layered architecture

## Project Observations

- The project uses vertical slice architecture pattern patterns:
  - The project's architecture patterns note covers vertical slice architecture pattern patterns (from existing notes)
  - No evidence of vertical slice architecture pattern patterns in existing code (src/ is empty)
- File naming conventions support vertical slice architecture pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/microsoft-vertical-slice-architecture-2024|microsoft-vertical-slice-architecture-2024]]
