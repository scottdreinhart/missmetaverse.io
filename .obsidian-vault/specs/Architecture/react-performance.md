---
slug: react-performance
sources:
  - https://react.dev/reference/react
  - https://react.dev/learn/render-and-commit
date: 2026-11-02
tags:
  - react
  - performance
  - optimization
  - patterns
---

# React Performance

## Definition

React Performance is a **practice for optimizing React applications for speed and responsiveness**.

> "React performance optimization is the process of improving the speed and responsiveness of React applications." — React Docs

## Problem Addressed

Without React performance optimization:
- **Speed**: React applications are slow
- **Responsiveness**: React applications are unresponsive
- **User experience**: Poor user experience
- **Cost**: High resource usage increases costs

## Scope and Boundaries

- React Performance ≠ React (React Performance is a practice, React is a library)
- React Performance ≠ Optimization (React Performance is a practice, optimization is a technique)
- React Performance is a **practice**, not a library

## When to Apply

- When building React applications
- when speed matters
- when responsiveness is important
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — React performance is complex |
| **Time** — React performance takes time |
| **Over-optimization** — Don't optimize everything |

## Common Misuses

- **Everything optimized**: Not everything needs React performance optimization
- **Confusing with React**: React performance ≠ React
- **Over-optimization**: Too much optimization creates complexity

## Related Concepts

- [React Patterns](../React/react-patterns.md) — React performance with React
- [Performance Optimization](Architecture/performance-optimization.md) — React performance with optimization
- [Vite Optimization](../Bundler/vite-optimization-security.md) — React performance with Vite

## Project Observations

- The project uses React performance:
  - The project's React note covers React performance (from existing notes)
  - No evidence of React performance in existing code (src/ is empty)
- File naming conventions support React performance:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
