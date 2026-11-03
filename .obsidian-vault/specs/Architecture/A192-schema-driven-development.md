---
slug: schema-driven-development
sources:
  - https://zod.dev/
  - https://en.wikipedia.org/wiki/Data_validation
date: 2026-11-02
tags:










  - schema-driven
  - validation
  - zod
  - typescript
---

# Schema-Driven Development

## Definition

Schema-Driven Development is an **approach where data validation and transformation are defined by schemas rather than manual validation logic**.

> "Schemas provide a declarative way to validate and transform data." — Zod documentation

## Problem Addressed

Manual validation leads to:
- **Boilerplate**: Repeated validation code
- **Inconsistency**: Different validation in different places
- **Type safety**: Hard to keep types in sync with validation
- **Maintenance**: More code to maintain

## Scope and Boundaries

- Schema-Driven ≠ Data-Driven (schema-driven is about validation, data-driven is about structure)
- Schema-Driven ≠ Configuration-Driven (schema-driven is about data, config-driven is about system config)
- Schema-Driven is an **approach**, not a specific pattern

## When to Apply

- When validating user input
- When validating API requests/responses
- When transforming data
- When type safety matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Learning curve** — Need to learn schema library |
| **Performance** — Schema validation has overhead |
| **Complexity** — Complex schemas can be hard to read |

## Common Misuses

- **Everything validated**: Not everything needs validation
- **Confusing with data-driven**: Schema-driven ≠ data-driven
- **Over-validating**: Too much validation creates complexity

## Related Concepts

- [Data-Driven Design](Architecture/data-driven-design.md) — Complementary approach
- [Configuration-Driven Development](Architecture/configuration-driven-development.md) — Complementary approach
- [TypeScript Best Practices](../TypeScript/ts-best-practices.md) — Type safety

## Project Observations

- The project uses schema-driven development:
  - Zod is used for validation (from existing notes)
  - TypeScript types are used for type safety
  - No evidence of manual validation in existing code
- File naming conventions support schema-driven development:
  - `*.schema.ts` — Schema definitions
  - `*.types.ts` — Type definitions

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



