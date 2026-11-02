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
---

# Test-Driven Development

## Definition

Test-Driven Development (TDD) is a **software development process where tests are written before the implementation, following the Red-Green-Refactor cycle**.

> "TDD is not about testing. It's about design. The tests drive the design of the code." — Kent Beck

## Problem Addressed

Without TDD:
- **Poor design**: Code is written without thinking about design
- **Low test coverage**: Tests are an afterthought
- **Regression**: Changes break existing functionality
- **Confidence**: No confidence in changes

## Scope and Boundaries

- TDD ≠ Testing (TDD is a design process, testing is verification)
- TDD ≠ Unit testing (TDD uses unit tests, but is about design)
- TDD is a **development process**, not a testing strategy

## When to Apply

- When building complex logic
- When design matters
- When test coverage is important
- When building libraries or frameworks

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Writing tests first takes time |
| **Learning curve** — TDD is hard to learn |
| **UI testing** — TDD is less effective for UI |

## Common Misuses

- **Everything TDD**: Not everything needs TDD
- **Confusing with testing**: TDD ≠ testing
- **Skipping refactor**: Refactor is essential to TDD

## Related Concepts

- [Continuous Integration](Architecture/continuous-integration.md) — TDD with CI
- [Unit Testing](Architecture/quality-delivery-maintainability.md) — TDD uses unit tests
- [Refactoring](Architecture/quality-delivery-maintainability.md) — TDD includes refactor

## Project Observations

- The project uses TDD:
  - Vitest is configured for testing
  - The project's quality and delivery note covers TDD
  - No evidence of TDD in existing code (src/ is empty)
- File naming conventions support TDD:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
