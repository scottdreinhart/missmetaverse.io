---
slug: make-invalid-states-unrepresentable
sources:
  - https://www.youtube.com/watch?v=rFfWjDnBjAU
  - https://voithos.github.io/blog/posts/make-illegal-states-unrepresentable/
date: 2026-11-02
tags:
  - priority/low
  - maturity/stable
  - domain/backend
  - domain/security
  - type/concept
  - domain/testing
  - type/guide
  - domain/frontend
  - domain/accessibility
  - status/complete
  - type/reference
  - domain/architecture
  - typescript
  - type-systems
  - design
  - safety
---

# Make Invalid States Unrepresentable

## Definition

Make Invalid States Unrepresentable is the principle that **the type system should prevent invalid states from being expressible at compile time**. If a state cannot be represented in the type system, it cannot occur at runtime.

> "Make illegal states unrepresentable: use the type system to prevent invalid states from being expressible." — Functional programming principle

## Problem Addressed

Representable invalid states lead to:
- **Runtime errors**: Invalid states cause crashes
- **Inconsistent data**: Data doesn't satisfy business rules
- **Testing difficulty**: Hard to test all invalid states
- **Security risks**: Invalid states may create vulnerabilities

## Scope and Boundaries

- This is a **type system technique**, not a runtime technique
- It applies to TypeScript, Haskell, Rust, and other typed languages
- It's about **compile-time guarantees**, not runtime validation

## When to Apply

- When designing domain models
- When creating API response types
- When modeling state machines
- When creating configuration types

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complex types** — Complex type unions are hard to read |
| **Boilerplate** — More types to maintain |
| **Learning curve** — Advanced type techniques are hard to learn |

## Common Misuses

- **Over-engineering**: Using complex types for simple cases
- **Ignoring runtime**: TypeScript types don't validate runtime input
- **Confusing with validation**: Type safety ≠ runtime validation

## Related Concepts

- [Parse, Don't Validate](Architecture/parse-dont-validate.md) — Parsing enforces invariants
- [Discriminated Unions](Architecture/coding-practices.md) — Type-safe state representation
- [Exhaustive Handling](Architecture/coding-practices.md) — Handle all valid states

## Project Observations

- TypeScript's type system supports this through:
  - Discriminated unions (Order status types)
  - Generic constraints
  - Template literal types
  - Conditional types
- Value objects (Money, Email, Address) make invalid states unrepresentable

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



