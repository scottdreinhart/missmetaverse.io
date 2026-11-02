---
slug: aggregate-root
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Aggregate.html
date: 2026-11-02
tags:
  - ddd
  - aggregate-root
  - domain-modeling
  - boundary
---

# Aggregate Root

## Definition

Aggregate Root is **the single entry point to an aggregate — all external access to aggregate objects goes through the root**.

> "The root object is the only member of the aggregate that external objects can hold references to." — Eric Evans

## Problem Addressed

Without aggregate roots:
- **Inconsistent state**: External code can bypass consistency rules
- **Complex access**: No clear entry point to the aggregate
- **Transaction issues**: Can't ensure atomic updates
- **Encapsulation**: Aggregate internals are exposed

## Scope and Boundaries

- Aggregate Root ≠ Aggregate (aggregate root is the entry point, aggregate is the cluster)
- Aggregate Root = Boundary (aggregate root defines the access boundary)
- Aggregate Root is a **domain model building block**, not a pattern

## When to Apply

- When building aggregates with multiple objects
- when consistency within an aggregate is critical
- when transaction boundaries need to be enforced
- when external access to aggregate internals must be prevented

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Aggregate roots add modeling complexity |
| **Time** — Designing aggregate roots takes time |
| **Over-aggregate-root** — Simple aggregates may not need a root |

## Common Misuses

- **Every class a root**: Not every class needs to be an aggregate root
- **Cross-root references**: Use IDs, not object references, to reference other aggregate roots
- **Ignoring performance**: Loading entire aggregates can be expensive

## Related Concepts

- [Aggregate](DDD/aggregate.md) — Aggregate root is the entry point to an aggregate
- [Entity](DDD/entity.md) — Aggregate roots are entities
- [Domain Invariant](DDD/domain-invariant.md) — Aggregate roots maintain domain invariants

## Project Observations

- The project uses aggregate roots:
  - TypeScript classes can serve as aggregate roots
  - The project's architecture patterns note covers DDD concepts
  - No evidence of aggregate roots in existing code (src/ is empty)
- File naming conventions support aggregate roots:
  - `*.aggregate.ts` — Aggregate files
  - `*.entity.ts` — Entity files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

