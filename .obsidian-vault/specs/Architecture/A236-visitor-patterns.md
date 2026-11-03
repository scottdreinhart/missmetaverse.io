---
slug: visitor-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Visitor_pattern
  - https://martinfowler.com/eaaDev/adapter.html
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - visitor-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Visitor Pattern Patterns

## Definition

Visitor Pattern Patterns are **design patterns for working with visitor architecture**.

> "The Visitor pattern lets you define new operations without changing the classes of the elements on which it operates." — GoF

## Problem Addressed

Without visitor pattern patterns:
- **Extensibility**: Can't add new operations without changing classes
- **Coupling**: Operations are coupled to classes
- **Testing**: Hard to test operations
- **Maintenance**: Hard to maintain operations

## Scope and Boundaries

- Visitor Pattern Patterns ≠ Visitor Pattern (visitor pattern patterns are patterns, visitor pattern is a behavioral pattern)
- Visitor Pattern Patterns = Chain of Responsibility (visitor pattern patterns are patterns, chain of responsibility is a behavioral pattern)
- Visitor Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when operations matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Visitor pattern patterns are complex |
| **Time** — Visitor pattern patterns take time |
| **Over-visitor-pattern** — Don't use visitor pattern for everything |

## Common Misuses

- **Everything visitor pattern**: Not everything needs visitor pattern patterns
- **Confusing with chain of responsibility**: Visitor pattern patterns ≠ chain of responsibility
- **Over-visitor-pattern**: Too many visitor patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Visitor pattern patterns with DDD
- [Chain of Responsibility Pattern](Architecture/chain-of-responsibility-pattern-patterns.md) — Visitor pattern patterns with chain of responsibility
- [Command Pattern](Architecture/command-pattern-patterns.md) — Visitor pattern patterns with command

## Project Observations

- The project uses visitor pattern patterns:
  - The project's architecture patterns note covers visitor pattern patterns (from existing notes)
  - No evidence of visitor pattern patterns in existing code (src/ is empty)
- File naming conventions support visitor pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




