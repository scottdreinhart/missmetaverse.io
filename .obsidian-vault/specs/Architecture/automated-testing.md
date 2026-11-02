---
slug: automated-testing
sources:
  - https://martinfowler.com/articles/practicalTestPyramid.html
  - https://vitest.dev/
date: 2026-11-02
tags:
  - testing
  - automation
  - vitest
  - quality
---

# Automated Testing

## Definition

Automated Testing is a **software testing practice where tests are executed automatically rather than manually**.

> "Automated testing is the practice of using specialized software controls to take care of repetitive manual tasks associated with various other software testing activities." — Wikipedia

## Problem Addressed

Manual testing leads to:
- **Slow feedback**: Manual testing is slow
- **Inconsistency**: Different testers get different results
- **Regression**: Manual testing doesn't catch all regressions
- **Cost**: Manual testing is expensive

## Scope and Boundaries

- Automated Testing ≠ TDD (automated testing is testing, TDD is design)
- Automated Testing ≠ Unit testing (automated testing includes unit, integration, e2e)
- Automated Testing is a **testing practice**, not a specific technique

## When to Apply

- When building software
- When quality matters
- When frequent releases are needed
- When testing is repetitive

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Writing tests takes time |
| **Maintenance** — Tests need maintenance |
| **Complexity** — Automated testing is complex |

## Common Misuses

- **Everything automated**: Not everything needs automated testing
- **Confusing with TDD**: Automated testing ≠ TDD
- **Over-testing**: Too much testing creates maintenance burden

## Related Concepts

- [Test-Driven Development](Architecture/test-driven-development.md) — Automated testing with TDD
- [Continuous Integration](Architecture/continuous-integration.md) — Automated testing with CI
- [Vitest](../Testing/vitest-testing.md) — Automated testing with Vitest

## Project Observations

- The project uses automated testing:
  - Vitest is configured for testing
  - Playwright is configured for e2e testing (from existing notes)
  - The project's testing note covers Vitest
- No evidence of automated testing in existing code (src/ is empty)
- File naming conventions support automated testing:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
