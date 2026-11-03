---
slug: chain-of-responsibility-pattern-patterns
sources:
  - https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern
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
  - chain-of-responsibility-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Chain of Responsibility Pattern Patterns

## Definition

Chain of Responsibility Pattern Patterns are **design patterns for working with chain of responsibility architecture**.

> "The Chain of Responsibility pattern avoids coupling the sender of a request to its receiver by giving more than one object a chance to handle the request." — GoF

## Problem Addressed

Without chain of responsibility pattern patterns:
- **Coupling**: Sender is coupled to receiver
- **Flexibility**: Can't chain handlers
- **Testing**: Hard to test handlers
- **Maintenance**: Hard to maintain handlers

## Scope and Boundaries

- Chain of Responsibility Pattern Patterns ≠ Chain of Responsibility Pattern (chain of responsibility pattern patterns are patterns, chain of responsibility pattern is a behavioral pattern)
- Chain of Responsibility Pattern Patterns = Command (chain of responsibility pattern patterns are patterns, command is a behavioral pattern)
- Chain of Responsibility Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when requests matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Chain of responsibility pattern patterns are complex |
| **Time** — Chain of responsibility pattern patterns take time |
| **Over-chain-of-responsibility-pattern** — Don't use chain of responsibility pattern for everything |

## Common Misuses

- **Everything chain of responsibility pattern**: Not everything needs chain of responsibility pattern patterns
- **Confusing with command**: Chain of responsibility pattern patterns ≠ command
- **Over-chain-of-responsibility-pattern**: Too many chain of responsibility patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Chain of responsibility pattern patterns with DDD
- [Command Pattern](Architecture/command-pattern-patterns.md) — Chain of responsibility pattern patterns with command
- [Mediator Pattern](Architecture/mediator-pattern-patterns.md) — Chain of responsibility pattern patterns with mediator

## Project Observations

- The project uses chain of responsibility pattern patterns:
  - The project's architecture patterns note covers chain of responsibility pattern patterns (from existing notes)
  - No evidence of chain of responsibility pattern patterns in existing code (src/ is empty)
- File naming conventions support chain of responsibility pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




