---
slug: system-design-101-caching
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/architecture
  - type/concept
  - domain/testing
  - type/guide
  - domain/optimization
  - domain/frontend
  - type/reference
  - domain/database
  - system-design
  - caching
  - performance
  - reference
---

# Caching Strategies and Patterns

## Overview

Reference: [Guide: how-do-we-design-a-caching-system](https://bytebytego.com/guides/how-do-we-design-a-caching-system)

This guide covers caching strategies, cache invalidation, and distributed caching.

## Cache Types

### 1. In-Memory Cache
- Stored in application memory
- Fastest access (nanoseconds)
- Example: LRU cache in Java

### 2. Distributed Cache
- Shared across multiple servers
- Higher availability
- Example: Redis, Memcached

### 3. CDN Cache
- Edge caching for static content
- Geographic distribution
- Example: CloudFlare, CloudFront

### 4. Database Cache
- Query result caching
- Reduces database load
- Example: MySQL query cache

### 5. Browser Cache
- Client-side caching
- Reduces network requests
- Example: HTTP cache headers

## Cache Invalidation Strategies

### 1. Write-Through
- Update cache and database simultaneously
- Strong consistency
- Slower writes

### 2. Write-Behind (Write-Back)
- Update cache first, async to database
- Faster writes
- Risk of data loss

### 3. Write-Around
- Update database first, bypass cache
- Cache populated on read
- Used for large/rarely accessed data

### 4. Cache-Aside
- Application manages cache
- Read: Check cache, miss → load from DB
- Write: Update DB, invalidate cache
- Most common pattern

### 5. TTL (Time-To-Live)
- Automatic expiration
- Simple but may serve stale data

## Cache Eviction Policies

| Policy | Description | Use Case |
|--------|-------------|----------|
| **LRU** | Evict least recently used | General purpose |
| **LFU** | Evict least frequently used | Hot data |
| **FIFO** | First in, first out | Simple queues |
| **Random** | Random eviction | Uniform access |
| **TTL** | Time-based expiration | Time-sensitive data |

## Implementation Example

### Cache-Aside Pattern

```typescript
// caching/cache-aside.ts
import { Redis } from 'ioredis'

export class CacheService {
  private redis: Redis
  private readonly defaultTTL: number = 3600 // 1 hour

  constructor() {
    this.redis = new Redis({ host: 'redis-cluster' })
  }

  // Read with cache-aside
  async get<T>(key: string, fetchFn: () => Promise<T>): Promise<T> {
    // Check cache first
    const cached = await this.redis.get(key)
    if (cached) {
      return JSON.parse(cached) as T
    }

    // Cache miss, fetch from source
    const value = await fetchFn()

    // Populate cache
    await this.redis.set(key, JSON.stringify(value), 'EX', this.defaultTTL)

    return value
  }

  // Write with cache invalidation
  async invalidate(key: string): Promise<void> {
    await this.redis.del(key)
  }

  // Write with cache update
  async set<T>(key: string, value: T, ttl?: number): Promise<void> {
    await this.redis.set(key, JSON.stringify(value), 'EX', ttl || this.defaultTTL)
  }
}
```

### Redis Cache with Multiple Strategies

```typescript
// caching/redis-strategies.ts
import { Redis } from 'ioredis'

export class RedisCache {
  private redis: Redis

  constructor() {
    this.redis = new Redis({ host: 'redis' })
  }

  // Write-through cache
  async writeThrough<T>(key: string, value: T, dbFn: (v: T) => Promise<void>): Promise<void> {
    await this.redis.set(key, JSON.stringify(value), 'EX', 3600)
    await dbFn(value)
  }

  // Write-behind cache (with queue)
  private writeBehindQueue: Array<{ key: string; value: any }> = []

  async writeBehind<T>(key: string, value: T): Promise<void> {
    await this.redis.set(key, JSON.stringify(value), 'EX', 3600)
    this.writeBehindQueue.push({ key, value })

    // Flush queue every 5 seconds
    if (this.writeBehindQueue.length === 1) {
      setTimeout(() => this.flushWriteBehindQueue(), 5000)
    }
  }

  private async flushWriteBehindQueue(): Promise<void> {
    const batch = this.writeBehindQueue.splice(0)
    // Write batch to database
    for (const item of batch) {
      await this.saveToDatabase(item.key, item.value)
    }
  }

  private async saveToDatabase(_key: string, _value: any): Promise<void> {
    // Database write logic
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [caching-strategies](D/caching-strategies.md) — Caching patterns
- [[cache-invalidation]] — Cache invalidation strategies
- [redis-patterns](D/redis-patterns.md) — Redis usage patterns
- [[cdn-patterns]] — CDN patterns
- [performance-optimization](D/performance-optimization.md) — Performance optimization

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [caching-guide](https://bytebytego.com/guides/how-do-we-design-a-caching-system)


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


