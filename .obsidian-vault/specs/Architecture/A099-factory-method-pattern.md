---
slug: factory-method-pattern
sources:
  - https://refactoring.guru/design-patterns/factory-method
  - https://en.wikipedia.org/wiki/Factory_method_pattern
date: 2026-11-02
tags:









  - factory-method
  - creational-patterns
  - gof
  - patterns
---

# Factory Method Pattern

## Definition

Factory Method Pattern is a **creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of created objects**.

> "The Factory Method pattern provides an interface for creating objects in a superclass but allows subclasses to alter the type of created objects." — GoF

## Problem Addressed

Without factory method pattern:
- **Coupling**: Code is coupled to concrete classes
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code
- **Flexibility**: Hard to change created types

## Scope and Boundaries

- Factory Method Pattern ≠ Abstract Factory (factory method is a single method, abstract factory is a family of methods)
- Factory Method Pattern ≠ Builder (factory method is for creation, builder is for construction)
- Factory Method Pattern is a **creational pattern**, not a construction pattern

## When to Apply

- When building software
- when object creation matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Factory method pattern is complex |
| **Time** — Factory method pattern takes time |
| **Over-factory-method** — Don't use factory method for everything |

## Common Misuses

- **Everything factory method**: Not everything needs factory method pattern
- **Confusing with abstract factory**: Factory method pattern ≠ abstract factory
- **Over-factory-method**: Too many factory methods create complexity

## Related Concepts

- [Abstract Factory](Architecture/abstract-factory-pattern.md) — Factory method pattern with abstract factory
- [Builder](Architecture/builder-pattern.md) — Factory method pattern with builder
- [Design Patterns Overview](Architecture/design-patterns-overview.md) — Factory method pattern with design patterns

## Project Observations

- The project uses factory method pattern:
  - The project's architecture patterns note covers factory method pattern (from existing notes)
  - No evidence of factory method pattern in existing code (src/ is empty)
- File naming conventions support factory method pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




