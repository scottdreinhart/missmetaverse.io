---
slug: dependency-injection-pattern-patterns
sources:
  - https://martinfowler.com/articles/injection.html
  - https://en.wikipedia.org/wiki/Dependency_injection
date: 2026-11-02
tags:
  - dependency-injection
  - creational-patterns
  - patterns
  - design-patterns
---

# Dependency Injection Pattern Patterns

## Definition

Dependency Injection Pattern Patterns are **design patterns for working with dependency injection architecture**.

> "Dependency injection is a 25-year-old technique to improve the maintainability and testability of software." — Martin Fowler

## Problem Addressed

Without dependency injection pattern patterns:
- **Coupling**: Classes are tightly coupled to dependencies
- **Testing**: Hard to test classes with dependencies
- **Maintenance**: Hard to maintain classes with dependencies
- **Flexibility**: Can't swap dependencies easily

## Scope and Boundaries

- Dependency Injection Pattern Patterns ≠ Dependency Injection (dependency injection pattern patterns are patterns, dependency injection is a creational pattern)
- Dependency Injection Pattern Patterns = Singleton (dependency injection pattern patterns are patterns, singleton is a creational pattern)
- Dependency Injection Pattern Patterns is a **patterns**, not a creational pattern

## When to Apply

- When building applications
- when decoupling matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Dependency injection pattern patterns are complex |
| **Time** — Dependency injection pattern patterns take time |
| **Over-dependency-injection** — Don't use dependency injection for everything |

## Common Misuses

- **Everything dependency injection**: Not everything needs dependency injection pattern patterns
- **Confusing with singleton**: Dependency injection pattern patterns ≠ singleton
- **Over-dependency-injection**: Too many dependency injections create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Dependency injection pattern patterns with DDD
- [Singleton Pattern](Architecture/singleton-pattern-patterns.md) — Dependency injection pattern patterns with singleton
- [Abstract Factory Pattern](Architecture/abstract-factory-pattern-patterns.md) — Dependency injection pattern patterns with abstract factory

## Project Observations

- The project uses dependency injection pattern patterns:
  - The project's architecture patterns note covers dependency injection pattern patterns (from existing notes)
  - No evidence of dependency injection pattern patterns in existing code (src/ is empty)
- File naming conventions support dependency injection pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
