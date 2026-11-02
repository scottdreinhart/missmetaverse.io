---
slug: profiling
sources:
  - https://developer.mozilla.org/en-US/docs/Web/Performance/Profiling
  - https://vitest.dev/
date: 2026-11-02
tags:
  - profiling
  - performance
  - debugging
  - testing
---

# Profiling

## Definition

Profiling is a **technique for measuring the performance of software to identify bottlenecks and areas for improvement**.

> "Profiling is a form of dynamic program analysis that measures, for example, the frequency and length of various runs of a program in order to develop an accurate model of program behavior." — Wikipedia

## Problem Addressed

Without profiling:
- **Bottlenecks**: Hard to identify performance bottlenecks
- **Optimization**: Hard to know where to optimize
- **Debugging**: Hard to debug performance issues
- **User experience**: Poor user experience due to performance issues

## Scope and Boundaries

- Profiling ≠ Performance Optimization (profiling is measurement, optimization is improvement)
- Profiling ≠ Testing (profiling is measurement, testing is verification)
- Profiling is a **measurement technique**, not an improvement technique

## When to Apply

- When building software
- When performance matters
- When debugging performance issues
- When optimizing performance

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Profiling takes time |
| **Complexity** — Profiling is complex |
| **Over-profiling** — Don't profile everything |

## Common Misuses

- **Everything profiled**: Not everything needs profiling
- **Confusing with optimization**: Profiling ≠ optimization
- **Over-profiling**: Too much profiling creates complexity

## Related Concepts

- [Performance Optimization](Architecture/performance-optimization.md) — Profiling with optimization
- [Automated Testing](Architecture/automated-testing.md) — Profiling with testing
- [Vitest](../Testing/vitest-testing.md) — Profiling with Vitest

## Project Observations

- The project uses profiling:
  - The project's Vitest note covers profiling (from existing notes)
  - No evidence of profiling in existing code (src/ is empty)
- File naming conventions support profiling:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
