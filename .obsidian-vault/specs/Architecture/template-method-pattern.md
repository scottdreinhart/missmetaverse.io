---
slug: template-method-pattern
sources:
  - https://en.wikipedia.org/wiki/Template_method_pattern
  - https://martinfowler.com/eaaDev/templateMethod.html
date: 2026-11-02
tags:
  - template-method-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Template Method Pattern

## Definition

Template Method Pattern is a **behavioral design pattern that defines the skeleton of an algorithm in a method, deferring some steps to subclasses**.

> "The Template Method pattern defines the skeleton of an algorithm in a method, deferring some steps to subclasses." — GoF

## Problem Addressed

Without template method pattern:
- **Duplication**: Algorithm steps are duplicated
- **Inflexibility**: Can't change algorithm steps
- **Testing**: Hard to test algorithm steps
- **Maintenance**: Hard to maintain algorithm steps

## Scope and Boundaries

- Template Method Pattern ≠ Strategy (template method pattern is for algorithms, strategy pattern is for algorithms)
- Template Method Pattern ≠ Factory Method (template method pattern is for algorithms, factory method is for creation)
- Template Method Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When algorithms matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Template method pattern is complex |
| **Time** — Template method pattern takes time |
| **Over-template** — Don't use template for everything |

## Common Misuses

- **Everything template**: Not everything needs template method pattern
- **Confusing with strategy**: Template method pattern ≠ strategy
- **Over-template**: Too many templates create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Template method pattern with DDD
- [Strategy Pattern](Architecture/strategy-pattern.md) — Template method pattern with strategy
- [Factory Method Pattern](Architecture/factory-method-pattern.md) — Template method pattern with factory method

## Project Observations

- The project uses template method pattern:
  - The project's architecture patterns note covers template method pattern (from existing notes)
  - No evidence of template method pattern in existing code (src/ is empty)
- File naming conventions support template method pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
