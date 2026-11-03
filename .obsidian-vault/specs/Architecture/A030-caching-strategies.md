---
slug: caching-strategies
sources:
  - https://en.wikipedia.org/wiki/Cache_(computing)
  - https://docs.redis.io/
date: 2026-11-02
tags:
  - caching
  - redis
  - performance
  - strategies
  - --
# Caching Strategies

## Definition

Caching Strategies are **techniques for storing data temporarily to improve performance**.

> "Caching is a technique of storing data temporarily in a location that provides fast access to the data." â€” Wikipedia

## Problem Addressed

Without caching strategies:
- **Performance**: Data access is slow
- **Scalability**: Hard to scale
- **Cost**: Data access is expensive
- **User experience**: Poor user experience

## Scope and Boundaries

- Caching Strategies â‰  Cache (caching strategies are techniques, cache is a storage mechanism)
- Caching Strategies â‰  CDN (caching strategies are for data, CDN is for content)
- Caching Strategies is a **technique**, not a storage mechanism

## When to Apply

- When building applications
- when performance matters
- when scalability is important
- when cost is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Caching strategies are complex |
| **Time** â€” Caching strategies take time |
| **Over-caching** â€” Don't cache everything |

## Common Misuses

- **Everything cached**: Not everything needs caching
- **Confusing with cache**: Caching strategies â‰  cache
- **Over-caching**: Too much caching creates complexity

## Related Concepts

- [Cache-Aside Pattern](Architecture/cache-aside-pattern.md) â€” Caching strategies with cache-aside
- [Redis](Architecture/redis.md) â€” Caching strategies with Redis
- [CDN](Architecture/cdn.md) â€” Caching strategies with CDN

## Project Observations

- The project uses caching strategies:
  - The project's architecture patterns note covers caching strategies (from existing notes)
  - No evidence of caching strategies in existing code (src/ is empty)
- File naming conventions support caching strategies:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




