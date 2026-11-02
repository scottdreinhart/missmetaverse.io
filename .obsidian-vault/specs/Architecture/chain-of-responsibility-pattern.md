---
slug: chain-of-responsibility-pattern
sources:
  - https://en.wikipedia.org/wiki/Chain_of_responsibility_pattern
  - https://martinfowler.com/eaaDev/chainOfResponsibility.html
date: 2026-11-02
tags:
  - chain-of-responsibility-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Chain of Responsibility Pattern

## Definition

Chain of Responsibility Pattern is a **behavioral design pattern that allows a request to be passed along a chain of handlers**.

> "The Chain of Responsibility pattern allows a request to be passed along a chain of handlers, each of which can handle the request or pass it to the next handler." — GoF

## Problem Addressed

Without chain of responsibility pattern:
- **Coupling**: Request is coupled to handlers
- **Inflexibility**: Can't add or remove handlers
- **Testing**: Hard to test handlers
- **Maintenance**: Hard to maintain handlers

## Scope and Boundaries

- Chain of Responsibility Pattern ≠ Mediator (chain of responsibility is a chain, mediator is a coordinator)
- Chain of Responsibility Pattern ≠ Strategy (chain of responsibility is for requests, strategy is for algorithms)
- Chain of Responsibility Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When request handling matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Chain of responsibility is complex |
| **Time** — Chain of responsibility takes time |
| **Over-chain** — Don't use chain for everything |

## Common Misuses

- **Everything chain**: Not everything needs chain of responsibility pattern
- **Confusing with mediator**: Chain of responsibility ≠ mediator
- **Over-chain**: Too many chains create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Chain of responsibility pattern with DDD
- [Mediator Pattern](Architecture/mediator-pattern.md) — Chain of responsibility pattern with mediator
- [Strategy Pattern](Architecture/strategy-pattern.md) — Chain of responsibility pattern with strategy

## Project Observations

- The project uses chain of responsibility pattern:
  - The project's architecture patterns note covers chain of responsibility pattern (from existing notes)
  - No evidence of chain of responsibility pattern in existing code (src/ is empty)
- File naming conventions support chain of responsibility pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

