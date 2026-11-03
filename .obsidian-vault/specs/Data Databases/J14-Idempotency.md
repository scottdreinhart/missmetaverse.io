---
slug: idempotency
sources:
  - https://www.postgresql.org/docs/
  - https://martinfowler.com/bliki/IdempotentOperation.html
date: 2026-11-02
tags:









  - database
  - idempotency
  - distributed-systems
  - reliability
---

# Idempotency

## Definition

Idempotency is **the property that an operation can be applied multiple times without changing the result beyond the initial application**.

> "An idempotent operation is one whose effect on the system state is the same whether it is executed once or multiple times." — Martin Fowler

## Problem Addressed

Without idempotency:
- **Duplicate processing**: Operations are processed multiple times
- **Data corruption**: Multiple applications change data incorrectly
- **Financial issues**: Charges can be applied multiple times
- **Inconsistent state**: System state is inconsistent

## Scope and Boundaries

- Idempotency ≠ Safety (idempotency guarantees no change on repeat, safety guarantees no harm)
- Idempotency = Reliability (idempotency improves reliability)
- Idempotency is a **system property**, not a pattern

## When to Apply

- When building distributed systems
- when network failures can cause retries
- when financial transactions are involved
- when message queues are used

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Idempotency requires tracking |
| **Storage** — Need to track processed operations |
| **Time** — Implementing idempotency takes time |

## Common Misuses

- **Everything idempotent**: Not every operation can be made idempotent
- **Ignoring tracking**: Idempotency requires tracking processed operations
- **Confusing with safety**: Idempotency guarantees no change on repeat, not that the operation is safe

## Related Concepts

- [Retry with Backoff](Architecture/retry-with-backoff.md) — Retry with backoff benefits from idempotency
- [Transactional Outbox](Architecture/transactional-outbox.md) — Transactional outbox ensures idempotency
- [Dead-Letter Queues](Architecture/dead-letter-queues.md) — Dead-letter queues handle non-idempotent operations

## Project Observations

- The project uses idempotency:
  - TypeScript can enforce idempotency through type system
  - The project's architecture patterns note covers distributed systems concepts
  - No evidence of idempotency in existing code (src/ is empty)
- File naming conventions support idempotency:
  - `*.repository.ts` — Repository files
  - `*.service.ts` — Service files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




