---
slug: refactoring
sources:
  - https://martinfowler.com/books/refactoring.html
  - https://en.wikipedia.org/wiki/Code_refactoring
date: 2026-11-02
tags:
  - refactoring
  - code-quality
  - design
  - maintenance
---

# Refactoring

## Definition

Refactoring is a **technique for improving the internal structure of code without changing its external behavior**.

> "Refactoring is the process of changing a software system in such a way that it does not alter the external behavior of the code yet improves its internal structure." — Martin Fowler

## Problem Addressed

Without refactoring:
- **Technical debt**: Code becomes harder to maintain
- **Complexity**: Code becomes harder to understand
- **Bugs**: Complex code is more error-prone
- **Performance**: Code becomes slower over time

## Scope and Boundaries

- Refactoring ≠ Bug fixing (refactoring doesn't change behavior, bug fixing does)
- Refactoring ≠ Feature addition (refactoring is about structure, features are about behavior)
- Refactoring is a **maintenance technique**, not a feature

## When to Apply

- When code is hard to understand
- When adding features is difficult
- When bugs are frequent
- When code is duplicated

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Refactoring takes time |
| **Risk** — Changes can introduce bugs |
| **Scope** — Don't refactor everything |

## Common Misuses

- **Everything refactoring**: Not everything needs refactoring
- **Confusing with bug fixing**: Refactoring ≠ bug fixing
- **Over-refactoring**: Too much refactoring creates instability

## Related Concepts

- [Test-Driven Development](Architecture/test-driven-development.md) — Refactoring with TDD
- [Continuous Integration](Architecture/continuous-integration.md) — Refactoring with CI
- [Code Quality](Architecture/quality-delivery-maintainability.md) — Refactoring improves quality

## Project Observations

- The project uses refactoring:
  - TypeScript helps with safe refactoring (from existing notes)
  - The project's quality and delivery note covers refactoring
  - No evidence of refactoring in existing code (src/ is empty)
- File naming conventions support refactoring:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
