---
slug: o03-risk-based-testing
sources:
  - https://www.ministryoftesting.com/
  - https://martinfowler.com/articles/risk-based-testing.html
date: 2026-11-02
tags:
  - risk-based-testing
  - testing
  - quality
  - strategy
  - --
# Risk-Based Testing

## Definition

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Risk-Based Testing is **a testing strategy that prioritizes testing efforts based on the risk level of different parts of the system**.

> "Risk-based testing prioritizes testing efforts based on the risk level of different parts of the system." â€” Martin Fowler

## Problem Addressed

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Without risk-based testing:
- **Wasted effort**: Testing low-risk areas while high-risk areas are untested
- **Missing critical tests**: Critical functionality is not tested
- **Time pressure**: Not enough time to test everything
- **Poor ROI**: Testing effort doesn't match risk

## Scope and Boundaries

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- Risk-Based Testing â‰  TDD (risk-based testing prioritizes tests, TDD writes tests before code)
- Risk-Based Testing = Prioritization (risk-based testing prioritizes testing efforts)
- Risk-Based Testing is a **testing strategy**, not a pattern

## When to Apply

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- When building software with limited testing time
- when some parts of the system are more critical than others
- when testing everything is not feasible
- when risk assessment is available

## Tradeoffs and When to Avoid

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

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
| **Complexity** â€” Risk assessment adds complexity |
| **Time** â€” Risk assessment takes time |
| **Subjectivity** â€” Risk assessment can be subjective |

## Common Misuses

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- **Ignoring low-risk**: Low-risk areas still need some testing
- **Static risk assessment**: Risk changes over time
- **Confusing with test-driven**: Risk-based testing prioritizes tests, TDD writes tests before code

## Related Concepts

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [Test-Driven Development](Quality Delivery/test-driven-development.md) â€” TDD complements risk-based testing
- [Automated Testing](Quality Delivery/automated-testing.md) â€” Automated testing supports risk-based testing
- [Property-Based Testing](Quality Delivery/property-based-testing.md) â€” Property-based testing can be applied based on risk

## Project Observations

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- The project uses risk-based testing:
  - Vitest supports risk-based testing through test prioritization
  - Playwright supports risk-based testing through E2E test prioritization
  - The project's architecture patterns note covers testing concepts
  - No evidence of risk-based testing in existing code (src/ is empty)
- File naming conventions support risk-based testing:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
o03-risk-based-testing

## title
O03-Risk-Based-Testing

## aliases
- O03-Risk-Based-Testing

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




