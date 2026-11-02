---
slug: layered-architecture-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Layered_architecture
  - https://martinfowler.com/eaaDev/layered.html
date: 2026-11-02
tags:
  - layered-architecture-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Layered Architecture Pattern Patterns

## Definition

Layered Architecture Pattern Patterns are **design patterns for working with layered architecture**.

> "The layered architecture pattern organizes code into layers, where each layer has a specific responsibility and communicates only with adjacent layers." — Microsoft

## Problem Addressed

Without layered architecture pattern patterns:
- **Complexity**: Code is complex and hard to maintain
- **Coupling**: Layers are coupled to each other
- **Testing**: Hard to test layers
- **Maintenance**: Hard to maintain layers

## Scope and Boundaries

- Layered Architecture Pattern Patterns ≠ Layered Architecture (layered architecture pattern patterns are patterns, layered architecture is an architectural pattern)
- Layered Architecture Pattern Patterns = API Gateway (layered architecture pattern patterns are patterns, api gateway is a distributed systems pattern)
- Layered Architecture Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when separation of concerns matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Layered architecture pattern patterns are complex |
| **Time** — Layered architecture pattern patterns take time |
| **Over-layered-architecture** — Don't use layered architecture for everything |

## Common Misuses

- **Everything layered architecture**: Not everything needs layered architecture pattern patterns
- **Confusing with API gateway**: Layered architecture pattern patterns ≠ API gateway
- **Over-layered-architecture**: Too many layers create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Layered architecture pattern patterns with DDD
- [API Gateway Pattern](Architecture/api-gateway-pattern-patterns.md) — Layered architecture pattern patterns with API gateway
- [Service Mesh Pattern](Architecture/service-mesh-pattern-patterns.md) — Layered architecture pattern patterns with service mesh

## Project Observations

- The project uses layered architecture pattern patterns:
  - The project's architecture patterns note covers layered architecture pattern patterns (from existing notes)
  - No evidence of layered architecture pattern patterns in existing code (src/ is empty)
- File naming conventions support layered architecture pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/microsoft-layered-architecture-2024|microsoft-layered-architecture-2024]]
