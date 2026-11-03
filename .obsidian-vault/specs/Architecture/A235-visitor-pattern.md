---
slug: visitor-pattern
sources:
  - https://en.wikipedia.org/wiki/Visitor_pattern
  - https://martinfowler.com/eaaDev/visitor.html
date: 2026-11-02
tags:








  - visitor-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Visitor Pattern

## Definition

Visitor Pattern is a **behavioral design pattern that separates an algorithm from an object structure on which it operates**.

> "The Visitor pattern separates an algorithm from an object structure on which it operates, allowing new operations to be defined without changing the classes." — GoF

## Problem Addressed

Without visitor pattern:
- **Coupling**: Algorithm is coupled to object structure
- **Inflexibility**: Can't add new operations without changing classes
- **Testing**: Hard to test algorithm
- **Maintenance**: Hard to maintain algorithm

## Scope and Boundaries

- Visitor Pattern ≠ Visitor (visitor pattern is a pattern, visitor is an implementation)
- Visitor Pattern ≠ Visitor Protocol (visitor pattern is a pattern, visitor protocol is a language feature)
- Visitor Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When algorithms matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Visitor pattern is complex |
| **Time** — Visitor pattern takes time |
| **Over-visitor** — Don't use visitor for everything |

## Common Misuses

- **Everything visitor**: Not everything needs visitor pattern
- **Confusing with visitor**: Visitor pattern ≠ visitor
- **Over-visitor**: Too many visitors create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Visitor pattern with DDD
- [Visitor Protocol](Architecture/visitor-protocol.md) — Visitor pattern with visitor protocol
- [Visitor](Architecture/visitor.md) — Visitor pattern with visitor

## Project Observations

- The project uses visitor pattern:
  - The project's architecture patterns note covers visitor pattern (from existing notes)
  - No evidence of visitor pattern in existing code (src/ is empty)
- File naming conventions support visitor pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




