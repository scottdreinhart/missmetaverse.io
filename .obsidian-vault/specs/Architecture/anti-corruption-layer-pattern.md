---
slug: anti-corruption-layer-pattern
sources:
  - https://martinfowler.com/bliki/AntiCorruptionLayer.html
  - https://en.wikipedia.org/wiki/Anti-corruption_layer
date: 2026-11-02
tags:
  - anti-corruption-layer
  - ddd
  - integration
  - patterns
---

# Anti-Corruption Layer Pattern

## Definition

Anti-Corruption Layer Pattern is a **design pattern that protects a domain model from the complexities and changes in external systems**.

> "An anti-corruption layer is a boundary between a legacy system and a new system, ensuring that the new system is not corrupted by the legacy system's problems." — Martin Fowler

## Problem Addressed

Without anti-corruption layer pattern:
- **Corruption**: External systems corrupt the domain model
- **Coupling**: Domain is coupled to external systems
- **Maintenance**: Hard to maintain domain model
- **Flexibility**: Hard to change external systems

## Scope and Boundaries

- Anti-Corruption Layer Pattern ≠ Integration Layer (anti-corruption layer pattern is for protection, integration layer is for connection)
- Anti-Corruption Layer Pattern ≠ Adapter (anti-corruption layer pattern is for protection, adapter is for conversion)
- Anti-Corruption Layer Pattern is a **design pattern**, not an integration pattern

## When to Apply

- When building applications
- when external systems matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Anti-corruption layer pattern is complex |
| **Time** — Anti-corruption layer pattern takes time |
| **Over-anti-corruption-layer** — Don't protect everything |

## Common Misuses

- **Everything protected**: Not everything needs anti-corruption layer pattern
- **Confusing with integration layer**: Anti-corruption layer pattern ≠ integration layer
- **Over-anti-corruption-layer**: Too much protection creates complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Anti-corruption layer pattern with DDD
- [Integration Layer](Architecture/integration-layer.md) — Anti-corruption layer pattern with integration layer
- [Adapter](Architecture/adapter-pattern.md) — Anti-corruption layer pattern with adapter

## Project Observations

- The project uses anti-corruption layer pattern:
  - The project's architecture patterns note covers anti-corruption layer pattern (from existing notes)
  - No evidence of anti-corruption layer pattern in existing code (src/ is empty)
- File naming conventions support anti-corruption layer pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

