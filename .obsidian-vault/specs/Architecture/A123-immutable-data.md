---
slug: immutable-data
sources:
  - https://en.wikipedia.org/wiki/Immutable_object
  - https://react.dev/reference/react/useState
date: 2026-11-02
tags:
  - immutability
  - typescript
  - react
  - design
  - --
# Immutability

## Definition

Immutability is the principle that **once an object is created, its state cannot be modified**. Changes produce new objects rather than modifying existing ones.

> "An immutable object is an object whose state cannot be modified after it is created." â€” Wikipedia

## Problem Addressed

Mutable state leads to:
- **Unexpected mutations**: Changes affect other parts of the system
- **Race conditions**: Concurrent modifications cause bugs
- **Testing difficulty**: Hard to track state changes
- **Debugging difficulty**: Hard to trace when state changed

## Scope and Boundaries

- Immutability â‰  Read-only (immutable objects can be copied)
- Immutability â‰  Const (const variables can point to mutable objects)
- Immutability is a **design choice**, not a language guarantee (in TypeScript)

## When to Apply

- When sharing data between components
- When implementing undo/redo
- When implementing caching
- When working with React state

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Memory** â€” New objects create garbage |
| **Performance** â€” Copying can be expensive |
| **Boilerplate** â€” More code to create new objects |

## Common Misuses

- **Everything immutable**: Some things need to be mutable (caches, buffers)
- **False immutability**: Using `const` on mutable objects
- **Over-engineering**: Immutable data structures for simple cases

## Related Concepts

- [Pure Functions](Architecture/coding-practices.md) â€” Pure functions don't mutate
- [Explicit Error Modeling](Architecture/coding-practices.md) â€” Immutability prevents hidden state changes
- [React Patterns](../React/react-patterns) â€” React state should be immutable

## Project Observations

- TypeScript's `readonly` modifier supports immutability
- React 19 encourages immutable state updates
- File naming conventions support immutability:
  - Value objects (`*.value-object.ts`) are immutable by design
  - Entities (`*.entity.ts`) control their own mutations

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]




