---
slug: composition-root-pattern-patterns
sources:
  - https://blog.ploeh.dk/2011/07/28/CompositionRoot/
  - https://en.wikipedia.org/wiki/Composition_root
date: 2026-11-02
tags:
  - composition-root-pattern
  - architectural-patterns
  - patterns
  - design-patterns
---

# Composition Root Pattern Patterns

## Definition

Composition Root Pattern Patterns are **design patterns for working with composition root architecture**.

> "A composition root is a place at the earliest possible level in an application's startup where you assemble application objects." — Mark Seemann

## Problem Addressed

Without composition root pattern patterns:
- **Complexity**: Object composition is complex and hard to maintain
- **Coupling**: Objects are coupled to their dependencies
- **Testing**: Hard to test object composition
- **Maintenance**: Hard to maintain object composition

## Scope and Boundaries

- Composition Root Pattern Patterns ≠ Composition Root (composition root pattern patterns are patterns, composition root is an architectural pattern)
- Composition Root Pattern Patterns = Functional Core Shell (composition root pattern patterns are patterns, functional core shell is an architectural pattern)
- Composition Root Pattern Patterns is a **patterns**, not an architectural pattern

## When to Apply

- When building applications
- when object composition matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Composition root pattern patterns are complex |
| **Time** — Composition root pattern patterns take time |
| **Over-composition-root** — Don't use composition root for everything |

## Common Misuses

- **Everything composition root**: Not everything needs composition root pattern patterns
- **Confusing with functional core shell**: Composition root pattern patterns ≠ functional core shell
- **Over-composition-root**: Too many composition roots create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Composition root pattern patterns with DDD
- [Functional Core Shell Pattern](Architecture/functional-core-shell-pattern-patterns.md) — Composition root pattern patterns with functional core shell
- [Plugin Architecture Pattern](Architecture/plugin-architecture-pattern-patterns.md) — Composition root pattern patterns with plugin architecture

## Project Observations

- The project uses composition root pattern patterns:
  - The project's architecture patterns note covers composition root pattern patterns (from existing notes)
  - No evidence of composition root pattern patterns in existing code (src/ is empty)
- File naming conventions support composition root pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/microsoft-composition-root-2024|microsoft-composition-root-2024]]
