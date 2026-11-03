---
slug: prototype-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Prototype_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - priority/medium
  - maturity/experimental
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - prototype-pattern
  - creational-patterns
  - patterns
  - design-patterns
---

# Prototype Pattern Patterns

## Definition

Prototype Pattern Patterns are **design patterns for working with prototype architecture**.

> "The Prototype pattern specifies the kinds of objects to create using a prototypical instance, and creates new objects by copying this prototype." — GoF

## Problem Addressed

Without prototype pattern patterns:
- **Complexity**: Object creation is complex and hard to maintain
- **Flexibility**: Can't create objects by copying prototypes
- **Testing**: Hard to test object creation
- **Maintenance**: Hard to maintain object creation

## Scope and Boundaries

- Prototype Pattern Patterns ≠ Prototype Pattern (prototype pattern patterns are patterns, prototype pattern is a creational pattern)
- Prototype Pattern Patterns = Builder (prototype pattern patterns are patterns, builder is a creational pattern)
- Prototype Pattern Patterns is a **patterns**, not a creational pattern

## When to Apply

- When building applications
- when object creation matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Prototype pattern patterns are complex |
| **Time** — Prototype pattern patterns take time |
| **Over-prototype-pattern** — Don't use prototype pattern for everything |

## Common Misuses

- **Everything prototype pattern**: Not everything needs prototype pattern patterns
- **Confusing with builder**: Prototype pattern patterns ≠ builder
- **Over-prototype-pattern**: Too many prototype patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Prototype pattern patterns with DDD
- [Builder Pattern](Architecture/builder-pattern-patterns.md) — Prototype pattern patterns with builder
- [Factory Pattern](Architecture/factory-pattern-patterns.md) — Prototype pattern patterns with factory

## Project Observations

- The project uses prototype pattern patterns:
  - The project's architecture patterns note covers prototype pattern patterns (from existing notes)
  - No evidence of prototype pattern patterns in existing code (src/ is empty)
- File naming conventions support prototype pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




