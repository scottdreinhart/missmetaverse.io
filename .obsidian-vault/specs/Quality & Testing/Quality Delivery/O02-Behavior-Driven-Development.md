---
slug: bdd
sources:
  - https://behaviorspec.org/
  - https://cucumber.io/
date: 2026-11-02
tags:
  - maturity/deprecated
  - bdd
  - testing
  - behavior-driven
  - cucumber
  - --
# Behavior-Driven Development

## Definition

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Behavior-Driven Development (BDD) is **a software development process that emphasizes collaboration between developers, QA, and non-technical stakeholders through examples**.

> "BDD is a second-generation feedback on behavior-driven techniques that provide a toolkit for teams to deliver quality." â€” Dan North

## Problem Addressed

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Without BDD:
- **Miscommunication**: Stakeholders and developers have different understanding
- **Missing requirements**: Requirements are not clearly defined
- **Testing gaps**: Important behaviors are not tested
- **Documentation**: Documentation is out of sync with code

## Scope and Boundaries

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- BDD â‰  TDD (BDD focuses on behavior, TDD focuses on unit tests)
- BDD = Collaboration (BDD emphasizes collaboration)
- BDD is a **development process**, not a pattern

## When to Apply

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- When building complex business logic
- when collaboration between stakeholders and developers is important
- when documentation needs to be in sync with code
- when testing behavior is critical

## Tradeoffs and When to Avoid

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

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
| **Time** â€” BDD requires more upfront time |
| **Complexity** â€” BDD adds tooling complexity |
| **Over-documentation** â€” Not every feature needs BDD |

## Common Misuses

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- **Everything BDD**: Not every feature needs BDD
- **Gherkin for everything**: Gherkin is not suitable for every test
- **Confusing with TDD**: BDD focuses on behavior, TDD focuses on unit tests

## Related Concepts

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [Test-Driven Development](Quality Delivery/test-driven-development.md) â€” TDD is the precursor to BDD
- [Automated Testing](Quality Delivery/automated-testing.md) â€” Automated testing supports BDD
- [Risk-Based Testing](Quality Delivery/risk-based-testing.md) â€” Risk-based testing complements BDD

## Project Observations

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- The project uses BDD:
  - Cucumber supports BDD
  - Vitest supports BDD through test descriptions
  - The project's architecture patterns note covers testing concepts
  - No evidence of BDD in existing code (src/ is empty)
- File naming conventions support BDD:
  - `*.spec.ts` â€” Spec files
  - `*.test.ts` â€” Test files

## Sources

## concept_id
o02-behavior-driven-development

## title
O02-Behavior-Driven-Development

## aliases
- O02-Behavior-Driven-Development

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




