---
slug: property-based-testing
---

# Property-Based Testing

> **Purpose:** Test with generated inputs to find edge cases.
> **Last Updated:** 2026-11-03

## concept_id
`testing-property-based`

## title
Property-Based Testing

## aliases
- Property-Based Testing
- PbT
- QuickCheck-style Testing

## category
quality-delivery

## concept_type
testing-methodology

## research_status
verified

## project_adoption
declared

## applicability
- Pure functions
- Algorithms
- Data transformation
- Business logic

## tags
- type/methodology
- domain/testing
- status/verified
- priority/medium

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-tdd
- testing-bdd
- testing-mutation-testing
- testing-contract-testing
- coding-pure-functions

## Definition

Property-Based Testing is a testing methodology where tests are written as properties (invariants that should always hold) rather than specific examples. The test framework generates random inputs to find edge cases.

## Problem Addressed

Without property-based testing:
- Tests only cover specific examples
- Edge cases are missed
- Tests are brittle
- Coverage is limited

## Scope and Boundaries

Property-based testing applies to:
- Pure functions
- Algorithms
- Data transformation
- Business logic

Property-based testing does not apply to:
- UI testing
- Integration testing
- E2E testing
- Database testing

## When to Apply

- Testing pure functions
- Testing algorithms
- Testing data transformation
- Testing business logic

## Tradeoffs and When to Avoid

- **Learning curve**: Property-based testing has learning curves
- **Not for UI**: UI testing is different
- **Not for integration**: Integration testing is different
- **Not for E2E**: E2E testing is different

## Implementation Guidance

1. **Define properties**: Define invariants that should always hold
2. **Generate inputs**: Let framework generate inputs
3. **Shrink failures**: When test fails, find minimal failing case
4. **Combine with examples**: Use both property-based and example-based tests
5. **Test edge cases**: Test edge cases explicitly

## Verification

- [ ] Properties are defined
- [ ] Inputs are generated
- [ ] Failures are shrunk
- [ ] Examples are combined
- [ ] Edge cases are tested

## Common Misuses

- **Testing everything**: Not all code needs property-based testing
- **Ignoring examples**: Not combining with example-based tests
- **Not shrinking**: Not finding minimal failing cases
- **Not testing edge cases**: Not testing edge cases explicitly

## Related Concepts

- [[Quality & Testing/test-driven-development]] â€” Test-Driven Development
- [[Quality & Testing/behavior-driven-development]] â€” Behavior-Driven Development
- [[Quality & Testing/mutation-testing]] â€” Mutation Testing
- [[Quality & Testing/contract-testing]] â€” Contract Testing

## Project Observations

The project uses Vitest, which supports property-based testing through:
- Property-based testing libraries
- Random input generation
- Shrinking failures
- Combination with example-based tests

## Sources

- [[Sources/martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Property-Based Testing Note**
