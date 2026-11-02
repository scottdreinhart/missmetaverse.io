---
slug: linting
sources:
  - https://eslint.org/
  - https://en.wikipedia.org/wiki/Lint_(software)
date: 2026-11-02
tags:
  - linting
  - eslint
  - code-quality
  - static-analysis
---

# Linting

## Definition

Linting is a **static analysis technique that flags programming errors, bugs, stylistic errors, and suspicious constructs**.

> "Lint, or linting, is the output from a lint tool, a static program analysis tool that flags many kinds of errors that programmers usually miss." — Wikipedia

## Problem Addressed

Without linting:
- **Errors**: Linters catch errors before runtime
- **Inconsistency**: Linters enforce consistent style
- **Readability**: Linters improve code readability
- **Maintenance**: Linters make code easier to maintain

## Scope and Boundaries

- Linting ≠ Testing (linting is static analysis, testing is dynamic verification)
- Linting ≠ Formatting (linting checks for errors, formatting checks for style)
- Linting is a **static analysis technique**, not a testing technique

## When to Apply

- When building software
- When code quality matters
- When team productivity is important
- When consistency is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Linting takes time |
| **Complexity** — Linters are complex |
| **Over-linting** — Don't lint everything |

## Common Misuses

- **Everything linted**: Not everything needs linting
- **Confusing with testing**: Linting ≠ testing
- **Over-linting**: Too much linting creates noise

## Related Concepts

- [Code Quality](Architecture/code-quality.md) — Linting improves quality
- [Automated Testing](Architecture/automated-testing.md) — Linting with testing
- [Husky Git Hooks](Architecture/husky-git-hooks.md) — Linting with git hooks

## Project Observations

- The project uses linting:
  - ESLint is configured for linting (from existing notes)
  - The project's linting note covers ESLint
  - No evidence of linting in existing code (src/ is empty)
- File naming conventions support linting:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
