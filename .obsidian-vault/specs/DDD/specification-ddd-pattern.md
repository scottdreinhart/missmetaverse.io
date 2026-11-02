---
slug: specification-ddd-pattern
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/SpecificationPattern.html
date: 2026-11-02
tags:
  - ddd
  - specification
  - domain-modeling
  - business-rules
---

# Specification (DDD)

## Definition

Specification (DDD) is **a pattern that encapsulates a business rule as a composable predicate**.

> "A specification is a pattern that encapsulates a business rule as a predicate that can be composed with other specifications." — Eric Evans

## Problem Addressed

Without specifications:
- **Complex queries**: Business rules are expressed as complex queries
- **Duplication**: Same rules expressed in multiple places
- **Testing difficulty**: Hard to test business rules
- **Maintenance**: Rules are scattered across the codebase

## Scope and Boundaries

- Specification ≠ Query (specification expresses business rules, query expresses data access)
- Specification = Predicate (specification is a predicate that can be composed)
- Specification is a **domain model building block**, not a pattern

## When to Apply

- When building domain models with complex business rules
- when business rules need to be composed
- when testing business rules is important
- when rules are expressed in multiple places

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Specifications add an abstraction layer |
| **Time** — Implementing specifications takes time |
| **Over-specification** — Simple rules may not need a specification |

## Common Misuses

- **Everything a specification**: Not every rule needs a specification
- **Specification as god object**: Specifications should be small and composable
- **Confusing with validation**: Specifications express business rules, validation checks input

## Related Concepts

- [Domain Invariant](DDD/domain-invariant.md) — Specifications can express domain invariants
- [Entity](DDD/entity.md) — Specifications often evaluate entities
- [Repository](DDD/repository-ddd-pattern.md) — Repositories often use specifications for queries

## Project Observations

- The project uses specifications:
  - TypeScript functions can serve as specifications
  - The project's architecture patterns note covers DDD concepts
  - No evidence of specifications in existing code (src/ is empty)
- File naming conventions support specifications:
  - `*.spec.ts` — Spec files
  - `*.policy.ts` — Policy files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

