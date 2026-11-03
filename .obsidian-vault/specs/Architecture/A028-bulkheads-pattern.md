---
slug: bulkheads-pattern
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/bulkhead
  - https://en.wikipedia.org/wiki/Bulkhead_pattern
date: 2026-11-02
tags:









  - bulkhead
  - resilience
  - distributed-systems
  - patterns
---

# Bulkheads Pattern

## Definition

The Bulkheads pattern is a **resilience pattern that isolates resources so that a failure in one component doesn't exhaust resources in another**.

> "The bulkhead pattern isolates elements of functionality so that a failure in one doesn't take down all functionality." — Microsoft Azure Architecture

## Problem Addressed

Without bulkheads:
- **Resource exhaustion**: One component uses all resources
- **Cascading failures**: One failure takes down everything
- **No isolation**: Components share resources indiscriminately
- **Difficult debugging**: Hard to identify the failing component

## Scope and Boundaries

- Bulkheads ≠ Circuit Breaker (bulkheads isolate resources, circuit breakers stop calls)
- Bulkheads ≠ Rate Limiting (bulkheads isolate, rate limiting controls)
- Bulkheads is a **resource isolation pattern**

## When to Apply

- When multiple components share resources
- When failures should be contained
- When different components have different SLAs
- When building microservices

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — More isolation layers |
| **Resource waste** — Reserved resources may be unused |
| **Configuration** — Need to tune isolation |

## Common Misuses

- **Every component**: Not every component needs bulkheads
- **Over-isolation**: Too many isolated resources
- **Confusing with circuit breaker**: Bulkheads ≠ circuit breaker

## Related Concepts

- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) — Complementary pattern
- [Rate Limiting](Architecture/rate-limiting.md) — Complementary pattern
- [Resilience](Architecture/circuit-breaker-pattern.md) — Resilience patterns

## Project Observations

- No bulkheads are implemented yet
- The project's architecture patterns note covers bulkheads
- Docker deployment note covers container isolation

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



