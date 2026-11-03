---
slug: system-design-101-integration
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/security
  - domain/architecture
  - type/concept
  - domain/frontend
  - system-design
  - integration
  - api-gateway
  - reference
---

# System Integration Patterns

## Overview

Reference: [Guide: how-do-we-design-system-integration](https://bytebytego.com/guides/how-do-we-design-system-integration)

This guide covers system integration patterns, API gateways, and service mesh.

## Integration Patterns

### 1. Point-to-Point
- Direct connections between systems
- Simple but hard to scale
- Example: A talks directly to B

### 2. Enterprise Service Bus (ESB)
- Centralized integration platform
- Protocol transformation
- Example: Apache Camel

### 3. API Gateway
- Single entry point
- Request routing
- Example: Kong, Apigee

### 4. Service Mesh
- Service-to-service communication
- Observability
- Example: Istio, Linkerd

## API Gateway Pattern

```typescript
// integration/api-gateway.ts
import { Request, Response } from 'express'

class APIGateway {
  private routes: Map<string, RouteHandler> = new Map()

  register(method: string, path: string, handler: RouteHandler): void {
    this.routes.set(`${method}:${path}`, handler)
  }

  async handle(request: Request, response: Response): Promise<void> {
    const key = `${request.method}:${request.path}`
    const handler = this.routes.get(key)

    if (!handler) {
      response.status(404).json({ error: 'Not found' })
      return
    }

    try {
      // Authentication
      const user = await this.authenticate(request)

      // Rate limiting
      await this.checkRateLimit(user.id)

      // Request transformation
      const transformed = this.transformRequest(request)

      // Call backend service
      const result = await handler(transformed)

      // Response transformation
      response.json(this.transformResponse(result))
    } catch (error) {
      response.status(500).json({ error: 'Internal server error' })
    }
  }

  private async authenticate(_request: Request): Promise<User> {
    return { id: 'user_123' }
  }

  private async checkRateLimit(_userId: string): Promise<void> {
    // Rate limiting logic
  }

  private transformRequest(_request: Request): Request {
    return _request
  }

  private transformResponse(_response: any): any {
    return _response
  }
}

interface RouteHandler {
  (request: Request): Promise<any>
}

interface User {
  id: string
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [api-gateway](D/api-gateway.md) — API gateway patterns
- [service-mesh](D/service-mesh.md) — Service mesh patterns
- [[integration-patterns]] — Integration patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [integration-guide](https://bytebytego.com/guides/how-do-we-design-system-integration)


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


