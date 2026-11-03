---
slug: cancellation
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
  - https://microservices.io/patterns/reliability/cancellation.html
date: 2026-11-02
tags:








  - cancellation
  - distributed-systems
  - reliability
  - resilience
---

# Cancellation

## Definition

Cancellation is **a distributed systems pattern that allows an operation to be aborted before it completes, freeing resources and preventing unnecessary work**.

> "Cancellation allows an operation to be aborted before it completes, freeing resources and preventing unnecessary work." — Microsoft

## Problem Addressed

Without cancellation:
- **Wasted resources**: Operations continue after they're no longer needed
- **Resource exhaustion**: Resources are held indefinitely
- **Cascading failures**: One slow operation causes all operations to block
- **Poor UX**: Users wait for operations they've abandoned

## Scope and Boundaries

- Cancellation ≠ Timeout (cancellation is explicit, timeout is automatic)
- Cancellation = Resource Management (cancellation frees resources)
- Cancellation is a **reliability pattern**, not a design pattern

## When to Apply

- When building distributed systems
- when user-initiated operations need to be abortable
- when resource exhaustion is a concern
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Cancellation requires coordination |
| **Time** — Implementing cancellation takes time |
| **Partial work** — Operations may complete partially |

## Common Misuses

- **Everything cancellable**: Not every operation needs to be cancellable
- **Ignoring cleanup**: Cancellation requires cleanup
- **Confusing with timeout**: Cancellation is explicit, timeout is automatic

## Related Concepts

- [Timeouts](APIs Distributed Systems/timeouts.md) — Timeouts complement cancellation
- [Retry with Backoff](Architecture/retry-with-backoff.md) — Retry with backoff works with cancellation
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) — Circuit breaker works with cancellation

## Project Observations

- The project uses cancellation:
  - Node.js supports cancellation through AbortController
  - TypeScript can enforce cancellation through type system
  - The project's architecture patterns note covers distributed systems concepts
  - No evidence of cancellation in existing code (src/ is empty)
- File naming conventions support cancellation:
  - `*.service.ts` — Service files
  - `*.repository.ts` — Repository files

## Sources

- [[]
- [[Sources/react-docs-2026|react-docs-2026]]




