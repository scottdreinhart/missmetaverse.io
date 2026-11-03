---
slug: monitoring-patterns-original
sources:
  - https://en.wikipedia.org/wiki/Computer_monitoring
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - domain/security
  - type/concept
  - domain/testing
  - type/guide
  - domain/optimization
  - domain/frontend
  - domain/devops
  - domain/database
  - status/complete
  - type/reference
  - domain/architecture
  - monitoring
  - observability
  - debugging
  - patterns
---

# Monitoring Patterns

## Definition

Monitoring Patterns are **design patterns for monitoring software systems**.

> "Monitoring is the process of observing a system to detect issues, track performance, and ensure reliability." — Wikipedia

## Problem Addressed

Without monitoring patterns:
- **Issues**: Can't detect issues early
- **Performance**: Can't track performance
- **Reliability**: Can't ensure reliability
- **User experience**: Can't track user experience

## Scope and Boundaries

- Monitoring Patterns ≠ Monitoring (monitoring patterns are patterns, monitoring is a practice)
- Monitoring Patterns ≠ Logging (monitoring patterns are patterns, logging is a practice)
- Monitoring Patterns is a **patterns**, not a practice

## When to Apply

- When building software
- when reliability matters
- when performance is important
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Monitoring patterns are complex |
| **Time** — Monitoring patterns take time |
| **Over-monitoring** — Don't monitor everything |

## Common Misuses

- **Everything monitored**: Not everything needs monitoring patterns
- **Confusing with logging**: Monitoring patterns ≠ logging
- **Over-monitoring**: Too much monitoring creates complexity

## Related Concepts

- [Observability](Architecture/observability.md) — Monitoring patterns with observability
- [Logging](Architecture/logging-patterns.md) — Monitoring patterns with logging
- [Alerting](Architecture/alerting.md) — Monitoring patterns with alerting

## Project Observations

- The project uses monitoring patterns:
  - The project's quality and delivery note covers monitoring patterns (from existing notes)
  - No evidence of monitoring patterns in existing code (src/ is empty)
- File naming conventions support monitoring patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

---

## Decision Tree: Monitoring Strategy

```mermaid
graph TD
    A[Need monitoring?]\n    A --> B{What type?}
    B -->|Metrics| C[Prometheus/Grafana]
    B -->|Logs| D[ELK/Loki]
    B -->|Traces| E[Jaeger/Zipkin]
    B -->|Errors| F[Sentry/Datadog]
    C --> G{Custom or Managed?}
    G -->|Custom| H[Self-hosted]
    G -->|Managed| I[Cloud provider]
    D --> J{Centralized?}
    J -->|Yes| K[ELK Stack]
    J -->|No| L[Local logs]
    E --> M{Distributed?}
    M -->|Yes| N[Jaeger]
    M -->|No| O[Local traces]
```

### When to Use Each Monitoring Type

| Type | When to Use | Example |
|------|-------------|---------|
| **Metrics** | Performance tracking | CPU, memory, response time |
| **Logs** | Debugging issues | Error logs, access logs |
| **Traces** | Distributed systems | Request flow across services |
| **Errors** | Production monitoring | Sentry, Datadog |
| **Alerts** | Critical issues | Slack, email, PagerDuty |

---

## Procedural Guidance: Monitoring Setup

### Step 1: Add Health Check Endpoint

```typescript
// src/routes/health.ts
import { Router } from 'express'

const router = Router()

router.get('/health', (req, res) => {
  res.json({
    status: 'ok',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    memory: process.memoryUsage(),
  })
})

router.get('/ready', async (req, res) => {
  try {
    // Check database connection
    await db.query('SELECT 1')
    res.json({ status: 'ready' })
  } catch (error) {
    res.status(503).json({ status: 'not ready', error: error.message })
  }
})

export default router
```

### Step 2: Add Metrics Collection

```typescript
// src/metrics/index.ts
import { collectDefaultMetrics, register } from 'prom-client'

// Collect default metrics
collectDefaultMetrics({ prefix: 'app_' })

// Custom metrics
const requestCounter = new register.Counter({
  name: 'app_requests_total',
  help: 'Total requests',
  labelNames: ['method', 'path', 'status'],
})

const responseTimeHistogram = new register.Histogram({
  name: 'app_response_time_seconds',
  help: 'Response time in seconds',
  buckets: [0.1, 0.5, 1, 2.5, 5, 10],
})

// Middleware to record metrics
export function metricsMiddleware(req, res, next) {
  const start = Date.now()
  
  res.on('finish', () => {
    const duration = (Date.now() - start) / 1000
    requestCounter.inc({
      method: req.method,
      path: req.path,
      status: res.statusCode,
    })
    responseTimeHistogram.observe(duration)
  })
  
  next()
}

// Metrics endpoint
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType)
  res.end(await register.metrics())
})
```

### Step 3: Add Error Tracking

```typescript
// src/middleware/error-handler.ts
import * as Sentry from '@sentry/node'

Sentry.init({
  dsn: process.env.SENTRY_DSN,
  tracesSampleRate: 1.0,
})

export function errorHandler(err, req, res, next) {
  // Log error
  console.error(err)
  
  // Report to Sentry
  Sentry.captureException(err)
  
  // Send response
  res.status(500).json({
    error: 'Internal server error',
    requestId: req.id,
  })
}
```

### Step 4: Add Logging

```typescript
// src/logger/index.ts
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

// Request logging middleware
export function requestLogger(req, res, next) {
  logger.info({
    method: req.method,
    url: req.url,
    ip: req.ip,
    userAgent: req.get('User-Agent'),
  })
  next()
}
```

### Step 5: Configure Alerts

```yaml
# alerting.yml
alerts:
  - name: High Error Rate
    condition: rate(errors[5m]) > 0.05
    severity: critical
    notify:
      - slack: '#alerts'
      - email: team@example.com

  - name: High Response Time
    condition: histogram_quantile(0.95, response_time[5m]) > 2
    severity: warning
    notify:
      - slack: '#alerts'

  - name: High Memory Usage
    condition: memory_usage > 80
    severity: warning
    notify:
      - slack: '#alerts'
```

---

## Copilot Instructions

### When to Read This Note
- Setting up monitoring for applications
- Adding health check endpoints
- Implementing metrics collection
- Configuring error tracking
- Setting up alerting

### What to Do With This Information
1. **Add health checks**: Implement /health and /ready endpoints
2. **Collect metrics**: Use prom-client for metrics collection
3. **Track errors**: Use Sentry for error tracking
4. **Add logging**: Use Winston for structured logging
5. **Configure alerts**: Set up alerts for critical issues

### Tools to Use
- **VS Code Extension**: Error Lens — for inline monitoring error display
- **npm Package**: `prom-client` — for Prometheus metrics
- **npm Package**: `@sentry/node` — for error tracking
- **npm Package**: `winston` — for logging
- **Terminal Command**: `curl http://localhost:3000/health` — check health
- **Terminal Command**: `curl http://localhost:3000/metrics` — get metrics

### Agents to Invoke
- **Performance Review Agent**: Run when adding metrics collection
- **Security Review Agent**: Run when configuring error tracking

### Integration with Other Notes
- Read [ci-cd-patterns](D/ci-cd-patterns.md) for CI/CD deployment patterns
- read [docker-deployment](https://docs.docker.com/deployment/) for Docker deployment patterns
- Read [nginx-patterns](D/nginx-patterns.md) for nginx configuration
- Read [logging-patterns](D/logging-patterns.md) for logging patterns

### Common Pitfalls
- Don't monitor everything (focus on what matters)
- Don't forget health checks (always have /health endpoint)
- Don't ignore error rates (track and alert on errors)
- Don't skip logging (use structured logging)
- Don't create alert fatigue (only alert on critical issues)

### Quick Validation Checklist
- [ ] Are health checks implemented?
- [ ] Are metrics being collected?
- [ ] Are errors being tracked?
- [ ] Is logging configured?
- [ ] Are alerts set up for critical issues?
- [ ] Is monitoring tested?




