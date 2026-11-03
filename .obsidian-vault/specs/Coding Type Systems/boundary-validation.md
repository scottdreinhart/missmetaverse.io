---
slug: boundary-validation
---

# Boundary Validation

> **Purpose:** Validate data at system boundaries.
> **Last Updated:** 2026-11-03

## concept_id
`coding-boundary-validation`

## title
Boundary Validation

## aliases
- Boundary Validation
- Input Validation
- External Boundary Validation

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- API boundaries
- User input
- External data
- Configuration loading

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
- coding-parse-dont-validate
- coding-strict-typing
- coding-explicit-error-modeling
- arch-fail-fast
- arch-design-by-contract

## Definition

Boundary Validation is a practice where data is validated at system boundaries (APIs, user input, external data) before entering the system.

## Problem Addressed

Without boundary validation:
- Invalid data enters the system
- Errors are discovered late
- Validation is scattered
- Security is compromised

## Scope and Boundaries

Boundary validation applies to:
- API boundaries
- User input
- External data
- Configuration loading

Boundary validation does not apply to:
- Internal data (already validated)
- Compile-time types
- Business logic validation
- Domain model validation

## When to Apply

- Receiving external data
- Processing user input
- Loading configuration
- Integrating with external systems

## Tradeoffs and When to Avoid

- **Over-validation**: Validating data that is already valid
- **Performance**: Validation adds overhead
- **Not for internal data**: Internal data is already validated
- **Not for compile-time types**: Compile-time types are validated at compile time

## Implementation Guidance

1. **Validate at boundaries**: Validate data at system boundaries
2. **Use schema libraries**: Use Zod, Yup, or similar
3. **Return errors**: Return structured errors
4. **Fail fast**: Fail fast on invalid data
5. **Test validation**: Test validation logic

## Verification

- [ ] Data is validated at boundaries
- [ ] Schema libraries are used
- [ ] Errors are structured
- [ ] Validation fails fast
- [ ] Validation is tested

## Common Misuses

- **Not validating**: Not validating external data
- **Over-validating**: Validating data that is already valid
- **Ignoring errors**: Not handling validation errors
- **Not testing**: Not testing validation logic

## Related Concepts

- [[Coding Type Systems/parse-dont-validate]] â€” Parse, Don't Merely Validate
- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[Coding Type Systems/explicit-error-modeling]] â€” Explicit Error Modeling
- [[Architecture/fail-fast]] â€” Fail Fast

## Project Observations

The project uses Zod for boundary validation through:
- Schema definitions
- Runtime validation
- Type inference
- Error handling

## Sources

- [[Sources/typescript-documentation|Microsoft â€” TypeScript Documentation]]
- [[Sources/zod-documentation|Zod â€” TypeScript-first schema validation]]

**End of Boundary Validation Note**
