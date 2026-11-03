---
slug: no-explicit-any
tags:
  - typescript   - type-system   - coding
---

# No Explicit Any

> **Purpose:** Avoid using `any` type to maintain type safety.
> **Last Updated:** 2026-11-03

## concept_id
`coding-no-explicit-any`

## title
No Explicit Any

## aliases
- No Explicit Any
- No Any
- Avoid Any

## category
typescript

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- TypeScript projects
- Type safety
- Error prevention
- Code quality

## tags
- type/practice
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
- coding-generics

## Definition

No Explicit Any is a practice that avoids using the `any` type to maintain type safety. Instead, use `unknown`, generics, or proper type definitions.

## Problem Addressed

With `any`:
- Type safety is lost
- Errors occur at runtime
- Refactoring is risky
- Code quality is lower

## Scope and Boundaries

No explicit any applies to:
- Type definitions
- Function parameters
- Variable declarations
- Return types

No explicit any does not apply to:
- External library types
- Migration code
- Temporary code
- Prototypes

## When to Apply

- Writing TypeScript code
- Defining types
- Building type-safe code
- Improving code quality

## Tradeoffs and When to Avoid

- **Migration effort**: Migrating from `any` takes effort
- **External types**: External library types may require `any`
- **Temporary code**: Temporary code may use `any`
- **Prototypes**: Prototypes may use `any`

## Implementation Guidance

1. **Avoid any**: Avoid using `any` type
2. **Use unknown**: Use `unknown` for runtime data
3. **Use generics**: Use generics for reusable code
4. **Add types**: Add proper type definitions
5. **Test**: Test after removing `any`

## Verification

- [ ] `any` type is avoided
- [ ] `unknown` is used for runtime data
- [ ] Generics are used
- [ ] Proper types are added
- [ ] Code is tested

## Common Misuses

- **Using any**: Using `any` type
- **Not using unknown**: Not using `unknown` for runtime data
- **Not using generics**: Not using generics
- **Not testing**: Not testing after removing `any`

## Related Concepts

- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[TypeScript/typescript-strict-mode]] â€” TypeScript Strict Mode
- [[TypeScript/compile-time-checks]] â€” Compile-Time Checks
- [[TypeScript/type-inference]] â€” Type Inference

## Project Observations

The project follows no explicit any through:
- Strict TypeScript mode
- Type safety enforcement
- `unknown` for runtime data
- Generics for reusable code

## Sources

- [[Sources/typescript-documentation|Microsoft â€” TypeScript Documentation]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of No Explicit Any Note**
