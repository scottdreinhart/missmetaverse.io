---
slug: adapter-pattern
sources:
  - https://en.wikipedia.org/wiki/Adapter_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - domain/frontend
  - status/complete
  - type/reference
  - domain/architecture
  - adapter-pattern
  - structural-patterns
  - patterns
  - design-patterns
---

# Adapter Pattern

## Definition

Adapter Pattern is a **structural design pattern that allows objects with incompatible interfaces to collaborate**.

> "The Adapter pattern provides a different interface for a class, enabling objects to work together that couldn't otherwise due to incompatible interfaces." — GoF

## Problem Addressed

Without adapter pattern:
- **Incompatibility**: Objects can't work together
- **Coupling**: Code is coupled to specific interfaces
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Adapter Pattern ≠ Facade (adapter pattern adapts interfaces, facade simplifies interfaces)
- Adapter Pattern ≠ Decorator (adapter pattern adapts, decorator adds behavior)
- Adapter Pattern is a **structural pattern**, not a behavioral pattern

## When to Apply

- When building applications
- When integration matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Adapter pattern is complex |
| **Time** — Adapter pattern takes time |
| **Over-adapter** — Don't use adapter for everything |

## Common Misuses

- **Everything adapter**: Not everything needs adapter pattern
- **Confusing with facade**: Adapter pattern ≠ facade
- **Over-adapter**: Too many adapters create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Adapter pattern with DDD
- [Facade Pattern](Architecture/facade-pattern.md) — Adapter pattern with facade
- [Decorator Pattern](Architecture/decorator-pattern.md) — Adapter pattern with decorator

## Project Observations

- The project uses adapter pattern:
  - The project's architecture patterns note covers adapter pattern (from existing notes)
  - No evidence of adapter pattern in existing code (src/ is empty)
- File naming conventions support adapter pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




