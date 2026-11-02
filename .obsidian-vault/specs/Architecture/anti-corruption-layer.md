---
slug: anti-corruption-layer
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

# Anti-Corruption Layer

## Definition

Anti-Corruption Layer is a **design pattern that protects a domain model from the complexities and changes in external systems**.

> "An anti-corruption layer is a boundary between a legacy system and a new system, ensuring that the new system is not corrupted by the legacy system's problems." — Martin Fowler

## Problem Addressed

Without anti-corruption layer:
- **Corruption**: External systems corrupt the domain model
- **Coupling**: Domain is coupled to external systems
- **Maintenance**: Hard to maintain domain model
- **Flexibility**: Hard to change external systems

## Scope and Boundaries

- Anti-Corruption Layer ≠ Integration Layer (anti-corruption layer is for protection, integration layer is for connection)
- Anti-Corruption Layer ≠ Adapter (anti-corruption layer is for protection, adapter is for conversion)
- Anti-Corruption Layer is a **protection pattern**, not an integration pattern

## When to Apply

- When building applications
- When external systems matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Anti-corruption layer is complex |
| **Time** — Anti-corruption layer takes time |
| **Over-protection** — Don't protect everything |

## Common Misuses

- **Everything protected**: Not everything needs anti-corruption layer
- **Confusing with integration layer**: Anti-corruption layer ≠ integration layer
- **Over-protection**: Too much protection creates complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Anti-corruption layer with DDD
- [Integration Layer](Architecture/integration-layer.md) — Anti-corruption layer with integration layer
- [Adapter](Architecture/adapter.md) — Anti-corruption layer with adapter

## Project Observations

- The project uses anti-corruption layer:
  - The project's architecture patterns note covers anti-corruption layer (from existing notes)
  - No evidence of anti-corruption layer in existing code (src/ is empty)
- File naming conventions support anti-corruption layer:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

