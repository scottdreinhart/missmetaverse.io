---
slug: bdd
sources:
  - https://behaviorspec.org/
  - https://cucumber.io/
date: 2026-11-02
tags:
  - priority/high
  - maturity/deprecated
  - domain/frontend
  - domain/architecture
  - type/concept
  - status/complete
  - type/guide
  - domain/testing
  - bdd
  - testing
  - behavior-driven
  - cucumber
---

# Behavior-Driven Development

## Definition

Behavior-Driven Development (BDD) is **a software development process that emphasizes collaboration between developers, QA, and non-technical stakeholders through examples**.

> "BDD is a second-generation feedback on behavior-driven techniques that provide a toolkit for teams to deliver quality." — Dan North

## Problem Addressed

Without BDD:
- **Miscommunication**: Stakeholders and developers have different understanding
- **Missing requirements**: Requirements are not clearly defined
- **Testing gaps**: Important behaviors are not tested
- **Documentation**: Documentation is out of sync with code

## Scope and Boundaries

- BDD ≠ TDD (BDD focuses on behavior, TDD focuses on unit tests)
- BDD = Collaboration (BDD emphasizes collaboration)
- BDD is a **development process**, not a pattern

## When to Apply

- When building complex business logic
- when collaboration between stakeholders and developers is important
- when documentation needs to be in sync with code
- when testing behavior is critical

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — BDD requires more upfront time |
| **Complexity** — BDD adds tooling complexity |
| **Over-documentation** — Not every feature needs BDD |

## Common Misuses

- **Everything BDD**: Not every feature needs BDD
- **Gherkin for everything**: Gherkin is not suitable for every test
- **Confusing with TDD**: BDD focuses on behavior, TDD focuses on unit tests

## Related Concepts

- [Test-Driven Development](Quality Delivery/test-driven-development.md) — TDD is the precursor to BDD
- [Automated Testing](Quality Delivery/automated-testing.md) — Automated testing supports BDD
- [Risk-Based Testing](Quality Delivery/risk-based-testing.md) — Risk-based testing complements BDD

## Project Observations

- The project uses BDD:
  - Cucumber supports BDD
  - Vitest supports BDD through test descriptions
  - The project's architecture patterns note covers testing concepts
  - No evidence of BDD in existing code (src/ is empty)
- File naming conventions support BDD:
  - `*.spec.ts` — Spec files
  - `*.test.ts` — Test files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]




