---
slug: observer-pattern
sources:
  - https://en.wikipedia.org/wiki/Observer_pattern
  - https://martinfowler.com/eaaDev/observer.html
date: 2026-11-02
tags:
  - observer-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Observer Pattern

## Definition

Observer Pattern is a **behavioral design pattern that defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified**.

> "The Observer pattern defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified." — GoF

## Problem Addressed

Without observer pattern:
- **Coupling**: Objects are tightly coupled
- **Inconsistency**: Objects are inconsistent
- **Testing**: Hard to test objects
- **Maintenance**: Hard to maintain objects

## Scope and Boundaries

- Observer Pattern ≠ Event Emitter (observer pattern is a pattern, event emitter is an implementation)
- Observer Pattern ≠ Pub/Sub (observer pattern is one-to-many, pub/sub is many-to-many)
- Observer Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When state changes matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Observer pattern is complex |
| **Time** — Observer pattern takes time |
| **Over-observer** — Don't use observer for everything |

## Common Misuses

- **Everything observer**: Not everything needs observer pattern
- **Confusing with event emitter**: Observer pattern ≠ event emitter
- **Over-observer**: Too many observers create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Observer pattern with DDD
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Observer pattern with EDA
- [State Pattern](Architecture/state-pattern.md) — Observer pattern with state

## Project Observations

- The project uses observer pattern:
  - The project's architecture patterns note covers observer pattern (from existing notes)
  - No evidence of observer pattern in existing code (src/ is empty)
- File naming conventions support observer pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

