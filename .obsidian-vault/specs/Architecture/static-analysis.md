---
slug: static-analysis
sources:
  - https://en.wikipedia.org/wiki/Static_program_analysis
  - https://www.typescriptlang.org/
date: 2026-11-02
tags:
  - static-analysis
  - typescript
  - eslint
  - code-quality
---

# Static Analysis

## Definition

Static Analysis is a **software analysis technique that examines code without executing it**.

> "Static program analysis is the analysis that is performed on programs without executing them." — Wikipedia

## Problem Addressed

Without static analysis:
- **Errors**: Errors are not caught before runtime
- **Quality**: Code quality is inconsistent
- **Security**: Security issues are not detected
- **Maintenance**: Hard to maintain code without analysis

## Scope and Boundaries

- Static Analysis ≠ Testing (static analysis is static, testing is dynamic)
- Static Analysis ≠ Linting (static analysis is broader, linting is specific)
- Static Analysis is a **static technique**, not a dynamic technique

## When to Apply

- When building software
- When code quality matters
- When security is important
- When maintainability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Static analysis takes time |
| **Complexity** — Static analysis is complex |
| **Over-analysis** — Don't analyze everything |

## Common Misuses

- **Everything analyzed**: Not everything needs static analysis
- **Confusing with testing**: Static analysis ≠ testing
- **Over-analysis**: Too much analysis creates noise

## Related Concepts

- [Code Quality](Architecture/code-quality.md) — Static analysis improves quality
- [Linting](Architecture/linting.md) — Static analysis with linting
- [TypeScript](../TypeScript/ts-fundamentals.md) — Static analysis with TypeScript

## Project Observations

- The project uses static analysis:
  - TypeScript is configured for static analysis (from existing notes)
  - ESLint is configured for linting (from existing notes)
  - The project's quality and delivery note covers static analysis
- No evidence of static analysis in existing code (src/ is empty)
- File naming conventions support static analysis:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
