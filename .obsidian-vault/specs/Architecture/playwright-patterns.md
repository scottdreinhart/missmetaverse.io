---
slug: playwright-patterns
sources:
  - https://playwright.dev/
  - https://playwright.dev/docs/intro
date: 2026-11-02
tags:
  - playwright
  - testing
  - e2e
  - patterns
---

# Playwright Patterns

## Definition

Playwright Patterns are **design patterns for working with Playwright for end-to-end testing**.

> "Playwright is a framework for writing and running end-to-end tests for web apps." — Playwright Docs

## Problem Addressed

Without Playwright patterns:
- **Testing**: Testing is inconsistent
- **Coverage**: Test coverage is low
- **Speed**: Testing is slow
- **Maintenance**: Hard to maintain tests

## Scope and Boundaries

- Playwright Patterns ≠ Playwright (Playwright patterns are patterns, Playwright is a tool)
- Playwright Patterns ≠ E2E Testing (Playwright patterns are patterns, e2e testing is a practice)
- Playwright Patterns is a **patterns**, not a tool

## When to Apply

- When building applications
- when testing matters
- when coverage is important
- when speed is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Playwright patterns are complex |
| **Time** — Playwright patterns take time |
| **Over-Playwright** — Don't use Playwright for everything |

## Common Misuses

- **Everything Playwright**: Not everything needs Playwright patterns
- **Confusing with Playwright**: Playwright patterns ≠ Playwright
- **Over-Playwright**: Too much Playwright creates complexity

## Related Concepts

- [Testing Patterns](../Testing/testing-patterns.md) — Playwright patterns with testing
- [Vitest Patterns](Architecture/vitest-patterns.md) — Playwright patterns with Vitest
- [Automated Testing](Architecture/automated-testing.md) — Playwright patterns with automated testing

## Project Observations

- The project uses Playwright patterns:
  - The project's Playwright note covers Playwright patterns (from existing notes)
  - No evidence of Playwright patterns in existing code (src/ is empty)
- File naming conventions support Playwright patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

