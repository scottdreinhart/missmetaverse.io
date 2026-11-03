---
slug: bridge-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Bridge_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - bridge-pattern
  - structural-patterns
  - patterns
  - design-patterns
---

# Bridge Pattern Patterns

## Definition

Bridge Pattern Patterns are **design patterns for working with bridge architecture**.

> "The Bridge pattern decouples an abstraction from its implementation so that the two can vary independently." — GoF

## Problem Addressed

Without bridge pattern patterns:
- **Coupling**: Abstraction is coupled to implementation
- **Inflexibility**: Can't vary abstraction and implementation independently
- **Testing**: Hard to test abstraction
- **Maintenance**: Hard to maintain abstraction

## Scope and Boundaries

- Bridge Pattern Patterns ≠ Bridge Pattern (bridge pattern patterns are patterns, bridge pattern is a structural pattern)
- Bridge Pattern Patterns ≠ Adapter (bridge pattern patterns are patterns, adapter is a structural pattern)
- Bridge Pattern Patterns is a **patterns**, not a structural pattern

## When to Apply

- When building applications
- when decoupling matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Bridge pattern patterns are complex |
| **Time** — Bridge pattern patterns take time |
| **Over-bridge-pattern** — Don't use bridge pattern for everything |

## Common Misuses

- **Everything bridge pattern**: Not everything needs bridge pattern patterns
- **Confusing with adapter**: Bridge pattern patterns ≠ adapter
- **Over-bridge-pattern**: Too many bridge patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Bridge pattern patterns with DDD
- [Adapter Pattern](Architecture/adapter-pattern-patterns.md) — Bridge pattern patterns with adapter
- [Facade Pattern](Architecture/facade-pattern-patterns.md) — Bridge pattern patterns with facade

## Project Observations

- The project uses bridge pattern patterns:
  - The project's architecture patterns note covers bridge pattern patterns (from existing notes)
  - No evidence of bridge pattern patterns in existing code (src/ is empty)
- File naming conventions support bridge pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




