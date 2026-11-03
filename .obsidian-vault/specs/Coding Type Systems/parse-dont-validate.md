---
slug: parse-dont-validate
tags:
  - core-concepts

  - coding   - type-system   - best-practices
---

# Parse, Don't Merely Validate

> **Purpose:** Transform input into valid types, not just check them.
> **Last Updated:** 2026-11-03

## concept_id
`coding-parse-dont-validate`

## title
Parse, Don't Merely Validate

## aliases
- Parse, Don't Merely Validate
- Parse Instead of Validate
- Constructive Validation

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- Runtime input handling
- API boundaries
- Configuration loading
- Data deserialization

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
- coding-make-invalid-states-unrepresentable
- coding-boundary-validation
- coding-explicit-error-modeling
- arch-fail-fast

## Definition

Parse, Don't Merely Validate is a practice where input data is transformed into valid types rather than just checked for validity. Instead of returning an error when validation fails, the parser constructs the correct type from the input.

## Problem Addressed

Without parsing:
- Invalid data propagates through the system
- Validation is scattered across the codebase
- Error handling is inconsistent
- Types don't guarantee validity

## Scope and Boundaries

Parsing applies to:
- API request bodies
- Environment variables
- Configuration files
- External data sources

Parsing does not apply to:
- Internal data (already validated)
- Compile-time types
- Business logic validation

## When to Apply

- Handling external input
- Loading configuration
- Deserializing data
- API boundaries

## Tradeoffs and When to Avoid

- **Complexity**: Parsing logic can be complex
- **Performance**: Parsing is slower than validation
- **Not for internal data**: Internal data is already validated

## Implementation Guidance

1. **Use schema libraries**: Zod, Yup, or similar
2. **Parse at boundaries**: Validate and transform at API edges
3. **Return types**: Use parsed types in business logic
4. **Error handling**: Return structured errors
5. **Test parsing**: Verify parsing logic

## Verification

- [ ] Input is parsed at boundaries
- [ ] Parsed types are used in business logic
- [ ] Errors are structured and informative
- [ ] Parsing logic is tested

## Common Misuses

- **Validating only**: Checking validity without transforming
- **Ignoring errors**: Not handling parse failures
- **Over-parsing**: Parsing data that is already valid
- **Confusing with types**: Runtime parsing is different from TypeScript types

## Related Concepts

- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[Coding Type Systems/make-invalid-states-unrepresentable]] â€” Make Invalid States Unrepresentable
- [[Coding Type Systems/boundary-validation]] â€” Boundary Validation
- [[Coding Type Systems/explicit-error-modeling]] â€” Explicit Error Modeling

## Project Observations

The project uses Zod for schema validation, which supports parsing through:
- `z.string().parse()` for transformation
- `z.object()` for complex types
- `z.coerce.*` for type coercion
- `z.transform()` for custom transformations

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S070-zod-documentation|Zod â€” TypeScript-first schema validation]]

**End of Parse, Don't Merely Validate Note**
