---
slug: encapsulation
sources:
  - https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)
  - https://www.geeksforgeeks.org/what-is-encapsulation-in-object-oriented-programming/
date: 2026-11-02
tags:
  - encapsulation
  - principles
  - oop
  - information-hiding
  - --
# Encapsulation

## Definition

Encapsulation is the principle of **bundling data and the methods that operate on that data into a single unit, while hiding internal implementation details**.

> "Encapsulation is the process of combining data and functions into a single component while preventing the internal state from being accessed directly." â€” Object-oriented programming principle

## Problem Addressed

Without encapsulation:
- **Uncontrolled mutation**: External code can modify internal state arbitrarily
- **Inconsistent state**: No validation on state changes
- **Fragile code**: Internal changes break external code
- **Debugging difficulty**: Hard to track state changes

## Scope and Boundaries

- Encapsulation is about **bundling + hiding**, not just hiding
- It applies at all levels: classes, modules, functions, variables
- Encapsulation â‰  Information Hiding (encapsulation bundles, information hiding restricts access)

## When to Apply

- When designing classes or modules
- When managing shared state
- When creating public APIs
- When protecting invariants

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Over-encapsulation** | Too many layers of wrapping add complexity |
| **False encapsulation** | Hiding without bundling (just private variables) |
| **Testing difficulty** | Hard to test internal state |

## Common Misuses

- **Private everything**: Making all members private when some should be internal
- **Getter/overload**: Using getters/setters that expose internal state
- **Confusing with information hiding**: Encapsulation bundles, information hiding restricts

## Related Concepts

- **Information Hiding** â€” Encapsulation enables information hiding
- **Single Responsibility Principle** â€” Each class encapsulates one responsibility
- **Immutability** â€” Stronger form of encapsulation

## Project Observations

- TypeScript's class modifiers (`private`, `protected`, `public`) support encapsulation
- Value objects (Money, Email, Address) encapsulate validation and behavior
- File naming conventions (`*.entity.ts`, `*.value-object.ts`) encourage encapsulation

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]



