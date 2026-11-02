---
slug: aggregate
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Aggregate.html
date: 2026-11-02
tags:
  - ddd
  - aggregate
  - domain-modeling
  - consistency
---

# Aggregate

## Definition

Aggregate is **a cluster of associated objects that we treat as a unit for the purpose of data changes, with a boundary and a root**.

> "An Aggregate is a pattern of one or more domain objects that forms an integrity boundary." — Eric Evans

## Problem Addressed

Without aggregates:
- **Consistency issues**: Related objects can be updated inconsistently
- **Performance**: Loading entire object graphs is expensive
- **Concurrency**: Hard to manage concurrent updates
- **Transaction boundaries**: No clear transaction boundaries

## Scope and Boundaries

- Aggregate ≠ Aggregate Root (aggregate is the cluster, aggregate root is the entry point)
- Aggregate = Consistency (aggregates maintain consistency within their boundary)
- Aggregate is a **domain model building block**, not a pattern

## When to Apply

- When building domain models with complex relationships
- when consistency within a group of objects is important
- when transaction boundaries need to be defined
- when concurrency control is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Aggregates add modeling complexity |
| **Time** — Designing aggregates takes time |
| **Over-aggregate** — Don't create aggregates for simple domains |

## Common Misuses

- **One aggregate per table**: Aggregates don't map to database tables
- **Cross-aggregate references**: Use IDs, not object references, to reference other aggregates
- **Ignoring size**: Aggregates should be small enough to maintain consistency

## Related Concepts

- [Aggregate Root](DDD/aggregate-root.md) — Aggregate root is the entry point to an aggregate
- [Entity](DDD/entity.md) — Aggregates contain entities
- [Domain Invariant](DDD/domain-invariant.md) — Aggregates maintain domain invariants

## Project Observations

- The project uses aggregates:
  - TypeScript modules can serve as aggregate boundaries
  - The project's architecture patterns note covers DDD concepts
  - No evidence of aggregates in existing code (src/ is empty)
- File naming conventions support aggregates:
  - `*.aggregate.ts` — Aggregate files
  - `*.entity.ts` — Entity files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

