---
slug: mutation-testing
sources:
  - https://mutatest.com/
  - https://stryker-mutator.io/
date: 2026-11-02
tags:
  - mutation-testing
  - testing
  - quality
  - coverage
---

# Mutation Testing

## Definition

Mutation Testing is **a testing quality measure that introduces small changes (mutations) to code and checks if tests detect them**.

> "Mutation testing evaluates the quality of tests by introducing small changes to code and checking if tests fail." — Wikipedia

## Problem Addressed

Without mutation testing:
- **False confidence**: High test coverage but tests don't catch bugs
- **Missing assertions**: Tests don't assert enough
- **Poor quality**: Tests don't effectively verify code
- **Maintenance**: Tests pass but code is wrong

## Scope and Boundaries

- Mutation Testing ≠ Test Coverage (mutation testing measures test quality, test coverage measures test quantity)
- Mutation Testing = Quality (mutation testing measures test quality)
- Mutation Testing is a **testing quality measure**, not a pattern

## When to Apply

- When building software with critical tests
- when test quality is a concern
- when high test coverage doesn't catch bugs
- when testing effectiveness needs to be measured

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Performance** — Mutation testing is slow |
| **Complexity** — Mutation testing adds tooling complexity |
| **Time** — Running mutation tests takes time |

## Common Misuses

- **Everything mutation tested**: Mutation testing is slow, don't run it on everything
- **Ignoring failures**: Mutation failures must be understood and fixed
- **Confusing with coverage**: Mutation testing measures test quality, test coverage measures test quantity

## Related Concepts

- [Property-Based Testing](Quality Delivery/property-based-testing.md) — Property-based testing complements mutation testing
- [Automated Testing](Quality Delivery/automated-testing.md) — Automated testing supports mutation testing
- [Risk-Based Testing](Quality Delivery/risk-based-testing.md) — Risk-based testing can prioritize mutation testing

## Project Observations

- The project uses mutation testing:
  - Stryker Mutator supports mutation testing
  - Vitest supports mutation testing through plugins
  - The project's architecture patterns note covers testing concepts
  - No evidence of mutation testing in existing code (src/ is empty)
- File naming conventions support mutation testing:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

