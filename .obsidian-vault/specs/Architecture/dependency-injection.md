---
slug: dependency-injection
sources:
  - https://martinfowler.com/articles/injection.html
  - https://en.wikipedia.org/wiki/Dependency_injection
date: 2026-11-02
tags:
  - dependency-injection
  - inversion
  - composition-root
  - architecture
---

# Dependency Injection

## Definition

Dependency Injection (DI) is a **technique where objects receive their dependencies from external sources rather than creating them internally**. DI is a specific form of Inversion of Control.

> "Dependency Injection is a 25-dollar term question. It means giving objects their instances — and their dependencies — via constructors, method calls, or the field they are set on." — Martin Fowler

## Problem Addressed

Without DI:
- **Tight coupling**: Classes create their own dependencies
- **Testing difficulty**: Hard to mock dependencies
- **Configuration**: Dependencies are hardcoded
- **Reusability**: Coupled classes can't be reused

## Scope and Boundaries

- DI ≠ Dependency Inversion (DI is a technique, DIP is a principle)
- DI is a form of Inversion of Control
- DI enables Composition over Inheritance

## When to Apply

- When a class needs dependencies from external sources
- When testing requires mock dependencies
- When configuration needs to be externalized
- When building modular systems

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Boilerplate** — More code for dependency wiring |
| **Complexity** — DI containers add complexity |
| **Hidden dependencies** — Hard to see what a class needs |

## Common Misuses

- **DI everywhere**: Injecting dependencies that don't need it
- **Service locator**: Using DI as a service locator (anti-pattern)
- **Confusing with DIP**: DI is a technique, DIP is a principle

## Related Concepts

- [Dependency Inversion Principle](Architecture/solid-principles.md) — DIP enables DI
- [Composition over Inheritance](Architecture/composition-over-inheritance.md) — DI enables composition
- [Low Coupling](Architecture/low-coupling.md) — DI reduces coupling

## Project Observations

- TypeScript supports DI through:
  - Constructor injection
  - Interface-based design (`*.port.ts` files)
  - Manual DI (no framework required)
- No DI framework is configured (manual DI is sufficient for this project)

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/martin-oop-2000|martin-oop-2000]]
