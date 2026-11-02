---
slug: command-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Command_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - command-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Command Pattern Patterns

## Definition

Command Pattern Patterns are **design patterns for working with command architecture**.

> "The Command pattern encapsulates a request as a object, thereby letting you parameterize objects with different requests." — GoF

## Problem Addressed

Without command pattern patterns:
- **Coupling**: Requests are coupled to receivers
- **Flexibility**: Can't queue or log requests
- **Testing**: Hard to test requests
- **Maintenance**: Hard to maintain requests

## Scope and Boundaries

- Command Pattern Patterns ≠ Command Pattern (command pattern patterns are patterns, command pattern is a behavioral pattern)
- Command Pattern Patterns = Mediator (command pattern patterns are patterns, mediator is a behavioral pattern)
- Command Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when requests matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Command pattern patterns are complex |
| **Time** — Command pattern patterns take time |
| **Over-command-pattern** — Don't use command pattern for everything |

## Common Misuses

- **Everything command pattern**: Not everything needs command pattern patterns
- **Confusing with mediator**: Command pattern patterns ≠ mediator
- **Over-command-pattern**: Too many command patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Command pattern patterns with DDD
- [Mediator Pattern](Architecture/mediator-pattern-patterns.md) — Command pattern patterns with mediator
- [Observer Pattern](Architecture/observer-pattern-patterns.md) — Command pattern patterns with observer

## Project Observations

- The project uses command pattern patterns:
  - The project's architecture patterns note covers command pattern patterns (from existing notes)
  - No evidence of command pattern patterns in existing code (src/ is empty)
- File naming conventions support command pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
