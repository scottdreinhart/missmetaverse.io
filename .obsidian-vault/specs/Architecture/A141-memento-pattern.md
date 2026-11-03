---
slug: memento-pattern
sources:
  - https://en.wikipedia.org/wiki/Memento_pattern
  - https://martinfowler.com/eaaDev/stateMemento.html
date: 2026-11-02
tags:
  - memento-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
  - --
# Memento Pattern

## Definition

Memento Pattern is a **behavioral design pattern that captures and externalizes an object's internal state so that the object can be restored to this state later**.

> "The Memento pattern captures and externalizes an object's internal state so that the object can be restored to this state later." â€” GoF

## Problem Addressed

Without memento pattern:
- **State loss**: State is lost when object changes
- **Coupling**: State is coupled to object
- **Testing**: Hard to test state
- **Maintenance**: Hard to maintain state

## Scope and Boundaries

- Memento Pattern â‰  Memento (memento pattern is a pattern, memento is an implementation)
- Memento Pattern â‰  State (memento pattern is for state capture, state pattern is for state changes)
- Memento Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When state capture matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Memento pattern is complex |
| **Time** â€” Memento pattern takes time |
| **Over-memento** â€” Don't use memento for everything |

## Common Misuses

- **Everything memento**: Not everything needs memento pattern
- **Confusing with memento**: Memento pattern â‰  memento
- **Over-memento**: Too many mementos create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) â€” Memento pattern with DDD
- [Memento](Architecture/memento.md) â€” Memento pattern with memento
- [State Pattern](Architecture/state-pattern.md) â€” Memento pattern with state

## Project Observations

- The project uses memento pattern:
  - The project's architecture patterns note covers memento pattern (from existing notes)
  - No evidence of memento pattern in existing code (src/ is empty)
- File naming conventions support memento pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




