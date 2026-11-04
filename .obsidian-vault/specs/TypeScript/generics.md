---
slug: generics
tags:
  - typescript-javascript-type-system

  - typescript-type-system-coding
---

# Generics

> **Purpose:** Write reusable, type-safe code with generics.
> **Last Updated:** 2026-11-03

## concept_id
`coding-generics`

## title
Generics

## aliases
- Generics
- Generic Types
- Type Parameters

## category
typescript

## concept_type
type-feature

## research_status
verified

## project_adoption
declared

## applicability
- TypeScript projects
- Reusable code
- Type safety
- Collections

## tags
- type/feature
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- goF-1994

## related_concept_ids
- coding-strict-typing
- typescript-strict-mode
- coding-compile-time-checks
- coding-type-inference
- coding-no-explicit-any

## Definition

Generics are a TypeScript feature that allows you to write reusable, type-safe code by parameterizing types. This enables functions, classes, and interfaces to work with any type while maintaining type safety.

## Problem Addressed

Without generics:
- Code is duplicated for each type
- Type safety is lost with `any`
- Reusability is limited
- Maintenance is difficult

## Scope and Boundaries

Generics apply to:
- Functions
- Classes
- Interfaces
- Type aliases

Generics do not apply to:
- Simple values
- Primitive types
- UI components
- Business logic

## When to Apply

- Writing reusable functions
- Building collections
- Creating interfaces
- Building type-safe code

## Tradeoffs and When to Avoid

- **Complexity**: Generics can be complex
- **Not for simple values**: Simple values don't need generics
- **Not for primitives**: Primitive types don't need generics
- **Not for UI**: UI components don't need generics

## Implementation Guidance

1. **Use type parameters**: Use type parameters in functions
2. **Add constraints**: Add constraints when needed
3. **Use defaults**: Use default type parameters
4. **Test**: Test generic code
5. **Document**: Document generic behavior

## Verification

- [ ] Type parameters are used
- [ ] Constraints are added
- [ ] Defaults are used
- [ ] Code is tested
- [ ] Behavior is documented

## Common Misuses

- **Using any**: Using `any` instead of generics
- **Not constraining**: Not adding constraints when needed
- **Not testing**: Not testing generic code
- **Not documenting**: Not documenting behavior

## Related Concepts

- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[TypeScript/typescript-strict-mode]] â€” TypeScript Strict Mode
- [[TypeScript/compile-time-checks]] â€” Compile-Time Checks
- [[TypeScript/type-inference]] â€” Type Inference

## Project Observations

The project uses generics through:
- Generic functions
- Generic classes
- Generic interfaces
- Type-safe collections

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Generics Note**
