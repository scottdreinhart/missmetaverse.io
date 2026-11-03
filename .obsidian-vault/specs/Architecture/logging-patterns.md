---
slug: logging-patterns-original
sources:
  - https://en.wikipedia.org/wiki/Logging_(computing)
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - logging
  - debugging
  - observability
  - patterns
---

# Logging Patterns

## Definition

Logging Patterns are **design patterns for logging software events**.

> "Logging is the act of recording events that occur in software for debugging, monitoring, and analysis." — Wikipedia

## Problem Addressed

Without logging patterns:
- **Debugging difficulty**: Hard to debug without logs
- **Monitoring gaps**: Can't monitor without logs
- **Analysis**: Can't analyze without logs
- **Compliance**: Can't meet compliance requirements

## Scope and Boundaries

- Logging Patterns ≠ Logging (logging patterns are patterns, logging is a practice)
- Logging Patterns ≠ Monitoring (logging patterns are patterns, monitoring is a practice)
- Logging Patterns is a **patterns**, not a practice

## When to Apply

- When building software
- when debugging is important
- when monitoring matters
- when compliance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Logging patterns are complex |
| **Time** — Logging patterns take time |
| **Over-logging** — Don't log everything |

## Common Misuses

- **Everything logged**: Not everything needs logging patterns
- **Confusing with monitoring**: Logging patterns ≠ monitoring
- **Over-logging**: Too much logging creates complexity

## Related Concepts

- [Observability](Architecture/observability.md) — Logging patterns with observability
- [Error Handling](Architecture/error-handling.md) — Logging patterns with error handling
- [Sentry](Architecture/sentry.md) — Logging patterns with Sentry

## Project Observations

- The project uses logging patterns:
  - The project's quality and delivery note covers logging patterns (from existing notes)
  - No evidence of logging patterns in existing code (src/ is empty)
- File naming conventions support logging patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

---

## Decision Tree: Logging Strategy

```mermaid
graph TD
    A[Need logging?]\n    A --> B{What level?}
    B -->|Debug| C[Debug logs]
    B -->|Info| D[Info logs]
    B -->|Warning| E[Warning logs]
    B -->|Error| F[Error logs]
    B -->|Critical| G[Critical logs]
    C --> H{Development?}
    H -->|Yes| I[Verbose logging]
    H -->|No| J[Production logging]
    D --> K{Structured?}
    K -->|Yes| L[JSON logs]
    K -->|No| M[Plain text]
```

### When to Use Each Logging Level

| Level | When to Use | Example |
|-------|-------------|---------|
| **Debug** | Development, troubleshooting | Variable values, function calls |
| **Info** | Normal operation | User login, API request |
| **Warning** | Potential issues | Deprecated API, slow query |
| **Error** | Errors occurred | Failed API call, DB error |
| **Critical** | System failure | Database down, out of memory |

---

## Procedural Guidance: Logging Setup

### Step 1: Install Logging Library

```bash
# Install Winston for Node.js
pnpm add winston

# Install Pino for high-performance logging
pnpm add pino
```

### Step 2: Configure Winston

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
    // Write to console
    new winston.transports.Console({
      format: winston.format.combine(
        winston.format.colorize(),
        winston.format.simple()
      ),
    }),
    // Write to files
    new winston.transports.File({
      filename: 'logs/error.log',
      level: 'error',
    }),
    new winston.transports.File({
      filename: 'logs/combined.log',
    }),
  ],
})
```

### Step 3: Add Request Logging Middleware

```typescript
// src/middleware/request-logger.ts
import { Request, Response, NextFunction } from 'express'
import { logger } from '../logger'

export function requestLogger(req: Request, res: Response, next: NextFunction) {
  const start = Date.now()
  
  // Log request
  logger.info({
    method: req.method,
    url: req.url,
    ip: req.ip,
    userAgent: req.get('User-Agent'),
    requestId: req.id,
  })
  
  // Log response
  res.on('finish', () => {
    const duration = Date.now() - start
    logger.info({
      method: req.method,
      url: req.url,
      status: res.statusCode,
      duration: `${duration}ms`,
      requestId: req.id,
    })
  })
  
  next()
}
```

### Step 4: Add Error Logging

```typescript
// src/middleware/error-handler.ts
import { logger } from '../logger'

export function errorHandler(err: Error, req: Request, res: Response, next: NextFunction) {
  // Log error with stack trace
  logger.error({
    message: err.message,
    stack: err.stack,
    method: req.method,
    url: req.url,
    requestId: req.id,
  })
  
  // Send response
  res.status(500).json({
    error: 'Internal server error',
    requestId: req.id,
  })
}
```

### Step 5: Add Structured Logging

```typescript
// src/services/user.service.ts
import { logger } from '../logger'

export class UserService {
  async createUser(data: CreateUserInput) {
    logger.info({
      event: 'user.created',
      userId: data.id,
      email: data.email,
    })
    
    // Create user logic
    const user = await this.db.users.create(data)
    
    logger.info({
      event: 'user.created.success',
      userId: user.id,
    })
    
    return user
  }
  
  async deleteUser(id: string) {
    logger.info({
      event: 'user.deleted',
      userId: id,
    })
    
    // Delete user logic
    const user = await this.db.users.delete(id)
    
    logger.info({
      event: 'user.deleted.success',
      userId: id,
    })
    
    return user
  }
}
```

---

## Copilot Instructions

### When to Read This Note
- Setting up logging for applications
- Adding request/response logging
- Implementing error logging
- Creating structured logs
- Configuring log levels

### What to Do With This Information
1. **Use Winston/Pino**: Install and configure a logging library
2. **Add request logging**: Log all API requests with method, URL, status
3. **Add error logging**: Log errors with stack traces
4. **Use structured logs**: Log JSON with event, context, metadata
5. **Configure log levels**: Use appropriate levels for each log

### Tools to Use
- **VS Code Extension**: Error Lens — for inline logging error display
- **npm Package**: `winston` — for logging
- **npm Package**: `pino` — for high-performance logging
- **Terminal Command**: `tail -f logs/combined.log` — view logs
- **Terminal Command**: `grep error logs/error.log` — search errors
- **Terminal Command**: `journalctl -u myapp` — view systemd logs

### Agents to Invoke
- **Security Review Agent**: Run when adding logging for sensitive data
- **Performance Review Agent**: Run when configuring high-volume logging

### Integration with Other Notes
- Read [monitoring-patterns](D/monitoring-patterns.md) for monitoring patterns
- read [ci-cd-patterns](D/ci-cd-patterns.md) for CI/CD deployment patterns
- Read [docker-deployment](https://docs.docker.com/deployment/) for Docker deployment patterns
- Read [error-handling](https://en.wikipedia.org/wiki/Error_handling) for error handling patterns

### Common Pitfalls
- Don't log sensitive data (passwords, tokens, PII)
- Don't over-log (focus on what matters)
- Don't ignore log levels (use appropriate levels)
- Don't forget to rotate logs (prevent disk space issues)
- Don't log stack traces in production (security risk)

### Quick Validation Checklist
- [ ] Is a logging library installed?
- [ ] Are request/response logs configured?
- [ ] Are errors logged with stack traces?
- [ ] Are structured logs used?
- [ ] Are log levels configured?
- [ ] Is sensitive data excluded from logs?

