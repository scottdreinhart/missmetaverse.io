---
slug: system-design-101-rate-limiting
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - rate-limiting
  - security
  - reference
---

# Rate Limiting Design

## Overview

Reference: [Guide: how-do-we-design-rate-limiting](https://bytebytego.com/guides/how-do-we-design-rate-limiting)

This guide covers rate limiting algorithms, implementations, and best practices.

## Rate Limiting Algorithms

### 1. Fixed Window
- Count requests in fixed time window
- Simple but allows burst at boundaries

### 2. Sliding Window
- Smooth rate limiting
- More accurate than fixed window

### 3. Token Bucket
- Fixed rate of token generation
- Allows bursts up to bucket size
- Most popular algorithm

### 4. Leaky Bucket
- Constant output rate
- Queue overflow on burst
- Smooth traffic output

## Implementation Example

### Token Bucket Rate Limiter

```typescript
// rate-limiting/token-bucket.ts
export class TokenBucket {
  private tokens: number
  private readonly maxTokens: number
  private readonly refillRate: number
  private lastRefill: number

  constructor(maxTokens: number, refillRate: number) {
    this.maxTokens = maxTokens
    this.tokens = maxTokens
    this.refillRate = refillRate
    this.lastRefill = Date.now()
  }

  consume(count: number = 1): boolean {
    this.refill()
    if (this.tokens >= count) {
      this.tokens -= count
      return true
    }
    return false
  }

  private refill(): void {
    const now = Date.now()
    const elapsed = (now - this.lastRefill) / 1000
    this.tokens = Math.min(
      this.maxTokens,
      this.tokens + elapsed * this.refillRate
    )
    this.lastRefill = now
  }

  getTokens(): number {
    return this.tokens
  }
}
```

### Redis-Based Rate Limiter

```typescript
// rate-limiting/redis-limiter.ts
import { Redis } from 'ioredis'

export class RedisRateLimiter {
  private redis: Redis

  constructor() {
    this.redis = new Redis({ host: 'redis' })
  }

  async isAllowed(key: string, limit: number, window: number): Promise<boolean> {
    const current = await this.redis.incr(key)

    if (current === 1) {
      await this.redis.expire(key, window)
    }

    return current <= limit
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [rate-limiting](D/rate-limiting.md) — Rate limiting patterns
- [security-principles](D/security-principles.md) — Security best practices
- [[dos-protection]] — DDoS protection

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [rate-limiting-guide](https://bytebytego.com/guides/how-do-we-design-rate-limiting)
