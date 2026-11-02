---
slug: redis-patterns
sources:
  - https://redis.io/
  - https://docs.redis.io/
date: 2026-11-02
tags:
  - redis
  - caching
  - database
  - patterns
---

# Redis Patterns

## Definition

Redis Patterns are **design patterns for working with Redis as a cache, database, or message broker**.

> "Redis is an open source, in-memory data store used as a database, cache, message broker, and streaming engine." — Redis

## Problem Addressed

Without Redis patterns:
- **Performance**: Data access is slow
- **Scalability**: Hard to scale
- **Cost**: Data access is expensive
- **User experience**: Poor user experience

## Scope and Boundaries

- Redis ≠ Cache (Redis is a data store, cache is a storage mechanism)
- Redis ≠ Database (Redis is a data store, database is a storage mechanism)
- Redis is a **data store**, not a storage mechanism

## When to Apply

- When building applications
- when performance matters
- when scalability is important
- when cost is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Redis is complex |
| **Time** — Redis takes time |
| **Over-Redis** — Don't use Redis for everything |

## Common Misuses

- **Everything Redis**: Not everything needs Redis
- **Confusing with cache**: Redis ≠ cache
- **Over-Redis**: Too much Redis creates complexity

## Related Concepts

- [Caching Strategies](Architecture/caching-strategies.md) — Redis with caching strategies
- [Cache-Aside Pattern](Architecture/cache-aside-pattern.md) — Redis with cache-aside
- [Database Design](Architecture/database-design.md) — Redis with database design

## Project Observations

- The project uses Redis:
  - The project's architecture patterns note covers Redis (from existing notes)
  - No evidence of Redis in existing code (src/ is empty)
- File naming conventions support Redis:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
