---
slug: cache-aside-pattern
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/cache-aside
  - https://www.enterpriseintegrationpatterns.com/patterns/performance/Cache.html
date: 2026-11-02
tags:
  - priority/high
  - maturity/deprecated
  - type/concept
  - domain/optimization
  - type/guide
  - domain/database
  - status/complete
  - type/reference
  - domain/architecture
  - caching
  - performance
  - distributed-systems
  - patterns
---

# Cache-Aside Pattern

## Definition

Cache-Aside is a **caching pattern where the application checks the cache first, and if data is missing, loads it from the source and stores it in the cache**.

> "The cache-aside pattern is a lazy loading pattern where the cache and database are updated by the application code, not automatically." — Microsoft Azure Architecture

## Problem Addressed

Without caching:
- **Slow responses**: Every request hits the database
- **High load**: Database is overwhelmed
- **Cost**: Database calls are expensive
- **Scalability**: Hard to scale with direct database access

## Scope and Boundaries

- Cache-Aside ≠ Read-Through (cache-aside is application-managed, read-through is cache-managed)
- Cache-Aside ≠ Write-Through (cache-aside reads lazily, write-through writes synchronously)
- Cache-Aside is a **performance pattern**, not a consistency pattern

## When to Apply

- When data is read frequently but written infrequently
- When database calls are expensive
- When latency matters
- When scaling is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Stale data** — Cache may have old data |
| **Complexity** — Cache invalidation is hard |
| **Memory** — Cache uses memory |

## Common Misuses

- **Caching everything**: Not everything benefits from caching
- **No invalidation**: Cached data becomes stale
- **Confusing with read-through**: Cache-aside ≠ read-through

## Related Concepts

- [Read-Through Cache](Architecture/architecture-patterns.md) — Alternative caching pattern
- [Write-Through Cache](Architecture/architecture-patterns.md) — Alternative caching pattern
- [Eventual Consistency](Architecture/architecture-patterns.md) — Cache consistency

## Project Observations

- No caching is implemented yet
- The project's architecture patterns note covers caching
- Vite optimization note covers build-time caching

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]



