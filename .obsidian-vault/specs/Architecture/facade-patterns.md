---
slug: facade-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Facade_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - facade-pattern
  - structural-patterns
  - patterns
  - design-patterns
---

# Facade Pattern Patterns

## Definition

Facade Pattern Patterns are **design patterns for working with facade architecture**.

> "The Facade pattern provides a unified interface to a set of interfaces in a subsystem." — GoF

## Problem Addressed

Without facade pattern patterns:
- **Complexity**: Subsystems are complex
- **Coupling**: Code is coupled to subsystems
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Facade Pattern Patterns ≠ Facade Pattern (facade pattern patterns are patterns, facade pattern is a structural pattern)
- Facade Pattern Patterns ≠ Adapter (facade pattern patterns are patterns, adapter is a structural pattern)
- Facade Pattern Patterns is a **patterns**, not a structural pattern

## When to Apply

- When building applications
- when simplicity matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Facade pattern patterns are complex |
| **Time** — Facade pattern patterns take time |
| **Over-facade-pattern** — Don't use facade pattern for everything |

## Common Misuses

- **Everything facade pattern**: Not everything needs facade pattern patterns
- **Confusing with adapter**: Facade pattern patterns ≠ adapter
- **Over-facade-pattern**: Too many facade patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Facade pattern patterns with DDD
- [Adapter Pattern](Architecture/adapter-pattern-patterns.md) — Facade pattern patterns with adapter
- [Decorator Pattern](Architecture/decorator-pattern.md) — Facade pattern patterns with decorator

## Project Observations

- The project uses facade pattern patterns:
  - The project's architecture patterns note covers facade pattern patterns (from existing notes)
  - No evidence of facade pattern patterns in existing code (src/ is empty)
- File naming conventions support facade pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

