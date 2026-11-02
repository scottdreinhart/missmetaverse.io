---
slug: onion-architecture-pattern-patterns
sources:
  - https://herbertograca.com/2017/09/21/onion-architecture/
  - https://en.wikipedia.org/wiki/Onion_architecture
date: 2026-11-02
tags:
  - onion-architecture-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Onion Architecture Pattern Patterns

## Definition

Onion Architecture Pattern Patterns are **design patterns for working with onion architecture**.

> "Onion architecture is a way of thinking about software architecture that puts the domain model at the center." — Jeffrey Palermo

## Problem Addressed

Without onion architecture pattern patterns:
- **Complexity**: Code is complex and hard to maintain
- **Coupling**: Domain is coupled to infrastructure
- **Testing**: Hard to test domain logic
- **Maintenance**: Hard to maintain domain logic

## Scope and Boundaries

- Onion Architecture Pattern Patterns ≠ Onion Architecture (onion architecture pattern patterns are patterns, onion architecture is an architectural pattern)
- Onion Architecture Pattern Patterns = Layered Architecture (onion architecture pattern patterns are patterns, layered architecture is an architectural pattern)
- Onion Architecture Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when domain-driven design matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Onion architecture pattern patterns are complex |
| **Time** — Onion architecture pattern patterns take time |
| **Over-onion-architecture** — Don't use onion architecture for everything |

## Common Misuses

- **Everything onion architecture**: Not everything needs onion architecture pattern patterns
- **Confusing with layered architecture**: Onion architecture pattern patterns ≠ layered architecture
- **Over-onion-architecture**: Too many onion architectures create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Onion architecture pattern patterns with DDD
- [Layered Architecture Pattern](Architecture/layered-architecture-pattern-patterns.md) — Onion architecture pattern patterns with layered architecture
- [API Gateway Pattern](Architecture/api-gateway-pattern-patterns.md) — Onion architecture pattern patterns with API gateway

## Project Observations

- The project uses onion architecture pattern patterns:
  - The project's architecture patterns note covers onion architecture pattern patterns (from existing notes)
  - No evidence of onion architecture pattern patterns in existing code (src/ is empty)
- File naming conventions support onion architecture pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/microsoft-onion-architecture-2024|microsoft-onion-architecture-2024]]
