# Pure Functions

> **Purpose:** Functions that always return same output for same input.
> **Last Updated:** 2026-11-03

---

## concept_id
`coding-pure-functions`

## title
Pure Functions

## aliases
- Pure Functions
- Pure Function
- Referential Transparency

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- Business logic
- Data transformation
- State management
- Testing

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
- coding-immutability
- coding-strict-typing
- coding-explicit-error-modeling
- arch-command-query-separation
- arch-tell-dont-ask

---

## Definition

A Pure Function is a function that:
1. Always returns the same output for the same input
2. Has no side effects (doesn't modify external state)

Pure functions are predictable, testable, and composable.

## Problem Addressed

Without pure functions:
- Functions have unpredictable behavior
- Testing requires mocking
- Refactoring is risky
- Concurrency is difficult

## Scope and Boundaries

Pure functions apply to:
- Business logic
- Data transformation
- State management
- Testing

Pure functions do not apply to:
- I/O operations
- Database operations
- Network operations
- UI updates

## When to Apply

- Writing business logic
- Transforming data
- Computing values
- Writing tests

## Tradeoffs and When to Avoid

- **I/O operations**: I/O operations have side effects
- **Database operations**: Database operations have side effects
- **Network operations**: Network operations have side effects
- **UI updates**: UI updates have side effects

## Implementation Guidance

1. **No external state**: Don't modify external state
2. **Same output**: Always return same output for same input
3. **No side effects**: Don't perform I/O operations
4. **Test easily**: Test without mocking
5. **Compose easily**: Compose with other pure functions

## Verification

- [ ] Function has no side effects
- [ ] Function returns same output for same input
- [ ] Function doesn't modify external state
- [ ] Function is easy to test

## Common Misuses

- **Side effects**: Functions with side effects
- **External state**: Functions that modify external state
- **Not testing**: Not testing pure functions
- **Over-engineering**: Not all functions need to be pure

## Related Concepts

- [[Coding Type Systems/immutability]] — Immutability
- [[Coding Type Systems/strict-typing]] — Strict Typing
- [[Coding Type Systems/explicit-error-modeling]] — Explicit Error Modeling
- [[Architecture/command-query-separation]] — Command-Query Separation

## Project Observations

The project uses TypeScript, which supports pure functions through:
- Immutability patterns
- Type system enforcement
- No global state
- Clear function signatures

## Sources

- [[Sources/typescript-documentation|Microsoft — TypeScript Documentation]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of Pure Functions Note**
