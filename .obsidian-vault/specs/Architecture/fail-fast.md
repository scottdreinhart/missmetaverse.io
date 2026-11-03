---
slug: fail-fast
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# Fail Fast

> **Purpose:** Detect and report errors as early as possible.
> **Last Updated:** 2026-11-03

## concept_id
`arch-fail-fast`

## title
Fail Fast

## aliases
- Fail Fast
- Early Failure
- Immediate Failure

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Input validation
- Error handling
- Testing
- Debugging

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-design-by-contract
- arch-explicit-error-modeling
- arch-input-validation
- arch-boundary-validation
- arch-pure-functions

## Definition

Fail Fast is a principle where errors are detected and reported as early as possible, rather than allowing invalid states to propagate through the system.

## Problem Addressed

Without fail fast:
- Errors are discovered late
- Debugging is difficult
- Invalid states propagate
- User experience suffers

## Scope and Boundaries

Fail fast applies to:
- Input validation
- Error handling
- Testing
- Debugging

Fail fast does not apply to:
- Graceful degradation
- Retry logic
- Fallback mechanisms
- User-facing error messages

## When to Apply

- Validating input
- Checking preconditions
- Testing code
- Debugging issues

## Tradeoffs and When to Avoid

- **User experience**: Failing fast may frustrate users
- **Graceful degradation**: Some systems should degrade gracefully
- **Retry logic**: Some failures should be retried
- **Fallback mechanisms**: Some failures should use fallbacks

## Implementation Guidance

1. **Validate early**: Check input at method entry
2. **Use assertions**: Use assertions for internal checks
3. **Throw early**: Throw exceptions on invalid input
4. **Document failures**: Document when and why methods fail
5. **Test failures**: Test failure paths

## Verification

- [ ] Input is validated early
- [ ] Assertions are used for internal checks
- [ ] Exceptions are thrown on invalid input
- [ ] Failure paths are tested

## Common Misuses

- **Failing everywhere**: Not all failures should be immediate
- **Ignoring user experience**: Failing fast may frustrate users
- **Not testing failures**: Not testing failure paths
- **Not documenting**: Not documenting when methods fail

## Related Concepts

- [[Architecture/design-by-contract]] â€” Design by Contract
- [[Coding Type Systems/explicit-error-modeling]] â€” Explicit Error Modeling
- [[Security/input-validation]] â€” Input Validation
- [[Coding Type Systems/boundary-validation]] â€” Boundary Validation

## Project Observations

The project follows fail fast through:
- Zod schema validation
- TypeScript type checking
- Runtime type checking
- Clear error messages

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Fail Fast Note**
