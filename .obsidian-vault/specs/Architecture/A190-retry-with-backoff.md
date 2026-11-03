---
slug: retry-with-backoff
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
  - https://www.awsarchitectureblog.com/2015/03/backoff.html
date: 2026-11-02
tags:
  - retry
  - backoff
  - resilience
  - distributed-systems
  - --
# Retry with Backoff and Jitter

## Definition

Retry with Backoff and Jitter is a **resilience pattern where failed operations are retried with increasing delays and randomization to avoid thundering herd**.

> "Exponential backoff with jitter is a technique that adds random variation to the delay between retries." â€” AWS Architecture Blog

## Problem Addressed

Without backoff and jitter:
- **Thundering herd**: All clients retry at the same time
- **Resource exhaustion**: Too many retries overwhelm the system
- **Wasted resources**: Immediate retries fail again
- **Cascading failures**: Retries cause more failures

## Scope and Boundaries

- Retry â‰  Circuit Breaker (retry tries again, circuit breaker stops trying)
- Retry â‰  Timeout (timeout limits duration, retry limits attempts)
- Retry is a **resilience pattern**, not a fault prevention pattern

## When to Apply

- When calling external services
- When failures are transient
- When retries are safe (idempotent operations)
- When user experience matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Latency** â€” Retries add delay |
| **Resource usage** â€” Retries consume resources |
| **Wrong operations** â€” Non-idempotent operations shouldn't be retried |

## Common Misuses

- **Retrying everything**: Not every failure should be retried
- **No jitter**: All clients retry at the same time
- **No limit**: Infinite retries exhaust resources

## Related Concepts

- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) â€” Complementary pattern
- [Bulkheads](Architecture/architecture-patterns.md) â€” Complementary pattern
- [Timeouts](Architecture/architecture-patterns.md) â€” Complementary pattern

## Project Observations

- No retry logic is implemented yet
- The project's architecture patterns note covers retry with backoff
- Docker deployment note covers external service dependencies

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



