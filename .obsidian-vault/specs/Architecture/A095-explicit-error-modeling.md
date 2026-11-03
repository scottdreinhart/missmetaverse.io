---
slug: explicit-error-modeling
sources:
  - https://en.wikipedia.org/wiki/Error_handling
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
date: 2026-11-02
tags:
  - error-handling
  - typescript
  - design
  - types
  - --
# Explicit Error Modeling

## Definition

Explicit Error Modeling is the principle that **errors should be modeled as values in the type system rather than using exceptions for control flow**. This makes error handling visible in the function signature.

> "Errors should be values, not exceptions." â€” Functional programming principle

## Problem Addressed

Exception-based error handling leads to:
- **Hidden errors**: Function signature doesn't show possible errors
- **Unchecked errors**: Callers may forget to catch
- **Control flow confusion**: Exceptions disrupt normal flow
- **Testing difficulty**: Hard to test error paths

## Scope and Boundaries

- Error modeling â‰  Exception handling (they are complementary)
- This is a **type system technique**, not a runtime technique
- TypeScript's `Result<T, E>` pattern is the primary implementation

## When to Apply

- When a function can fail in multiple ways
- When error handling is part of the business logic
- When building libraries used by others
- When testing error paths is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Boilerplate** â€” More code to handle errors |
| **Verbosity** â€” Error handling is more explicit |
| **Performance** â€” Result types add overhead |

## Common Misuses

- **Everything as Result**: Not every function needs error modeling
- **Confusing with exceptions**: Both have their place
- **Over-engineering**: Simple errors can use exceptions

## Related Concepts

- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md) â€” Result types use TypeScript
- [Fail Fast](Architecture/fail-fast.md) â€” Early error detection
- [Discriminated Unions](Architecture/coding-practices.md) â€” Result uses discriminated unions

## Project Observations

- TypeScript's type system supports explicit error modeling through:
  - `Result<T, E>` discriminated unions
  - `Error` types
  - Type guards
- No evidence of explicit error modeling in existing code (src/ is empty)

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



