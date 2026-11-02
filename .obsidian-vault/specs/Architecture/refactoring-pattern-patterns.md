---
slug: refactoring-pattern-patterns
sources:
  - https://martinfowler.com/books/refactoring.html
  - https://en.wikipedia.org/wiki/Refactoring
date: 2026-11-02
tags:
  - refactoring-pattern
  - quality-patterns
  - patterns
  - design-patterns
---

# Refactoring Pattern Patterns

## Definition

Refactoring Pattern Patterns are **design patterns for working with refactoring architecture**.

> "Refactoring is the process of changing a software system in such a way that it does not alter the external behavior of the code yet improves its internal structure." — Martin Fowler

## Problem Addressed

Without refactoring pattern patterns:
- **Complexity**: Code is complex and hard to maintain
- **Technical debt**: Technical debt accumulates
- **Testing**: Hard to test code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Refactoring Pattern Patterns ≠ Refactoring (refactoring pattern patterns are patterns, refactoring is a quality pattern)
- Refactoring Pattern Patterns = Code Review (refactoring pattern patterns are patterns, code review is a quality pattern)
- Refactoring Pattern Patterns is a **patterns**, not a quality pattern

## When to Apply

- When building applications
- when code quality matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Refactoring pattern patterns are complex |
| **Time** — Refactoring pattern patterns take time |
| **Over-refactoring** — Don't use refactoring for everything |

## Common Misuses

- **Everything refactoring**: Not everything needs refactoring pattern patterns
- **Confusing with code review**: Refactoring pattern patterns ≠ code review
- **Over-refactoring**: Too much refactoring creates complexity

## Related Concepts

- [Quality Patterns](Architecture/quality-patterns.md) — Refactoring pattern patterns with quality patterns
- [Code Review Pattern](Architecture/code-review-pattern-patterns.md) — Refactoring pattern patterns with code review pattern
- [Component Composition Pattern](Architecture/component-composition-pattern-patterns.md) — Refactoring pattern patterns with component composition pattern

## Project Observations

- The project uses refactoring pattern patterns:
  - The project's architecture patterns note covers refactoring pattern patterns (from existing notes)
  - No evidence of refactoring pattern patterns in existing code (src/ is empty)
- File naming conventions support refactoring pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/microsoft-refactoring-pattern-2024|microsoft-refactoring-pattern-2024]]
