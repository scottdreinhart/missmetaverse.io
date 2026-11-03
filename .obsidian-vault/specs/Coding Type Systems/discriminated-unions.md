---
slug: discriminated-unions
tags:
  - core-concepts

  - coding   - type-system   - best-practices
---

# Discriminated Unions

> **Purpose:** Use tagged unions for type-safe state representation.
> **Last Updated:** 2026-11-03

## concept_id
`coding-discriminated-unions`

## title
Discriminated Unions

## aliases
- Discriminated Unions
- Tagged Unions
- Variant Types
- Algebraic Data Types

## category
coding-type-systems

## concept_type
type-pattern

## research_status
verified

## project_adoption
declared

## applicability
- State management
- API responses
- Domain modeling
- Event handling

## tags
- type/pattern
- domain/coding
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- goF-1994

## related_concept_ids
- coding-exhaustive-handling
- coding-make-invalid-states-unrepresentable
- coding-strict-typing
- coding-immutability
- coding-pure-functions

## Definition

Discriminated Unions (also known as Tagged Unions or Variant Types) are a TypeScript feature where a type can be one of several distinct types, each identified by a common property (the discriminant).

## Problem Addressed

Without discriminated unions:
- State is represented by strings or booleans
- Type checking is manual
- Invalid states are possible
- Exhaustive handling is difficult

## Scope and Boundaries

Discriminated unions apply to:
- State management
- API responses
- Domain modeling
- Event handling

Discriminated unions do not apply to:
- Simple booleans
- String enums
- Complex objects
- Arrays

## When to Apply

- Modeling mutually exclusive states
- Handling different event types
- Representing API responses
- State machines

## Tradeoffs and When to Avoid

- **Complexity**: Complex unions can be hard to understand
- **Learning curve**: Advanced type features have learning curves
- **Not for simple cases**: Simple cases don't need discriminated unions
- **Not for arrays**: Arrays are different

## Implementation Guidance

1. **Define discriminant**: Create a common property
2. **Define variants**: Create types for each variant
3. **Create union**: Combine types into union
4. **Handle exhaustively**: Use switch statements
5. **Test all variants**: Test all variants

## Verification

- [ ] Discriminant is defined
- [ ] Variants are defined
- [ ] Union is created
- [ ] Handling is exhaustive
- [ ] All variants are tested

## Common Misuses

- **Ignoring discriminant**: Not using a common property
- **Not handling exhaustively**: Not handling all variants
- **Over-engineering**: Creating complex unions for simple data
- **Not testing**: Not testing all variants

## Related Concepts

- [[Coding Type Systems/exhaustive-handling]] â€” Exhaustive Handling
- [[Coding Type Systems/make-invalid-states-unrepresentable]] â€” Make Invalid States Unrepresentable
- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[Coding Type Systems/immutability]] â€” Immutability

## Project Observations

The project uses TypeScript, which supports discriminated unions through:
- Type guards
- Switch statements
- Exhaustive checking
- Type narrowing

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Discriminated Unions Note**
