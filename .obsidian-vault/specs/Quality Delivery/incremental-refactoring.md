---
slug: incremental-refactoring
sources:
  - https://martinfowler.com/books/refactoring.html
  - https://www.oreilly.com/library/view/refactoring/9780137858039/
date: 2026-11-02
tags:
  - incremental-refactoring
  - refactoring
  - code-quality
  - maintainability
---

# Incremental Refactoring

## Definition

Incremental Refactoring is **a refactoring approach that makes small, safe, and testable changes to code over time rather than large rewrites**.

> "Incremental refactoring makes small, safe changes to code over time, rather than large rewrites that risk introducing bugs." — Martin Fowler

## Problem Addressed

Without incremental refactoring:
- **Big bang rewrites**: Large rewrites risk introducing bugs
- **Technical debt**: Technical debt accumulates
- **Stalled progress**: No progress while waiting for rewrites
- **Risk**: Large rewrites are high-risk

## Scope and Boundaries

- Incremental Refactoring ≠ Rewrite (incremental refactoring makes small changes, rewrite replaces everything)
- Incremental Refactoring = Safety (incremental refactoring is safe)
- Incremental Refactoring is a **refactoring approach**, not a pattern

## When to Apply

- When building software that needs ongoing maintenance
- when technical debt accumulates
- when large rewrites are too risky
- when continuous improvement is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Incremental refactoring takes time |
| **Complexity** — Managing incremental changes is complex |
| **Partial state**: Code is in a partially refactored state |

## Common Misuses

- **Everything refactored**: Not every piece of code needs refactoring
- **Ignoring tests**: Refactoring requires tests
- **Confusing with features**: Don't use refactoring as an excuse to avoid features

## Related Concepts

- [Refactoring](Quality Delivery/refactoring.md) — Refactoring is the parent concept
- [Test-Driven Development](Quality Delivery/test-driven-development.md) — TDD supports incremental refactoring
- [Code Review](Security/code-review.md) — Code review ensures refactoring quality

## Project Observations

- The project uses incremental refactoring:
  - TypeScript supports incremental refactoring through type system
  - Vitest supports incremental refactoring through testing
  - The project's architecture patterns note covers refactoring concepts
  - No evidence of incremental refactoring in existing code (src/ is empty)
- File naming conventions support incremental refactoring:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
