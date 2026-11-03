---
slug: a138-make-invalid-states-unrepresentable
sources:
  - https://www.youtube.com/watch?v=rFfWjDnBjAU
  - https://voithos.github.io/blog/posts/make-illegal-states-unrepresentable/
date: 2026-11-02
tags:
  - priority/low
  - typescript
  - type-systems
  - design
  - safety
# Make Invalid States Unrepresentable

## Definition

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Make Invalid States Unrepresentable is the principle that **the type system should prevent invalid states from being expressible at compile time**. If a state cannot be represented in the type system, it cannot occur at runtime.

> "Make illegal states unrepresentable: use the type system to prevent invalid states from being expressible." â€” Functional programming principle

## Problem Addressed

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Representable invalid states lead to:
- **Runtime errors**: Invalid states cause crashes
- **Inconsistent data**: Data doesn't satisfy business rules
- **Testing difficulty**: Hard to test all invalid states
- **Security risks**: Invalid states may create vulnerabilities

## Scope and Boundaries

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- This is a **type system technique**, not a runtime technique
- It applies to TypeScript, Haskell, Rust, and other typed languages
- It's about **compile-time guarantees**, not runtime validation

## When to Apply

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When designing domain models
- When creating API response types
- When modeling state machines
- When creating configuration types

## Tradeoffs and When to Avoid

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complex types** â€” Complex type unions are hard to read |
| **Boilerplate** â€” More types to maintain |
| **Learning curve** â€” Advanced type techniques are hard to learn |

## Common Misuses

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Over-engineering**: Using complex types for simple cases
- **Ignoring runtime**: TypeScript types don't validate runtime input
- **Confusing with validation**: Type safety â‰  runtime validation

## Related Concepts

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Parse, Don't Validate](Architecture/parse-dont-validate.md) â€” Parsing enforces invariants
- [Discriminated Unions](Architecture/Architecture/clean-architecture.md) â€” Type-safe state representation
- [Exhaustive Handling](Architecture/Architecture/clean-architecture.md) â€” Handle all valid states

## Project Observations

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- TypeScript's type system supports this through:
  - Discriminated unions (Order status types)
  - Generic constraints
  - Template literal types
  - Conditional types
- Value objects (Money, Email, Address) make invalid states unrepresentable

## Sources

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



