---
slug: domain-invariant
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/DomainInvariant.html
date: 2026-11-02
tags:
  - ddd
  - domain-invariant
  - domain-modeling
  - consistency
---

# Domain Invariant

## Definition

Domain Invariant is **a rule or constraint about the domain that must always be true — invariants define the valid states of domain objects**.

> "An invariant is a rule about the domain that must always be true, regardless of what operations are performed." — Eric Evans

## Problem Addressed

Without domain invariants:
- **Invalid state**: Objects can be in invalid states
- **Business rule violations**: Business rules are not enforced
- **Data corruption**: Invalid data can enter the system
- **Testing issues**: Hard to test business rules

## Scope and Boundaries

- Domain Invariant ≠ Validation (domain invariants are business rules, validation is often UI-level)
- Domain Invariant = Consistency (domain invariants ensure consistency)
- Domain Invariant is a **domain concept**, not a pattern

## When to Apply

- When building domain models
- when business rules must be enforced
- when data integrity is critical
- when testing business rules is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Invariants add validation complexity |
| **Time** — Identifying invariants takes time |
| **Over-invariant** — Not every constraint is an invariant |

## Common Misuses

- **Every constraint an invariant**: Not every constraint needs to be an invariant
- **Ignoring timing**: Invariants must hold at all times, not just at certain points
- **Confusing with validation**: Domain invariants are different from input validation

## Related Concepts

- [Aggregate](DDD/aggregate.md) — Aggregates maintain domain invariants
- [Aggregate Root](DDD/aggregate-root.md) — Aggregate roots enforce domain invariants
- [Design by Contract](Architecture/design-by-contract.md) — Design by contract enforces invariants

## Project Observations

- The project uses domain invariants:
  - TypeScript type system can enforce some invariants
  - Zod can validate domain invariants
  - The project's architecture patterns note covers DDD concepts
  - No evidence of domain invariants in existing code (src/ is empty)
- File naming conventions support domain invariants:
  - `*.policy.ts` — Policy files
  - `*.entity.ts` — Entity files

## Sources

- [[Sources/evans-ddd-ddd-2003|evans-ddd-ddd-2003]]
- [[Sources/fowler-ddd-ddd-2003|fowler-ddd-ddd-2003]]
