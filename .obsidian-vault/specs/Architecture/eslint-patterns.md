---
slug: eslint-patterns
sources:
  - https://eslint.org/
  - https://eslint.org/docs/user-guide/configuring
date: 2026-11-02
tags:
  - eslint
  - linting
  - patterns
  - code-quality
---

# ESLint Patterns

## Definition

ESLint Patterns are **design patterns for working with ESLint for linting JavaScript and TypeScript code**.

> "ESLint is a static code analysis tool for identifying problematic patterns found in JavaScript code." — ESLint Docs

## Problem Addressed

Without ESLint patterns:
- **Code quality**: Code quality is poor
- **Consistency**: Code is inconsistent
- **Maintenance**: Hard to maintain code
- **Readability**: Code is hard to read

## Scope and Boundaries

- ESLint Patterns ≠ ESLint (ESLint patterns are patterns, ESLint is a tool)
- ESLint Patterns ≠ Linting (ESLint patterns are patterns, linting is a practice)
- ESLint Patterns is a **patterns**, not a tool

## When to Apply

- When building applications
- when code quality matters
- when consistency is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — ESLint patterns are complex |
| **Time** — ESLint patterns take time |
| **Over-ESLint** — Don't use ESLint for everything |

## Common Misuses

- **Everything ESLint**: Not everything needs ESLint patterns
- **Confusing with ESLint**: ESLint patterns ≠ ESLint
- **Over-ESLint**: Too much ESLint creates complexity

## Related Concepts

- [Linting](Architecture/linting.md) — ESLint patterns with linting
- [Code Quality](Architecture/code-quality.md) — ESLint patterns with code quality
- [TypeScript Best Practices](../TypeScript/ts-best-practices.md) — ESLint patterns with TypeScript

## Project Observations

- The project uses ESLint patterns:
  - The project's linting note covers ESLint patterns (from existing notes)
  - No evidence of ESLint patterns in existing code (src/ is empty)
- File naming conventions support ESLint patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

