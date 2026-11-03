---
slug: builder-pattern
sources:
  - https://refactoring.guru/design-patterns/builder
  - https://en.wikipedia.org/wiki/Builder_pattern
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - builder
  - creational-patterns
  - gof
  - patterns
---

# Builder Pattern

## Definition

Builder Pattern is a **creational design pattern that separates the construction of a complex object from its representation**.

> "The Builder pattern separates the construction of a complex object from its representation so that the same construction process can create different representations." — GoF

## Problem Addressed

Without builder pattern:
- **Complexity**: Object construction is complex
- **Flexibility**: Can't create different representations
- **Testing**: Hard to test construction
- **Maintenance**: Hard to maintain construction

## Scope and Boundaries

- Builder Pattern ≠ Abstract Factory (builder is for construction, abstract factory is for creation)
- Builder Pattern ≠ Factory Method (builder is for construction, factory method is for creation)
- Builder Pattern is a **creational pattern**, not a creation pattern

## When to Apply

- When building software
- when object construction matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Builder pattern is complex |
| **Time** — Builder pattern takes time |
| **Over-builder** — Don't use builder for everything |

## Common Misuses

- **Everything builder**: Not everything needs builder pattern
- **Confusing with abstract factory**: Builder pattern ≠ abstract factory
- **Over-builder**: Too many builders create complexity

## Related Concepts

- [Abstract Factory](Architecture/abstract-factory-pattern.md) — Builder pattern with abstract factory
- [Factory Method](Architecture/factory-method-pattern.md) — Builder pattern with factory method
- [Design Patterns Overview](Architecture/design-patterns-overview.md) — Builder pattern with design patterns

## Project Observations

- The project uses builder pattern:
  - The project's architecture patterns note covers builder pattern (from existing notes)
  - No evidence of builder pattern in existing code (src/ is empty)
- File naming conventions support builder pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




