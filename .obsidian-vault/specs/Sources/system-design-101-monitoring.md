---
slug: system-design-101-monitoring
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/architecture
  - type/concept
  - domain/frontend
  - domain/database
  - system-design
  - monitoring
  - observability
  - reference
---

# Monitoring and Observability

## Overview

Reference: [Guide: how-do-we-design-monitoring-and-alerting](https://bytebytego.com/guides/how-do-we-design-monitoring-and-alerting)

This guide covers monitoring, logging, tracing, and alerting strategies.

## The Three Pillars of Observability

### 1. Metrics
- Numerical measurements over time
- Example: CPU usage, request rate, error rate
- Tools: Prometheus, Grafana

### 2. Logs
- Discrete events with timestamps
- Example: "User logged in", "Database query failed"
- Tools: ELK Stack, Splunk

### 3. Traces
- Request flow through services
- Distributed tracing
- Tools: Jaeger, Zipkin, OpenTelemetry

## Key Metrics to Monitor

### Infrastructure Metrics
- CPU utilization
- Memory usage
- Disk I/O
- Network I/O
- Container/pod health

### Application Metrics
- Request rate (queries per second)
- Response time (p50, p95, p99)
- Error rate
- Saturation (queue depth, connection pool)
- Throughput (MB/s, requests/s)

### Business Metrics
- Active users
- Conversion rate
- Revenue
- Order volume
- API usage

## Implementation Example

### Prometheus Metrics

```typescript
// monitoring/prometheus.ts
import { Registry, Counter, Histogram, Gauge } from 'prom-client'

export class MetricsCollector {
  private registry: Registry

  constructor() {
    this.registry = new Registry()
    this.setupMetrics()
  }

  private setupMetrics(): void {
    // Request counter
    new Counter({
      name: 'http_requests_total',
      help: 'Total HTTP requests',
      labelNames: ['method', 'path', 'status'],
      registry: this.registry,
    })

    // Response time histogram
    new Histogram({
      name: 'http_request_duration_seconds',
      help: 'HTTP request duration in seconds',
      labelNames: ['method', 'path'],
      buckets: [0.1, 0.5, 1, 5, 10],
      registry: this.registry,
    })

    // Active users gauge
    new Gauge({
      name: 'active_users_total',
      help: 'Total active users',
      registry: this.registry,
    })
  }

  async getMetrics(): Promise<string> {
    return await this.registry.metrics()
  }
}
```

### Structured Logging

```typescript
// monitoring/logger.ts
import winston from 'winston'

export const logger = winston.createLogger({
  level: 'info',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
  ),
  transports: [
    new winston.transports.File({ filename: 'error.log', level: 'error' }),
    new winston.transports.File({ filename: 'combined.log' }),
  ],
})

// Usage:
// logger.info('User logged in', { userId: '123', method: 'password' })
// logger.error('Database connection failed', { error: error.message })
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[monitoring-and-alerting]] — Monitoring strategies
- [observability](D/observability.md) — Observability patterns
- [[Quality Delivery/logging-patterns]] — Logging best practices
- [[distributed-tracing]] — Distributed tracing

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [monitoring-guide](https://bytebytego.com/guides/how-do-we-design-monitoring-and-alerting)


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


