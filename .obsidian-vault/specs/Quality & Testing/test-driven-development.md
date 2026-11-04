---
slug: test-driven-development
tags:
  - core-concepts

  - quality-testing-best-practices
---

# Test-Driven Development

> **Purpose:** Write tests before implementation to drive design.
> **Last Updated:** 2026-11-03

## concept_id
`testing-tdd`

## title
Test-Driven Development

## aliases
- TDD
- Test-Driven Development
- Red-Green-Refactor

## category
quality-delivery

## concept_type
development-methodology

## research_status
verified

## project_adoption
declared

## applicability
- Complex business logic
- Critical algorithms
- Public APIs
- Refactoring large codebases

## tags
- type/methodology
- domain/testing
- status/verified
- priority/high

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-bdd
- testing-risk-based-testing
- testing-mutation-testing
- arch-incremental-refactoring
- arch-fail-fast

## Definition

Test-Driven Development (TDD) is a development methodology where tests are written before the implementation. The cycle is: Red (write a failing test), Green (write minimal code to pass), Refactor (improve code while keeping tests passing).

## Problem Addressed

Without TDD:
- Tests are written after implementation (or not at all)
- Code design is driven by implementation, not requirements
- Refactoring is risky without tests
- Coverage is an afterthought

## Scope and Boundaries

TDD applies to:
- Business logic
- Critical algorithms
- Public APIs
- Refactoring scenarios

TDD does not apply to:
- UI prototyping
- One-off scripts
- Exploration code
- Visual design

## When to Apply

- Writing new features
- Refactoring existing code
- Critical business logic
- Public APIs

## Tradeoffs and When to Avoid

- **Learning curve**: TDD requires practice and discipline
- **Time investment**: Writing tests first takes more time initially
- **Not for exploration**: Prototyping doesn't benefit from TDD
- **Not for UI**: UI testing is different from TDD

## Implementation Guidance

1. **Write failing test**: Define the desired behavior
2. **Write minimal code**: Make the test pass with minimal implementation
3. **Refactor**: Improve code while keeping tests passing
4. **Repeat**: Continue the cycle for each feature
5. **Keep tests fast**: Tests should run quickly

## Verification

- [ ] Tests are written before implementation
- [ ] Tests fail before code is written
- [ ] Code is minimal to pass tests
- [ ] Code is refactored after tests pass
- [ ] Tests are fast and reliable

## Common Misuses

- **Writing tests after**: Defeating the purpose of TDD
- **Testing implementation**: Testing how, not what
- **Ignoring refactoring**: Not improving code after tests pass
- **Slow tests**: Tests that take too long to run

## Related Concepts

- [[Quality & Testing/behavior-driven-development]] â€” Behavior-Driven Development
- [[Quality & Testing/risk-based-testing]] â€” Risk-Based Testing
- [[Quality & Testing/mutation-testing]] â€” Mutation Testing
- [[Quality & Testing/incremental-refactoring]] â€” Incremental Refactoring

## Project Observations

The project uses Vitest for unit testing, which supports TDD through:
- Fast test execution
- Watch mode for continuous testing
- Mocking and stubbing
- Assertion libraries

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Test-Driven Development Note**
