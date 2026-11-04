---
slug: strict-typing
tags:
  - core-concepts

  - coding-type-system-best-practices
---

# Strict Typing

> **Purpose:** Use type systems to catch errors at compile time.
> **Last Updated:** 2026-11-03

## concept_id
`coding-strict-typing`

## title
Strict Typing

## aliases
- Strict Typing
- Strong Typing
- Type Safety

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- TypeScript projects
- JavaScript projects
- Any language with type system
- Large codebases

## tags
- type/practice
- domain/coding
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- martin-fowler-patterns

## related_concept_ids
- coding-parse-dont-validate
- coding-make-invalid-states-unrepresentable
- coding-discriminated-unions
- coding-exhaustive-handling
- coding-immutability

## Definition

Strict Typing is a coding practice that leverages the type system to catch errors at compile time rather than runtime. It involves enabling strict mode, avoiding `any`, and using types to express constraints.

## Problem Addressed

Without strict typing:
- Type errors occur at runtime
- Refactoring is risky
- Documentation is incomplete
- IDE support is limited

## Scope and Boundaries

Strict typing applies to:
- Variable declarations
- Function parameters and return types
- Object shapes
- Generic constraints

Strict typing does not address:
- Runtime validation (use Zod)
- Business logic validation
- User input validation

## When to Apply

- Starting a new TypeScript project
- Refactoring JavaScript to TypeScript
- Large codebases with many developers
- Public APIs and libraries

## Tradeoffs and When to Avoid

- **Learning curve**: Type system can be complex
- **Boilerplate**: More code for type definitions
- **Not for prototypes**: Quick prototypes don't need types
- **Not for dynamic data**: Runtime data needs validation

## Implementation Guidance

1. **Enable strict mode**: Use `strict: true` in tsconfig
2. **Avoid `any`**: Use specific types or `unknown`
3. **Use generics**: For reusable, type-safe code
4. **Define interfaces**: For object shapes
5. **Use type guards**: For runtime type checking

## Verification

- [ ] Strict mode is enabled
- [ ] No `any` types in codebase
- [ ] All functions have return types
- [ ] Interfaces define object shapes
- [ ] Type guards handle runtime checks

## Common Misuses

- **Using `any`**: Avoiding types by using `any`
- **Ignoring `unknown`**: Not using `unknown` for runtime data
- **Over-engineering**: Creating complex types for simple data
- **Confusing with validation**: Types don't validate runtime data

## Related Concepts

- [[Coding Type Systems/parse-dont-validate]] â€” Parse, Don't Merely Validate
- [[Coding Type Systems/make-invalid-states-unrepresentable]] â€” Make Invalid States Unrepresentable
- [[Coding Type Systems/discriminated-unions]] â€” Discriminated Unions
- [[Coding Type Systems/exhaustive-handling]] â€” Exhaustive Handling

## Project Observations

The project uses TypeScript with strict mode, which supports strict typing through:
- `strict: true` in tsconfig
- Type inference
- Generic constraints
- Type guards and narrowing

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Strict Typing Note**
