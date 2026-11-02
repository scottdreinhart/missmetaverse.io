---
slug: cqrs-pattern
sources:
  - https://martinfowler.com/bliki/CQRS.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs
date: 2026-11-02
tags:
  - cqrs
  - architecture
  - command
  - query
  - cqs
---

# CQRS (Command Query Responsibility Segregation)

## Definition

CQRS is an **architectural pattern that separates read and write operations into different models**. Commands modify state, queries read state.

> "CQRS separates the responsibility of reading data from the responsibility of writing data." — Martin Fowler

## Problem Addressed

Combined read/write models lead to:
- **Complex queries**: Read models optimized for queries conflict with write models
- **Performance**: Different read/write patterns require different optimizations
- **Scalability**: Read and write scales differently

## Scope and Boundaries

- CQS ≠ CQRS (CQS is method-level, CQRS is architectural)
- CQRS does **not** require separate databases
- CQRS does **not** require event sourcing

## When to Apply

- When read and write scales differently
- When read models need different optimization
- When complex queries conflict with write models
- When audit trails are required

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Two models to maintain |
| **Eventual consistency** — Reads may lag writes |
| **Boilerplate** — More code to maintain |

## Common Misuses

- **Over-applying**: Using CQRS for simple CRUD
- **Confusing with CQS**: CQS is method-level, CQRS is architectural
- **Separate databases**: Not required by CQRS

## Related Concepts

- [Command-Query Separation](Architecture/command-query-separation.md) — Method-level CQS
- [Event Sourcing](Architecture/data-modeling-principles.md) — Often used with CQRS
- [Clean Architecture](Architecture/clean-architecture.md) — CQRS fits in use cases layer

## Project Observations

- No evidence of CQRS in existing code (src/ is empty)
- The project's architecture supports CQRS if needed later
- File naming conventions (`*.use-case.ts`, `*.data.ts`) support CQRS separation

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
