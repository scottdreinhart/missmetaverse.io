---
slug: property-based-testing
sources:
  - https://github.com/quicktype/quicktype
  - https://vitest.dev/
date: 2026-11-02
tags:
  - property-based-testing
  - testing
  - quicktype
  - vitest
---

# Property-Based Testing

## Definition

Property-Based Testing is **a testing approach that tests properties (invariants) of code by generating random test data rather than hand-crafted examples**.

> "Property-based testing tests properties that should hold for all inputs, generating random test data to find counterexamples." — Wikipedia

## Problem Addressed

Without property-based testing:
- **Missing edge cases**: Hand-crafted tests miss edge cases
- **Insufficient coverage**: Tests don't cover enough inputs
- **False confidence**: Tests pass but code is wrong
- **Maintenance**: Tests must be updated as code changes

## Scope and Boundaries

- Property-Based Testing ≠ Unit Testing (property-based testing generates random inputs, unit testing uses hand-crafted examples)
- Property-Based Testing = Coverage (property-based testing improves test coverage)
- Property-Based Testing is a **testing approach**, not a pattern

## When to Apply

- When building functions with complex input domains
- when edge cases are important
- when hand-crafted tests miss edge cases
- when testing mathematical or transformation logic

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Property-based testing adds tooling complexity |
| **Time** — Writing properties takes time |
| **Debugging** — Random failures can be hard to debug |

## Common Misuses

- **Everything property-based**: Not every function benefits from property-based testing
- **Ignoring counterexamples**: Counterexamples must be understood and fixed
- **Confusing with unit testing**: Property-based testing generates random inputs, unit testing uses hand-crafted examples

## Related Concepts

- [Test-Driven Development](Quality Delivery/test-driven-development.md) — TDD complements property-based testing
- [Automated Testing](Quality Delivery/automated-testing.md) — Automated testing supports property-based testing
- [Mutation Testing](Quality Delivery/mutation-testing.md) — Mutation testing complements property-based testing

## Project Observations

- The project uses property-based testing:
  - Vitest supports property-based testing through plugins
  - TypeScript's type system can help define properties
  - The project's architecture patterns note covers testing concepts
  - No evidence of property-based testing in existing code (src/ is empty)
- File naming conventions support property-based testing:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

