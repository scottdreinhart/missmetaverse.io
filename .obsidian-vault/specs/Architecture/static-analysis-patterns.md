---
slug: static-analysis-patterns
sources:
  - https://en.wikipedia.org/wiki/Static_program_analysis
  - https://www.typescriptlang.org/
date: 2026-11-02
tags:
  - static-analysis
  - typescript
  - eslint
  - patterns
---

# Static Analysis Patterns

## Definition

Static Analysis Patterns are **design patterns for working with static analysis tools**.

> "Static program analysis is the analysis that is performed on programs without executing them." — Wikipedia

## Problem Addressed

Without static analysis patterns:
- **Errors**: Errors are not caught before runtime
- **Quality**: Code quality is inconsistent
- **Security**: Security issues are not detected
- **Maintenance**: Hard to maintain code without analysis

## Scope and Boundaries

- Static Analysis Patterns ≠ Static Analysis (static analysis patterns are patterns, static analysis is a technique)
- Static Analysis Patterns ≠ Linting (static analysis patterns are patterns, linting is a technique)
- Static Analysis Patterns is a **patterns**, not a technique

## When to Apply

- When building software
- when code quality matters
- when security is important
- when maintainability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Static analysis patterns are complex |
| **Time** — Static analysis patterns take time |
| **Over-static-analysis** — Don't analyze everything |

## Common Misuses

- **Everything statically analyzed**: Not everything needs static analysis patterns
- **Confusing with linting**: Static analysis patterns ≠ linting
- **Over-static-analysis**: Too much static analysis creates complexity

## Related Concepts

- [Code Quality](Architecture/code-quality.md) — Static analysis patterns with code quality
- [Linting](Architecture/linting.md) — Static analysis patterns with linting
- [TypeScript Best Practices](../TypeScript/ts-best-practices.md) — Static analysis patterns with TypeScript

## Project Observations

- The project uses static analysis patterns:
  - The project's quality and delivery note covers static analysis patterns (from existing notes)
  - No evidence of static analysis patterns in existing code (src/ is empty)
- File naming conventions support static analysis patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

