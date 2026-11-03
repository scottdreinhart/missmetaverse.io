---
slug: composition-over-inheritance
sources:
  - https://en.wikipedia.org/wiki/Composition_over_inheritance
  - https://www.artima.com/intv/bloch13.html
  - https://martinfowler.com/bliki/CompositionOverInheritance.html
date: 2026-11-02
tags:








  - composition
  - inheritance
  - principles
  - design
  - martin-fowler
---

# Composition over Inheritance

## Definition

Composition over Inheritance is the principle that **classes should achieve polymorphism through composition (having other objects) rather than inheritance (extending classes)**.

> "Favor object composition over class inheritance." — From the GoF Design Patterns book

## Problem Addressed

Inheritance leads to:
- **Fragile base class problem**: Changes to parent break children
- **Deep hierarchies**: Hard to understand and maintain
- **Rigid structure**: Can't change behavior at runtime
- **Multiple inheritance problems**: Diamond problem, conflicting implementations

## Scope and Boundaries

- Composition ≠ Inheritance (they are alternatives, not complementary)
- Composition is about **having-a** relationship, inheritance is about **is-a**
- Composition requires more boilerplate but is more flexible

## When to Apply

- When designing class hierarchies
- When a class needs behavior from multiple sources
- when behavior needs to change at runtime
- When the base class might change

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **More classes** | Composition creates more small classes |
| **Boilerplate** | More interfaces and adapters to write |
| **Less intuitive** | Composition is less obvious than inheritance |

## Common Misuses

- **Inheritance everywhere**: Using inheritance for code reuse
- **Composition everywhere**: Using composition when inheritance is appropriate (e.g., type hierarchies)
- **Interface bloat**: Creating interfaces just to enable composition

## Related Concepts

- **Low Coupling** — Composition reduces coupling
- **Dependency Inversion Principle** — DIP enables composition
- **Strategy Pattern** — Behavioral pattern using composition
- **Decorator Pattern** — Structural pattern using composition

## Project Observations

- The project's TypeScript setup supports composition via:
  - Dependency injection (constructor injection)
  - Interface-based design (`*.port.ts` files)
  - Utility composition (composable hooks, functions)
- No evidence of deep inheritance hierarchies in existing code

## Sources

- [[Sources/goF-1994|goF-1994]]
- [[Sources/martin-oop-2000|martin-oop-2000]]



