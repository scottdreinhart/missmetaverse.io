---
slug: memento-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Memento_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - memento-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Memento Pattern Patterns

## Definition

Memento Pattern Patterns are **design patterns for working with memento architecture**.

> "The Memento pattern captures and externalizes an object's internal state so that the object can be restored to this state later." — GoF

## Problem Addressed

Without memento pattern patterns:
- **State preservation**: State can't be preserved
- **Encapsulation**: State is exposed to preserve it
- **Testing**: Hard to test state preservation
- **Maintenance**: Hard to maintain state preservation

## Scope and Boundaries

- Memento Pattern Patterns ≠ Memento Pattern (memento pattern patterns are patterns, memento pattern is a behavioral pattern)
- Memento Pattern Patterns = Visitor (memento pattern patterns are patterns, visitor is a behavioral pattern)
- Memento Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when state preservation matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Memento pattern patterns are complex |
| **Time** — Memento pattern patterns take time |
| **Over-memento-pattern** — Don't use memento pattern for everything |

## Common Misuses

- **Everything memento pattern**: Not everything needs memento pattern patterns
- **Confusing with visitor**: Memento pattern patterns ≠ visitor
- **Over-memento-pattern**: Too many memento patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Memento pattern patterns with DDD
- [Visitor Pattern](Architecture/visitor-pattern-patterns.md) — Memento pattern patterns with visitor
- [Chain of Responsibility Pattern](Architecture/chain-of-responsibility-pattern-patterns.md) — Memento pattern patterns with chain of responsibility

## Project Observations

- The project uses memento pattern patterns:
  - The project's architecture patterns note covers memento pattern patterns (from existing notes)
  - No evidence of memento pattern patterns in existing code (src/ is empty)
- File naming conventions support memento pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

