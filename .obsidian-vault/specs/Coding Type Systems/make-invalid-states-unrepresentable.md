---
slug: make-invalid-states-unrepresentable
---

# Make Invalid States Unrepresentable

> **Purpose:** Use types to prevent invalid states at compile time.
> **Last Updated:** 2026-11-03

## concept_id
`coding-make-invalid-states-unrepresentable`

## title
Make Invalid States Unrepresentable

## aliases
- Make Invalid States Unrepresentable
- Type-Safe States
- Compile-Time Validation

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- State management
- Domain modeling
- API design
- Configuration

## tags
- type/practice
- domain/coding
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- zod-documentation

## related_concept_ids
- coding-strict-typing
- coding-parse-dont-validate
- coding-discriminated-unions
- coding-exhaustive-handling
- coding-immutability

## Definition

Make Invalid States Unrepresentable is a practice where types are used to prevent invalid states from being representable in the type system. This catches errors at compile time rather than runtime.

## Problem Addressed

Without this practice:
- Invalid states are possible at runtime
- Validation is scattered across the codebase
- Errors are discovered late
- Types don't guarantee validity

## Scope and Boundaries

This practice applies to:
- State management
- Domain modeling
- API design
- Configuration

This practice does not apply to:
- Runtime data (use validation)
- User input (use validation)
- External data (use validation)

## When to Apply

- Designing state machines
- Modeling domain states
- Creating API responses
- Defining configuration

## Tradeoffs and When to Avoid

- **Complexity**: Complex types can be hard to understand
- **Learning curve**: Advanced type features have learning curves
- **Not for runtime data**: Runtime data needs validation
- **Not for user input**: User input needs validation

## Implementation Guidance

1. **Use discriminated unions**: For mutually exclusive states
2. **Use type aliases**: For constrained types
3. **Use generics**: For type-safe collections
4. **Use readonly**: For immutable state
5. **Use type guards**: For runtime type checking

## Verification

- [ ] Invalid states are not representable
- [ ] Types catch errors at compile time
- [ ] State machines are type-safe
- [ ] Domain states are type-safe

## Common Misuses

- **Using `any`**: Using `any` instead of proper types
- **Ignoring runtime**: Not validating runtime data
- **Over-engineering**: Creating complex types for simple data
- **Not testing**: Not testing type safety

## Related Concepts

- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[Coding Type Systems/parse-dont-validate]] â€” Parse, Don't Merely Validate
- [[Coding Type Systems/discriminated-unions]] â€” Discriminated Unions
- [[Coding Type Systems/exhaustive-handling]] â€” Exhaustive Handling

## Project Observations

The project uses TypeScript, which supports this practice through:
- Discriminated unions
- Type guards
- Readonly properties
- Generic constraints

## Sources

- [[Sources/typescript-documentation|Microsoft â€” TypeScript Documentation]]
- [[Sources/zod-documentation|Zod â€” TypeScript-first schema validation]]

**End of Make Invalid States Unrepresentable Note**
