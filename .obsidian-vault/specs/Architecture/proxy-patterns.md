---
slug: proxy-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Proxy_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - proxy-pattern
  - structural-patterns
  - patterns
  - design-patterns
---

# Proxy Pattern Patterns

## Definition

Proxy Pattern Patterns are **design patterns for working with proxy architecture**.

> "The Proxy pattern provides a surrogate or placeholder for another object to control access to it." — GoF

## Problem Addressed

Without proxy pattern patterns:
- **Access control**: Access can't be controlled
- **Performance**: Objects are loaded unnecessarily
- **Testing**: Hard to test objects
- **Maintenance**: Hard to maintain objects

## Scope and Boundaries

- Proxy Pattern Patterns ≠ Proxy Pattern (proxy pattern patterns are patterns, proxy pattern is a structural pattern)
- Proxy Pattern Patterns ≠ Facade (proxy pattern patterns are patterns, facade is a structural pattern)
- Proxy Pattern Patterns is a **patterns**, not a structural pattern

## When to Apply

- When building applications
- when access control matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Proxy pattern patterns are complex |
| **Time** — Proxy pattern patterns take time |
| **Over-proxy-pattern** — Don't use proxy pattern for everything |

## Common Misuses

- **Everything proxy pattern**: Not everything needs proxy pattern patterns
- **Confusing with facade**: Proxy pattern patterns ≠ facade
- **Over-proxy-pattern**: Too many proxy patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Proxy pattern patterns with DDD
- [Facade Pattern](Architecture/facade-pattern-patterns.md) — Proxy pattern patterns with facade
- [Decorator Pattern](Architecture/decorator-pattern-patterns.md) — Proxy pattern patterns with decorator

## Project Observations

- The project uses proxy pattern patterns:
  - The project's architecture patterns note covers proxy pattern patterns (from existing notes)
  - No evidence of proxy pattern patterns in existing code (src/ is empty)
- File naming conventions support proxy pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

