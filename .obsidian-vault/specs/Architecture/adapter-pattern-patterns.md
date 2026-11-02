---
slug: adapter-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Adapter_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - adapter-pattern
  - structural-patterns
  - patterns
  - design-patterns
---

# Adapter Pattern Patterns

## Definition

Adapter Pattern Patterns are **design patterns for working with adapter architecture**.

> "The Adapter pattern provides a different interface for a class, enabling objects to work together that couldn't otherwise due to incompatible interfaces." — GoF

## Problem Addressed

Without adapter pattern patterns:
- **Incompatibility**: Objects can't work together
- **Coupling**: Code is coupled to specific interfaces
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Adapter Pattern Patterns ≠ Adapter Pattern (adapter pattern patterns are patterns, adapter pattern is a structural pattern)
- Adapter Pattern Patterns ≠ Facade (adapter pattern patterns are patterns, facade is a structural pattern)
- Adapter Pattern Patterns is a **patterns**, not a structural pattern

## When to Apply

- When building applications
- when integration matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Adapter pattern patterns are complex |
| **Time** — Adapter pattern patterns take time |
| **Over-adapter-pattern** — Don't use adapter pattern for everything |

## Common Misuses

- **Everything adapter pattern**: Not everything needs adapter pattern patterns
- **Confusing with facade**: Adapter pattern patterns ≠ facade
- **Over-adapter-pattern**: Too many adapter patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Adapter pattern patterns with DDD
- [Facade Pattern](Architecture/facade-pattern.md) — Adapter pattern patterns with facade
- [Decorator Pattern](Architecture/decorator-pattern.md) — Adapter pattern patterns with decorator

## Project Observations

- The project uses adapter pattern patterns:
  - The project's architecture patterns note covers adapter pattern patterns (from existing notes)
  - No evidence of adapter pattern patterns in existing code (src/ is empty)
- File naming conventions support adapter pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
