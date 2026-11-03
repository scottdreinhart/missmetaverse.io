---
slug: proxy-pattern
sources:
  - https://en.wikipedia.org/wiki/Proxy_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - maturity/deprecated
  - proxy-pattern
  - structural-patterns
  - patterns
  - design-patterns
  - --
# Proxy Pattern

## Definition

Proxy Pattern is a **structural design pattern that provides a surrogate or placeholder for another object to control access**.

> "The Proxy pattern provides a surrogate or placeholder for another object to control access to it." â€” GoF

## Problem Addressed

Without proxy pattern:
- **Access control**: Access can't be controlled
- **Performance**: Objects are loaded unnecessarily
- **Testing**: Hard to test objects
- **Maintenance**: Hard to maintain objects

## Scope and Boundaries

- Proxy Pattern â‰  Facade (proxy pattern controls access, facade pattern simplifies)
- Proxy Pattern â‰  Decorator (proxy pattern controls access, decorator pattern adds behavior)
- Proxy Pattern is a **structural pattern**, not a behavioral pattern

## When to Apply

- When building applications
- When access control matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Proxy pattern is complex |
| **Time** â€” Proxy pattern takes time |
| **Over-proxy** â€” Don't use proxy for everything |

## Common Misuses

- **Everything proxy**: Not everything needs proxy pattern
- **Confusing with facade**: Proxy pattern â‰  facade
- **Over-proxy**: Too many proxies create complexity

## Related Concepts

- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Proxy pattern with DDD
- [Facade Pattern](Architecture/facade-pattern.md) â€” Proxy pattern with facade
- [Decorator Pattern](Architecture/decorator-pattern.md) â€” Proxy pattern with decorator

## Project Observations

- The project uses proxy pattern:
  - The project's architecture patterns note covers proxy pattern (from existing notes)
  - No evidence of proxy pattern in existing code (src/ is empty)
- File naming conventions support proxy pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




