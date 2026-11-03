---
slug: immutability
tags:
  - core-concepts

  - coding   - type-system   - best-practices
---

# Immutability

> **Purpose:** Prevent state mutation to avoid side effects.
> **Last Updated:** 2026-11-03

## concept_id
`coding-immutability`

## title
Immutability

## aliases
- Immutability
- Immutable Data
- Immutable State

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- React components
- State management
- Functional programming
- Concurrent systems

## tags
- type/practice
- domain/coding
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- goF-1994

## related_concept_ids
- coding-pure-functions
- coding-strict-typing
- coding-make-invalid-states-unrepresentable
- arch-unidirectional-data-flow

## Definition

Immutability is a coding practice where data cannot be changed after creation. Instead of mutating existing data, new data structures are created with the desired changes.

## Problem Addressed

Without immutability:
- State changes are unpredictable
- Side effects are hard to track
- React re-rendering is inefficient
- Concurrent access causes race conditions

## Scope and Boundaries

Immutability applies to:
- React state
- Function return values
- Configuration data
- Domain models

Immutability does not apply to:
- Temporary variables
- Loop counters
- Mutable collections (when necessary)

## When to Apply

- React state management
- Functional programming
- Concurrent systems
- Configuration data

## Tradeoffs and When to Avoid

- **Memory overhead**: Creating new objects uses memory
- **Performance**: Immutable operations can be slower
- **Not for all data**: Some data needs to be mutable
- **Learning curve**: Immutable thinking takes practice

## Implementation Guidance

1. **Use `readonly`**: Mark properties as readonly
2. **Use `Object.freeze`**: Freeze objects at runtime
3. **Create new objects**: Instead of mutating, create new
4. **Use spread operator**: `{ ...obj, key: value }`
5. **Use immutable libraries**: Immer, Immutable.js

## Verification

- [ ] State is not mutated
- [ ] New objects are created for changes
- [ ] Functions are pure (no side effects)
- [ ] React re-rendering is optimized

## Common Misuses

- **Freezing everything**: Not all data needs to be immutable
- **Ignoring performance**: Immutable operations can be slower
- **Not using React properly**: Mutating state directly
- **Over-engineering**: Not every object needs immutability

## Related Concepts

- [[Coding Type Systems/pure-functions]] â€” Pure Functions
- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[Architecture/A229-unidirectional-data-flow]] â€” Unidirectional Data Flow

## Project Observations

The project uses React and Jotai, which supports immutability through:
- React state (useState, useReducer)
- Jotai atoms (immutable by default)
- TypeScript readonly modifiers
- Spread operator for object updates

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Immutability Note**
