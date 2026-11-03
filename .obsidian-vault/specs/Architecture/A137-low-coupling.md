---
slug: low-coupling
sources:
  - https://en.wikipedia.org/wiki/Coupling_(computer_programming)
  - https://blog.cleancoder.com/uncle-bob/2014/08/14/TheCleanArchitecture.html
date: 2026-11-02
tags:










  - coupling
  - principles
  - design
  - modularity
  - dependency-inversion
---

# Low Coupling

## Definition

Low Coupling is the principle that **modules should have minimal dependencies on other modules**. Changes in one module should have minimal impact on other modules.

> "Coupling is a measure of how closely connected two modules are. Low coupling is desirable." — Robert C. Martin

## Problem Addressed

High coupling leads to:
- **Fragile changes**: Changing one module breaks many others
- **Testing difficulty**: Hard to test in isolation
- **Reusability**: Coupled modules can't be reused independently
- **Team coordination**: Developers block each other's work

## Scope and Boundaries

- Coupling is about **dependencies between modules**, not between functions within a module
- Some coupling is necessary — the goal is **minimal necessary coupling**
- Coupling ≠ Cohesion (they are complementary, not opposing)

## When to Apply

- When designing module boundaries
- When choosing between inheritance and composition
- When evaluating dependency direction
- When refactoring tightly-coupled code

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Indirection** | Too many abstractions add complexity |
| **Performance** | Extra layers of indirection can impact performance |
| **Over-engineering** | Abstracting before it's needed |

## Common Misuses

- **Zero coupling**: Trying to eliminate all dependencies (impossible)
- **Interface obsession**: Creating interfaces for everything
- **Ignoring transitive coupling**: A depends on B depends on C

## Related Concepts

- **Dependency Inversion Principle** — DIP enables low coupling
- **High Cohesion** — High cohesion + low coupling = good design
- **Composition over Inheritance** — Composition reduces coupling
- **Low Coupling** — Complementary to High Cohesion

## Project Observations

- The project's architecture naturally supports low coupling:
  - React components are loosely coupled via props
  - Vite plugins are independent
  - TypeScript interfaces define module boundaries
- File naming conventions (`*.port.ts`, `*.adapter.ts`) support low coupling via dependency inversion

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]
- [[Sources/martin-clean-architecture-2017|martin-clean-architecture-2017]]



