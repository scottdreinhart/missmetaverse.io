---
slug: risk-based-testing
sources:
  - https://www.ministryoftesting.com/
  - https://martinfowler.com/articles/risk-based-testing.html
date: 2026-11-02
tags:








  - risk-based-testing
  - testing
  - quality
  - strategy
---

# Risk-Based Testing

## Definition

Risk-Based Testing is **a testing strategy that prioritizes testing efforts based on the risk level of different parts of the system**.

> "Risk-based testing prioritizes testing efforts based on the risk level of different parts of the system." — Martin Fowler

## Problem Addressed

Without risk-based testing:
- **Wasted effort**: Testing low-risk areas while high-risk areas are untested
- **Missing critical tests**: Critical functionality is not tested
- **Time pressure**: Not enough time to test everything
- **Poor ROI**: Testing effort doesn't match risk

## Scope and Boundaries

- Risk-Based Testing ≠ TDD (risk-based testing prioritizes tests, TDD writes tests before code)
- Risk-Based Testing = Prioritization (risk-based testing prioritizes testing efforts)
- Risk-Based Testing is a **testing strategy**, not a pattern

## When to Apply

- When building software with limited testing time
- when some parts of the system are more critical than others
- when testing everything is not feasible
- when risk assessment is available

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Risk assessment adds complexity |
| **Time** — Risk assessment takes time |
| **Subjectivity** — Risk assessment can be subjective |

## Common Misuses

- **Ignoring low-risk**: Low-risk areas still need some testing
- **Static risk assessment**: Risk changes over time
- **Confusing with test-driven**: Risk-based testing prioritizes tests, TDD writes tests before code

## Related Concepts

- [Test-Driven Development](Quality Delivery/test-driven-development.md) — TDD complements risk-based testing
- [Automated Testing](Quality Delivery/automated-testing.md) — Automated testing supports risk-based testing
- [Property-Based Testing](Quality Delivery/property-based-testing.md) — Property-based testing can be applied based on risk

## Project Observations

- The project uses risk-based testing:
  - Vitest supports risk-based testing through test prioritization
  - Playwright supports risk-based testing through E2E test prioritization
  - The project's architecture patterns note covers testing concepts
  - No evidence of risk-based testing in existing code (src/ is empty)
- File naming conventions support risk-based testing:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




