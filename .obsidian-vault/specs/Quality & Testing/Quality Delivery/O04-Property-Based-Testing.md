---
slug: o04-property-based-testing
sources:
  - https://github.com/quicktype/quicktype
  - https://vitest.dev/
date: 2026-11-02
tags:
  - maturity/deprecated
  - property-based-testing
  - testing
  - quicktype
  - vitest
  - --
# Property-Based Testing

## Definition

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Property-Based Testing is **a testing approach that tests properties (invariants) of code by generating random test data rather than hand-crafted examples**.

> "Property-based testing tests properties that should hold for all inputs, generating random test data to find counterexamples." â€” Wikipedia

## Problem Addressed

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Without property-based testing:
- **Missing edge cases**: Hand-crafted tests miss edge cases
- **Insufficient coverage**: Tests don't cover enough inputs
- **False confidence**: Tests pass but code is wrong
- **Maintenance**: Tests must be updated as code changes

## Scope and Boundaries

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- Property-Based Testing â‰  Unit Testing (property-based testing generates random inputs, unit testing uses hand-crafted examples)
- Property-Based Testing = Coverage (property-based testing improves test coverage)
- Property-Based Testing is a **testing approach**, not a pattern

## When to Apply

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- When building functions with complex input domains
- when edge cases are important
- when hand-crafted tests miss edge cases
- when testing mathematical or transformation logic

## Tradeoffs and When to Avoid

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

| Cost | Description |
|------|-------------|
| **Complexity** â€” Property-based testing adds tooling complexity |
| **Time** â€” Writing properties takes time |
| **Debugging** â€” Random failures can be hard to debug |

## Common Misuses

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- **Everything property-based**: Not every function benefits from property-based testing
- **Ignoring counterexamples**: Counterexamples must be understood and fixed
- **Confusing with unit testing**: Property-based testing generates random inputs, unit testing uses hand-crafted examples

## Related Concepts

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [Test-Driven Development](Quality Delivery/test-driven-development.md) â€” TDD complements property-based testing
- [Automated Testing](Quality Delivery/automated-testing.md) â€” Automated testing supports property-based testing
- [Mutation Testing](Quality Delivery/mutation-testing.md) â€” Mutation testing complements property-based testing

## Project Observations

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- The project uses property-based testing:
  - Vitest supports property-based testing through plugins
  - TypeScript's type system can help define properties
  - The project's architecture patterns note covers testing concepts
  - No evidence of property-based testing in existing code (src/ is empty)
- File naming conventions support property-based testing:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
o04-property-based-testing

## title
O04-Property-Based-Testing

## aliases
- O04-Property-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




