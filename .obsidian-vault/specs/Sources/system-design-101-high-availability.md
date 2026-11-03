---
slug: system-design-101-high-availability
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/high
  - maturity/deprecated
  - domain/backend
  - type/reference
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/devops
  - domain/database
  - system-design
  - availability
  - reliability
  - reference
---

# How to Design for High Availability

## Overview

Reference: [Guide: how-do-we-design-for-high-availability](https://bytebytego.com/guides/how-do-we-design-for-high-availability)

This guide covers key strategies for designing systems with high availability.

## Availability Metrics

| Availability | Downtime per Year | Downtime per Month | Downtime per Day |
|--------------|-------------------|-------------------|------------------|
| **99%** (Two 9s) | 3.65 days | 7.3 hours | 2.4 hours |
| **99.9%** (Three 9s) | 8.76 hours | 43.8 minutes | 1.44 minutes |
| **99.99%** (Four 9s) | 52.6 minutes | 4.38 minutes | 8.64 seconds |
| **99.999%** (Five 9s) | 5.26 minutes | 26.3 seconds | 0.86 seconds |

## High Availability Strategies

### 1. Redundancy
- Multiple instances of each component
- No single point of failure
- Example: Multiple web servers behind load balancer

### 2. Failover
- Automatic switching to backup systems
- Health checks detect failures
- Example: Primary/Secondary database failover

### 3. Load Balancing
- Distribute traffic across instances
- Prevent overload
- Example: NGINX, AWS ALB

### 4. Geographic Distribution
- Deploy across multiple regions
- Disaster recovery
- Example: US-East, US-West, EU-West

### 5. Auto-Scaling
- Automatically add/remove instances
- Handle traffic spikes
- Example: AWS Auto Scaling, Kubernetes HPA

### 6. Circuit Breakers
- Prevent cascading failures
- Fail fast when dependencies fail
- Example: Hystrix, Resilience4j

### 7. Rate Limiting
- Protect against overload
- Fair resource allocation
- Example: Token bucket, Leaky bucket

### 8. Caching
- Reduce load on backend
- Improve response times
- Example: Redis, CDN

## Architecture Patterns

### Active-Active
- All nodes handle traffic
- Maximum availability
- Complex data consistency
- Example: Multi-region active-active

### Active-Passive
- Primary handles traffic
- Secondary on standby
- Simpler, lower cost
- Example: Primary/Secondary database

### Multi-Master
- Multiple nodes accept writes
- Conflict resolution needed
- Good for geo-distribution
- Example: Cassandra, Couchbase

## Implementation Example

### Health Check and Failover

```typescript
// infrastructure/health-check.ts
import { Redis } from 'ioredis'

export class HealthChecker {
  private primary: Redis
  private secondary: Redis
  private isPrimaryHealthy: boolean = true

  constructor() {
    this.primary = new Redis({ host: 'primary-redis' })
    this.secondary = new Redis({ host: 'secondary-redis' })
  }

  // Check primary health
  async checkPrimaryHealth(): Promise<boolean> {
    try {
      await this.primary.ping()
      this.isPrimaryHealthy = true
      return true
    } catch (error) {
      this.isPrimaryHealthy = false
      return false
    }
  }

  // Get connection with failover
  async getConnection(): Promise<Redis> {
    if (this.isPrimaryHealthy) {
      return this.primary
    }
    console.warn('Primary unhealthy, using secondary')
    return this.secondary
  }

  // Monitor health periodically
  startMonitoring(): void {
    setInterval(async () => {
      await this.checkPrimaryHealth()
    }, 5000) // Check every 5 seconds
  }
}
```

### Circuit Breaker Pattern

```typescript
// infrastructure/circuit-breaker.ts
export class CircuitBreaker {
  private state: 'closed' | 'open' | 'half-open' = 'closed'
  private failureCount: number = 0
  private readonly failureThreshold: number
  private readonly recoveryTimeout: number
  private lastFailureTime: number = 0

  constructor(failureThreshold = 5, recoveryTimeout = 30000) {
    this.failureThreshold = failureThreshold
    this.recoveryTimeout = recoveryTimeout
  }

  async execute<T>(fn: () => Promise<T>): Promise<T> {
    // Check circuit state
    if (this.state === 'open') {
      const now = Date.now()
      if (now - this.lastFailureTime > this.recoveryTimeout) {
        this.state = 'half-open'
      } else {
        throw new Error('Circuit breaker is open')
      }
    }

    try {
      const result = await fn()
      this.onSuccess()
      return result
    } catch (error) {
      this.onFailure()
      throw error
    }
  }

  private onSuccess(): void {
    this.failureCount = 0
    this.state = 'closed'
  }

  private onFailure(): void {
    this.failureCount++
    this.lastFailureTime = Date.now()

    if (this.failureCount >= this.failureThreshold) {
      this.state = 'open'
    }
  }
}

// Usage:
// const breaker = new CircuitBreaker()
// const result = await breaker.execute(() => api.call())
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[scalability-strategies]] — Scalability patterns
- [[resiliency-patterns]] — Resiliency patterns
- [circuit-breaker-pattern](D/circuit-breaker-pattern.md) — Circuit breaker implementation
- [[load-balancing]] — Load balancing patterns
- [[disaster-recovery]] — Disaster recovery planning
- [[monitoring-and-alerting]] — Monitoring strategies

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [high-availability-guide](https://bytebytego.com/guides/how-do-we-design-for-high-availability)


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


