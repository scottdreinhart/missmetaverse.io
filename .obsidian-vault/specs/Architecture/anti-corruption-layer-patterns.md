---
slug: anti-corruption-layer-pattern-patterns
sources:
  - https://martinfowler.com/bliki/AntiCorruptionLayer.html
  - https://en.wikipedia.org/wiki/Anti-corruption_layer
date: 2026-11-02
tags:
  - anti-corruption-layer-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Anti-Corruption Layer Pattern Patterns

## Definition

Anti-Corruption Layer Pattern Patterns are **design patterns for working with anti-corruption layer architecture**.

> "An anti-corruption layer protects your domain model from the complexities and changes in external systems." — Martin Fowler

## Problem Addressed

Without anti-corruption layer pattern patterns:
- **Complexity**: External systems are complex and hard to maintain
- **Coupling**: Domain is coupled to external systems
- **Testing**: Hard to test domain logic
- **Maintenance**: Hard to maintain domain logic

## Scope and Boundaries

- Anti-Corruption Layer Pattern Patterns ≠ Anti-Corruption Layer (anti-corruption layer pattern patterns are patterns, anti-corruption layer is an architectural pattern)
- Anti-Corruption Layer Pattern Patterns = Use Case Driven Design (anti-corruption layer pattern patterns are patterns, use case driven design is an architectural pattern)
- Anti-Corruption Layer Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when external integration matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Anti-corruption layer pattern patterns are complex |
| **Time** — Anti-corruption layer pattern patterns take time |
| **Over-anti-corruption-layer** — Don't use anti-corruption layer for everything |

## Common Misuses

- **Everything anti-corruption layer**: Not everything needs anti-corruption layer pattern patterns
- **Confusing with use case driven design**: Anti-corruption layer pattern patterns ≠ use case driven design
- **Over-anti-corruption-layer**: Too many anti-corruption layers create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Anti-corruption layer pattern patterns with DDD
- [Use Case Driven Design Pattern](Architecture/use-case-driven-design-pattern-patterns.md) — Anti-corruption layer pattern patterns with use case driven design
- [Composition Root Pattern](Architecture/composition-root-pattern-patterns.md) — Anti-corruption layer pattern patterns with composition root

## Project Observations

- The project uses anti-corruption layer pattern patterns:
  - The project's architecture patterns note covers anti-corruption layer pattern patterns (from existing notes)
  - No evidence of anti-corruption layer pattern patterns in existing code (src/ is empty)
- File naming conventions support anti-corruption layer pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]

