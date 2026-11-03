---
slug: tdd-pattern
sources:
  - https://en.wikipedia.org/wiki/Test-driven_development
  - https://docs.microsoft.com/en-us/azure/architecture/framework/devops/test
date: 2026-11-02
tags:
  - tdd
  - testing
  - red-green-refactor
  - design
# Test-Driven Development (TDD)

## Definition

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
TDD is a development approach where **tests are written before implementation code**, following the Red-Green-Refactor cycle.

> "TDD is not about testing. TDD is a design process." â€” Kent Beck

## Problem Addressed

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Testing after implementation leads to:
- **Insufficient tests**: Tests cover what's easy to test
- **Poor design**: Code is hard to test
- **False confidence**: Tests pass but code is wrong
- **Documentation gap**: Tests are the best documentation

## Scope and Boundaries

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- TDD â‰  Testing (TDD is a design process, testing is verification)
- TDD â‰  100% coverage (TDD produces good tests, not necessarily complete coverage)
- TDD is a **development methodology**, not a testing framework

## When to Apply

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When writing business logic
- When designing APIs
- When complex algorithms are needed
- When building libraries

## Tradeoffs and When to Avoid

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Learning curve** â€” TDD requires practice |
| **Slower initial development** â€” Writing tests first takes time |
| **Not for everything** â€” UI exploration may not benefit |

## Common Misuses

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Testing implementation**: Tests that test how, not what
- **Ignoring refactoring**: Not cleaning up after tests pass
- **TDD everywhere**: Not all code benefits from TDD

## Related Concepts

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Testing Patterns](../Testing/Quality & Testing/test-driven-developments.md) â€” Vitest, Playwright
- [Property-Based Testing](Architecture/quality-delivery-maintainability.md) â€” Complementary to TDD
- [Risk-Based Testing](Architecture/quality-delivery-maintainability.md) â€” Focus testing effort

## Project Observations

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses Vitest for unit testing
- No evidence of TDD in existing code (src/ is empty)
- The project's architecture supports TDD:
  - TypeScript strict mode makes tests more reliable
  - File naming conventions support testable architecture
  - pnpm workspace supports isolated testing

## Sources

## concept_id
a219-tdd-pattern

## title
Test-Driven Development (TDD)

## aliases
- A219-tdd-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/vitest-docs-2024|vitest-docs-2024]]



