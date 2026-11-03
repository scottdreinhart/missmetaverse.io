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
  - --
# Linting

## Definition

Linting is a **static analysis technique that flags programming errors, bugs, stylistic errors, and suspicious constructs**.

> "Lint, or linting, is the output from a lint tool, a static program analysis tool that flags many kinds of errors that programmers usually miss." â€” Wikipedia

## Problem Addressed

Without linting:
- **Errors**: Linters catch errors before runtime
- **Inconsistency**: Linters enforce consistent style
- **Readability**: Linters improve code readability
- **Maintenance**: Linters make code easier to maintain

## Scope and Boundaries

- Linting â‰  Testing (linting is static analysis, testing is dynamic verification)
- Linting â‰  Formatting (linting checks for errors, formatting checks for style)
- Linting is a **static analysis technique**, not a testing technique

## When to Apply

- When building software
- When code quality matters
- When team productivity is important
- When consistency is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** â€” Linting takes time |
| **Complexity** â€” Linters are complex |
| **Over-linting** â€” Don't lint everything |

## Common Misuses

- **Everything linted**: Not everything needs linting
- **Confusing with testing**: Linting â‰  testing
- **Over-linting**: Too much linting creates noise

## Related Concepts

- [Code Quality](Architecture/code-quality.md) â€” Linting improves quality
- [Automated Testing](Architecture/automated-testing.md) â€” Linting with testing
- [Husky Git Hooks](Architecture/husky-git-hooks.md) â€” Linting with git hooks

## Project Observations

- The project uses linting:
  - ESLint is configured for linting (from existing notes)
  - The project's linting note covers ESLint
  - No evidence of linting in existing code (src/ is empty)
- File naming conventions support linting:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



