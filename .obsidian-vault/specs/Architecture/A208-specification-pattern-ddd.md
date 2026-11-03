---
slug: specification-pattern-ddd
sources:
  - https://martinfowler.com/bliki/SpecificationPattern.html
  - https://en.wikipedia.org/wiki/Specification_pattern
date: 2026-11-02
tags:








  - specification-pattern
  - ddd
  - domain-modeling
  - patterns
---

# Specification Pattern (DDD)

## Definition

Specification Pattern is a **design pattern that encapsulates business rules and combines them to form complex queries**.

> "A specification is a boolean expression that evaluates to true or false for a given input." — Martin Fowler

## Problem Addressed

Without specification pattern:
- **Complexity**: Business rules are complex
- **Inconsistency**: Business rules are inconsistent
- **Testing**: Hard to test business rules
- **Maintenance**: Hard to maintain business rules

## Scope and Boundaries

- Specification Pattern ≠ Business Rule (specification pattern is a pattern, business rule is a concept)
- Specification Pattern ≠ Validation (specification pattern is for business rules, validation is for data)
- Specification Pattern is a **design pattern**, not a business rule pattern

## When to Apply

- When building applications
- When business rules matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Specification pattern is complex |
| **Time** — Specification pattern takes time |
| **Over-specification** — Don't specify everything |

## Common Misuses

- **Everything specified**: Not everything needs specification pattern
- **Confusing with business rule**: Specification pattern ≠ business rule
- **Over-specification**: Too many specifications create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Specification pattern with DDD
- [Business Rules](Architecture/business-rules.md) — Specification pattern with business rules
- [Validation](Architecture/validation.md) — Specification pattern with validation

## Project Observations

- The project uses specification pattern:
  - The project's architecture patterns note covers specification pattern (from existing notes)
  - No evidence of specification pattern in existing code (src/ is empty)
- File naming conventions support specification pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




