---
slug: explicit-error-modeling
tags:
  - core-concepts

  - coding-type-system-best-practices
---

# Explicit Error Modeling

> **Purpose:** Represent errors as types, not exceptions.
> **Last Updated:** 2026-11-03

## concept_id
`coding-explicit-error-modeling`

## title
Explicit Error Modeling

## aliases
- Explicit Error Modeling
- Result Type
- Error as Type
- Either Type

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- API design
- Business logic
- Data transformation
- Domain modeling

## tags
- type/practice
- domain/coding
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- goF-1994

## related_concept_ids
- coding-strict-typing
- coding-parse-dont-validate
- coding-explicit-over-implicit
- arch-fail-fast
- arch-command-query-separation

## Definition

Explicit Error Modeling is a practice where errors are represented as types (e.g., Result<T, E> or Either<T, E>) rather than using exceptions. This makes error handling explicit and type-safe.

## Problem Addressed

Without explicit error modeling:
- Errors are hidden in exceptions
- Error handling is scattered
- Type system doesn't enforce error handling
- Errors are forgotten

## Scope and Boundaries

Explicit error modeling applies to:
- API design
- Business logic
- Data transformation
- Domain modeling

Explicit error modeling does not apply to:
- Infrastructure errors
- System errors
- Unrecoverable errors
- Programming errors

## When to Apply

- Designing APIs
- Writing business logic
- Transforming data
- Modeling domain errors

## Tradeoffs and When to Avoid

- **Verbosity**: Result types can be verbose
- **Learning curve**: Advanced type features have learning curves
- **Not for infrastructure**: Infrastructure errors should use exceptions
- **Not for system errors**: System errors should use exceptions

## Implementation Guidance

1. **Define Result type**: Create Result<T, E> type
2. **Use in functions**: Return Result from functions
3. **Handle errors**: Handle errors explicitly
4. **Chain operations**: Chain operations with Result
5. **Test errors**: Test error paths

## Verification

- [ ] Result type is defined
- [ ] Functions return Result
- [ ] Errors are handled explicitly
- [ ] Operations are chained
- [ ] Error paths are tested

## Common Misuses

- **Using exceptions**: Using exceptions instead of Result
- **Ignoring errors**: Not handling errors
- **Over-engineering**: Not all functions need Result
- **Not testing**: Not testing error paths

## Related Concepts

- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[Coding Type Systems/parse-dont-validate]] â€” Parse, Don't Merely Validate
- [[Architecture/fail-fast]] â€” Fail Fast
- [[Architecture/command-query-separation]] â€” Command-Query Separation

## Project Observations

The project uses TypeScript, which supports explicit error modeling through:
- Result type pattern
- Either type pattern
- Type guards
- Discriminated unions

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Explicit Error Modeling Note**
