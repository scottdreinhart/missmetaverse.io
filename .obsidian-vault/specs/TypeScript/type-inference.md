---
slug: type-inference
---

# Type Inference

> **Purpose:** Let TypeScript infer types automatically.
> **Last Updated:** 2026-11-03

## concept_id
`coding-type-inference`

## title
Type Inference

## aliases
- Type Inference
- TypeScript Inference
- Automatic Type Inference

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
- Type safety
- Code readability
- Developer productivity

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
- coding-generics
- coding-no-explicit-any

## Definition

Type Inference is a TypeScript feature that automatically determines types without explicit annotations. This reduces boilerplate while maintaining type safety.

## Problem Addressed

Without type inference:
- Code is verbose with explicit types
- Maintenance is difficult when types change
- Developer productivity is lower
- Code is harder to read

## Scope and Boundaries

Type inference applies to:
- Variable declarations
- Function return types
- Generic type parameters
- Object properties

Type inference does not apply to:
- Complex generic types
- Recursive types
- Conditional types
- External API responses

## When to Apply

- Declaring variables
- Defining functions
- Creating objects
- Building type-safe code

## Tradeoffs and When to Avoid

- **Complexity**: Complex types may not infer correctly
- **Not for external data**: External data needs explicit types
- **Not for APIs**: API responses need explicit types
- **Not for public APIs**: Public APIs should have explicit types

## Implementation Guidance

1. **Let TypeScript infer**: Let TypeScript infer types when possible
2. **Add annotations**: Add annotations when inference fails
3. **Use return types**: Use return type annotations for public functions
4. **Test**: Test after relying on inference
5. **Review**: Review inferred types

## Verification

- [ ] Types are inferred correctly
- [ ] Annotations are added when needed
- [ ] Return types are annotated
- [ ] Code is tested
- [ ] Types are reviewed

## Common Misuses

- **Not testing**: Not testing inferred types
- **Not reviewing**: Not reviewing inferred types
- **Over-annotating**: Adding annotations when inference works
- **Under-annotating**: Not adding annotations when inference fails

## Related Concepts

- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[TypeScript/typescript-strict-mode]] â€” TypeScript Strict Mode
- [[TypeScript/compile-time-checks]] â€” Compile-Time Checks
- [[TypeScript/generics]] â€” Generics

## Project Observations

The project uses type inference through:
- TypeScript type inference
- Variable declarations
- Function return types
- Generic type parameters

## Sources

- [[Sources/typescript-documentation|Microsoft â€” TypeScript Documentation]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Type Inference Note**
