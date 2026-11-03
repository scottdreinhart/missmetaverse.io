---
slug: performance-budgets
sources:
  - https://web.dev/performance-budgets/
  - https://vitejs.dev/
date: 2026-11-02
tags:









  - performance-budgets
  - performance
  - monitoring
  - quality
---

# Performance Budgets

## Definition

Performance Budgets are **limits on performance metrics (bundle size, load time, etc.) that prevent performance regression**.

> "A performance budget is a limit on a performance metric that prevents performance regression." — web.dev

## Problem Addressed

Without performance budgets:
- **Performance regression**: Performance degrades over time
- **No limits**: No limits on bundle size or load time
- **User experience**: Users experience slow performance
- **No accountability**: No accountability for performance

## Scope and Boundaries

- Performance Budgets ≠ Performance Optimization (performance budgets prevent regression, optimization improves performance)
- Performance Budgets = Limits (performance budgets set limits)
- Performance Budgets is a **quality gate**, not a pattern

## When to Apply

- When building web applications
- when performance is important
- when multiple developers work on the codebase
- when performance regression is a concern

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Performance budgets add tooling complexity |
| **Time** — Setting up performance budgets takes time |
| **Rigidity**: Too strict budgets can limit features |

## Common Misuses

- **Everything budgeted**: Not every metric needs a budget
- **Too strict**: Too strict budgets can limit features
- **Confusing with optimization**: Performance budgets prevent regression, optimization improves performance

## Related Concepts

- [Performance Optimization](Frontend UI/performance-optimization-patterns.md) — Performance optimization improves performance
- [Profiling](Frontend UI/profiling-patterns.md) — Profiling identifies performance issues
- [Vite Configuration](Performance/vite-configuration.md) — Vite supports performance budgets

## Project Observations

- The project uses performance budgets:
  - Vite supports performance budgets through build analysis
  - web-vitals supports performance budgets through metrics
  - The project's architecture patterns note covers performance concepts
  - No evidence of performance budgets in existing code (src/ is empty)
- File naming conventions support performance budgets:
  - `*.config.ts` — Config files
  - `*.metrics.ts` — Metrics files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




