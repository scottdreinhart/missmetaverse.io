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
# Retry with Backoff and Jitter

## Definition

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Retry with Backoff and Jitter is a **resilience pattern where failed operations are retried with increasing delays and randomization to avoid thundering herd**.

> "Exponential backoff with jitter is a technique that adds random variation to the delay between retries." â€” AWS Architecture Blog

## Problem Addressed

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without backoff and jitter:
- **Thundering herd**: All clients retry at the same time
- **Resource exhaustion**: Too many retries overwhelm the system
- **Wasted resources**: Immediate retries fail again
- **Cascading failures**: Retries cause more failures

## Scope and Boundaries

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Retry â‰  Circuit Breaker (retry tries again, circuit breaker stops trying)
- Retry â‰  Timeout (timeout limits duration, retry limits attempts)
- Retry is a **resilience pattern**, not a fault prevention pattern

## When to Apply

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When calling external services
- When failures are transient
- When retries are safe (idempotent operations)
- When user experience matters

## Tradeoffs and When to Avoid

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Latency** â€” Retries add delay |
| **Resource usage** â€” Retries consume resources |
| **Wrong operations** â€” Non-idempotent operations shouldn't be retried |

## Common Misuses

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Retrying everything**: Not every failure should be retried
- **No jitter**: All clients retry at the same time
- **No limit**: Infinite retries exhaust resources

## Related Concepts

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) â€” Complementary pattern
- [Bulkheads](Architecture/architecture-patterns.md) â€” Complementary pattern
- [Timeouts](Architecture/architecture-patterns.md) â€” Complementary pattern

## Project Observations

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- No retry logic is implemented yet
- The project's architecture patterns note covers retry with backoff
- Docker deployment note covers external service dependencies

## Sources

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



