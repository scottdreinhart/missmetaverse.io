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
  - --
# Mutation Testing

## Definition

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Mutation Testing is **a testing quality measure that introduces small changes (mutations) to code and checks if tests detect them**.

> "Mutation testing evaluates the quality of tests by introducing small changes to code and checking if tests fail." â€” Wikipedia

## Problem Addressed

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Without mutation testing:
- **False confidence**: High test coverage but tests don't catch bugs
- **Missing assertions**: Tests don't assert enough
- **Poor quality**: Tests don't effectively verify code
- **Maintenance**: Tests pass but code is wrong

## Scope and Boundaries

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- Mutation Testing â‰  Test Coverage (mutation testing measures test quality, test coverage measures test quantity)
- Mutation Testing = Quality (mutation testing measures test quality)
- Mutation Testing is a **testing quality measure**, not a pattern

## When to Apply

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- When building software with critical tests
- when test quality is a concern
- when high test coverage doesn't catch bugs
- when testing effectiveness needs to be measured

## Tradeoffs and When to Avoid

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

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
| **Performance** â€” Mutation testing is slow |
| **Complexity** â€” Mutation testing adds tooling complexity |
| **Time** â€” Running mutation tests takes time |

## Common Misuses

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- **Everything mutation tested**: Mutation testing is slow, don't run it on everything
- **Ignoring failures**: Mutation failures must be understood and fixed
- **Confusing with coverage**: Mutation testing measures test quality, test coverage measures test quantity

## Related Concepts

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [Property-Based Testing](Quality Delivery/property-based-testing.md) â€” Property-based testing complements mutation testing
- [Automated Testing](Quality Delivery/automated-testing.md) â€” Automated testing supports mutation testing
- [Risk-Based Testing](Quality Delivery/risk-based-testing.md) â€” Risk-based testing can prioritize mutation testing

## Project Observations

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- The project uses mutation testing:
  - Stryker Mutator supports mutation testing
  - Vitest supports mutation testing through plugins
  - The project's architecture patterns note covers testing concepts
  - No evidence of mutation testing in existing code (src/ is empty)
- File naming conventions support mutation testing:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
o05-mutation-testing

## title
O05-Mutation-Testing

## aliases
- O05-Mutation-Testing

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




