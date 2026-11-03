---
slug: timeouts
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
  - https://microservices.io/patterns/reliability/timeouts.html
date: 2026-11-02
tags:
  - timeouts
  - distributed-systems
  - reliability
  - resilience
  - --
# Timeouts

## Definition

Timeouts is **a distributed systems pattern that limits the amount of time a operation waits for a response, preventing indefinite blocking**.

> "A timeout is a limit on the amount of time an operation is allowed to run before it is aborted." â€” Microsoft

## Problem Addressed

Without timeouts:
- **Indefinite blocking**: Operations wait forever
- **Resource exhaustion**: Resources are held indefinitely
- **Cascading failures**: One slow service causes all services to block
- **Poor UX**: Users wait too long for responses

## Scope and Boundaries

- Timeouts â‰  Retry (timeout limits wait time, retry retries failed operations)
- Timeouts = Reliability (timeouts prevent indefinite blocking)
- Timeouts is a **reliability pattern**, not a design pattern

## When to Apply

- When building distributed systems
- when network calls are involved
- when resource exhaustion is a concern
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **False positives** â€” Operations may complete after timeout |
| **Complexity** â€” Timeout configuration takes time |
| **User experience** â€” Users may see errors for slow operations |

## Common Misuses

- **Everything timed out**: Not every operation needs a timeout
- **Too short timeouts**: Timeouts that are too short cause false positives
- **Confusing with cancellation**: Timeout is automatic, cancellation is explicit

## Related Concepts

- [Retry with Backoff](Architecture/retry-with-backoff.md) â€” Retry with backoff works with timeouts
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) â€” Circuit breaker works with timeouts
- [Bulkheads](Architecture/bulkheads-pattern.md) â€” Bulkheads work with timeouts

## Project Observations

- The project uses timeouts:
  - Node.js supports timeouts through setTimeout
  - TypeScript can enforce timeouts through type system
  - The project's architecture patterns note covers distributed systems concepts
  - No evidence of timeouts in existing code (src/ is empty)
- File naming conventions support timeouts:
  - `*.service.ts` â€” Service files
  - `*.repository.ts` â€” Repository files

## Sources

- [[]
- [[Sources/react-docs-2026|react-docs-2026]]




