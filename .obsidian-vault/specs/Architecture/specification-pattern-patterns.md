---
slug: specification-pattern-patterns
sources:
  - https://martinfowler.com/bliki/SpecificationPattern.html
  - https://en.wikipedia.org/wiki/Specification_pattern
date: 2026-11-02
tags:
  - specification-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Specification Pattern Patterns

## Definition

Specification Pattern Patterns are **design patterns for working with specification architecture**.

> "The Specification pattern encapsulates a business rule as a composable predicate." — Eric Evans

## Problem Addressed

Without specification pattern patterns:
- **Complexity**: Business rules are complex and hard to compose
- **Duplication**: Rules are duplicated across code
- **Testing**: Hard to test rules
- **Maintenance**: Hard to maintain rules

## Scope and Boundaries

- Specification Pattern Patterns ≠ Specification Pattern (specification pattern patterns are patterns, specification pattern is a behavioral pattern)
- Specification Pattern Patterns = Memento (specification pattern patterns are patterns, memento is a behavioral pattern)
- Specification Pattern Patterns is a **patterns**, not a behavioral pattern

## When to Apply

- When building applications
- when business rules matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Specification pattern patterns are complex |
| **Time** — Specification pattern patterns take time |
| **Over-specification-pattern** — Don't use specification pattern for everything |

## Common Misuses

- **Everything specification pattern**: Not everything needs specification pattern patterns
- **Confusing with memento**: Specification pattern patterns ≠ memento
- **Over-specification-pattern**: Too many specification patterns create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Specification pattern patterns with DDD
- [Memento Pattern](Architecture/memento-pattern-patterns.md) — Specification pattern patterns with memento
- [Visitor Pattern](Architecture/visitor-pattern-patterns.md) — Specification pattern patterns with visitor

## Project Observations

- The project uses specification pattern patterns:
  - The project's architecture patterns note covers specification pattern patterns (from existing notes)
  - No evidence of specification pattern patterns in existing code (src/ is empty)
- File naming conventions support specification pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
