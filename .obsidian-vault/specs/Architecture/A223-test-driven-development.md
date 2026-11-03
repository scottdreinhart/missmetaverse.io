---
slug: test-driven-development
sources:
  - https://martinfowler.com/articles/changeTestFirst.html
  - https://en.wikipedia.org/wiki/Test-driven_development
date: 2026-11-02
tags:
  - tdd
  - testing
  - red-green-refactor
  - design
  - --
# Test-Driven Development

## Definition

Test-Driven Development (TDD) is a **software development process where tests are written before the implementation, following the Red-Green-Refactor cycle**.

> "TDD is not about testing. It's about design. The tests drive the design of the code." â€” Kent Beck

## Problem Addressed

Without TDD:
- **Poor design**: Code is written without thinking about design
- **Low test coverage**: Tests are an afterthought
- **Regression**: Changes break existing functionality
- **Confidence**: No confidence in changes

## Scope and Boundaries

- TDD â‰  Testing (TDD is a design process, testing is verification)
- TDD â‰  Unit testing (TDD uses unit tests, but is about design)
- TDD is a **development process**, not a testing strategy

## When to Apply

- When building complex logic
- When design matters
- When test coverage is important
- When building libraries or frameworks

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** â€” Writing tests first takes time |
| **Learning curve** â€” TDD is hard to learn |
| **UI testing** â€” TDD is less effective for UI |

## Common Misuses

- **Everything TDD**: Not everything needs TDD
- **Confusing with testing**: TDD â‰  testing
- **Skipping refactor**: Refactor is essential to TDD

## Related Concepts

- [Continuous Integration](Architecture/continuous-integration.md) â€” TDD with CI
- [Unit Testing](Architecture/quality-delivery-maintainability.md) â€” TDD uses unit tests
- [Refactoring](Architecture/quality-delivery-maintainability.md) â€” TDD includes refactor

## Project Observations

- The project uses TDD:
  - Vitest is configured for testing
  - The project's quality and delivery note covers TDD
  - No evidence of TDD in existing code (src/ is empty)
- File naming conventions support TDD:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



