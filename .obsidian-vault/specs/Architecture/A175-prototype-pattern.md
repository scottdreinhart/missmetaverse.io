---
slug: prototype-pattern
sources:
  - https://refactoring.guru/design-patterns/prototype
  - https://en.wikipedia.org/wiki/Prototype_pattern
date: 2026-11-02
tags:

  - maturity/experimental






  - prototype
  - creational-patterns
  - gof
  - patterns
---

# Prototype Pattern

## Definition

Prototype Pattern is a **creational design pattern that creates new objects by copying an existing object**.

> "The Prototype pattern creates new objects by copying an existing object." — GoF

## Problem Addressed

Without prototype pattern:
- **Complexity**: Object creation is complex
- **Duplication**: Objects are duplicated
- **Testing**: Hard to test creation
- **Maintenance**: Hard to maintain creation

## Scope and Boundaries

- Prototype Pattern ≠ Factory Method (prototype is for copying, factory method is for creation)
- Prototype Pattern ≠ Abstract Factory (prototype is for copying, abstract factory is for creation)
- Prototype Pattern is a **creational pattern**, not a creation pattern

## When to Apply

- When building software
- when object copying matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Prototype pattern is complex |
| **Time** — Prototype pattern takes time |
| **Over-prototype** — Don't use prototype for everything |

## Common Misuses

- **Everything prototype**: Not everything needs prototype pattern
- **Confusing with factory method**: Prototype pattern ≠ factory method
- **Over-prototype**: Too many prototypes create complexity

## Related Concepts

- [Factory Method](Architecture/factory-method-pattern.md) — Prototype pattern with factory method
- [Abstract Factory](Architecture/abstract-factory-pattern.md) — Prototype pattern with abstract factory
- [Design Patterns Overview](Architecture/design-patterns-overview.md) — Prototype pattern with design patterns

## Project Observations

- The project uses prototype pattern:
  - The project's architecture patterns note covers prototype pattern (from existing notes)
  - No evidence of prototype pattern in existing code (src/ is empty)
- File naming conventions support prototype pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




