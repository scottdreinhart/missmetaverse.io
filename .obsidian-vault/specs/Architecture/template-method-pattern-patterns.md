---
slug: template-method-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Template_method_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - template-method-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Template Method Pattern Patterns

## Definition

Template Method Pattern Patterns are **design patterns for working with template method architecture**.

> "The Template Method pattern defines the skeleton of an algorithm in a method, deferring some steps to subclasses." — GoF

## Problem Addressed

Without template method pattern patterns:
- **Duplication**: Algorithms are duplicated across classes
- **Inflexibility**: Can't customize algorithm steps
- **Testing**: Hard to test algorithm steps
- **Maintenance**: Hard to maintain algorithms

## Scope and Boundaries

- Template Method Pattern Patterns ≠ Template Method Pattern (template method pattern patterns are patterns, template method pattern is a behavioral pattern)
- Template Method Pattern Patterns ≠ Strategy (template method pattern patterns are patterns, strategy is a behavioral pattern)
- Template Method Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when algorithms matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Template method pattern patterns are complex |
| **Time** — Template method pattern patterns take time |
| **Over-template-method-pattern** — Don't use template method pattern for everything |

## Common Misuses

- **Everything template method pattern**: Not everything needs template method pattern patterns
- **Confusing with strategy**: Template method pattern patterns ≠ strategy
- **Over-template-method-pattern**: Too many template method patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Template method pattern patterns with DDD
- [Strategy Pattern](Architecture/strategy-pattern-patterns.md) — Template method pattern patterns with strategy
- [State Pattern](Architecture/state-pattern-patterns.md) — Template method pattern patterns with state

## Project Observations

- The project uses template method pattern patterns:
  - The project's architecture patterns note covers template method pattern patterns (from existing notes)
  - No evidence of template method pattern patterns in existing code (src/ is empty)
- File naming conventions support template method pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
