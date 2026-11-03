---
slug: facade-pattern
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

# Facade Pattern

## Definition

Facade Pattern is a **structural design pattern that provides a simplified interface to a complex subsystem**.

> "The Facade pattern provides a unified interface to a set of interfaces in a subsystem." — GoF

## Problem Addressed

Without facade pattern:
- **Complexity**: Subsystems are complex
- **Coupling**: Code is coupled to subsystems
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Facade Pattern ≠ Adapter (facade pattern simplifies, adapter pattern adapts)
- Facade Pattern ≠ Proxy (facade pattern simplifies, proxy pattern controls access)
- Facade Pattern is a **structural pattern**, not a behavioral pattern

## When to Apply

- When building applications
- When simplicity matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Facade pattern is complex |
| **Time** — Facade pattern takes time |
| **Over-facade** — Don't use facade for everything |

## Common Misuses

- **Everything facade**: Not everything needs facade pattern
- **Confusing with adapter**: Facade pattern ≠ adapter
- **Over-facade**: Too many facades create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Facade pattern with DDD
- [Adapter Pattern](Architecture/adapter-pattern.md) — Facade pattern with adapter
- [Decorator Pattern](Architecture/decorator-pattern.md) — Facade pattern with decorator

## Project Observations

- The project uses facade pattern:
  - The project's architecture patterns note covers facade pattern (from existing notes)
  - No evidence of facade pattern in existing code (src/ is empty)
- File naming conventions support facade pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




