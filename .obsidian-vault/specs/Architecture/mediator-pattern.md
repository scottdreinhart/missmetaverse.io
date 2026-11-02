---
slug: mediator-pattern
sources:
  - https://en.wikipedia.org/wiki/Mediator_pattern
  - https://martinfowler.com/eaaDev/mediator.html
date: 2026-11-02
tags:
  - mediator-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Mediator Pattern

## Definition

Mediator Pattern is a **behavioral design pattern that defines an object that encapsulates how a set of objects interact**.

> "The Mediator pattern defines an object that encapsulates how a set of objects interact, promoting loose coupling by preventing objects from referring to each other." — GoF

## Problem Addressed

Without mediator pattern:
- **Coupling**: Objects are tightly coupled
- **Complexity**: Interactions are complex
- **Testing**: Hard to test interactions
- **Maintenance**: Hard to maintain interactions

## Scope and Boundaries

- Mediator Pattern ≠ Chain of Responsibility (mediator is a coordinator, chain of responsibility is a chain)
- Mediator Pattern ≠ Observer (mediator is a coordinator, observer is for notifications)
- Mediator Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When coordination matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Mediator pattern is complex |
| **Time** — Mediator pattern takes time |
| **Over-mediator** — Don't use mediator for everything |

## Common Misuses

- **Everything mediator**: Not everything needs mediator pattern
- **Confusing with chain of responsibility**: Mediator ≠ chain of responsibility
- **Over-mediator**: Too many mediators create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Mediator pattern with DDD
- [Chain of Responsibility Pattern](Architecture/chain-of-responsibility-pattern.md) — Mediator pattern with chain of responsibility
- [Command Pattern](Architecture/command-pattern.md) — Mediator pattern with command

## Project Observations

- The project uses mediator pattern:
  - The project's architecture patterns note covers mediator pattern (from existing notes)
  - No evidence of mediator pattern in existing code (src/ is empty)
- File naming conventions support mediator pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

