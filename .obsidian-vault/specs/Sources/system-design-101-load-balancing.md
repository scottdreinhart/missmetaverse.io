---
slug: system-design-101-load-balancing
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - load-balancing
  - networking
  - reference
---

# Load Balancing Patterns and Strategies

## Overview

Reference: [Guide: how-do-we-design-a-load-balancer](https://bytebytego.com/guides/how-do-we-design-a-load-balancer)

This guide covers load balancing algorithms, implementations, and best practices.

## Load Balancing Algorithms

### 1. Round Robin
- Distribute requests evenly
- Simple, fair distribution
- Doesn't consider server capacity

### 2. Weighted Round Robin
- Assign weights to servers
- Higher weight = more requests
- For heterogeneous servers

### 3. Least Connections
- Send to server with fewest connections
- Good for long-running requests
- Adaptive to server load

### 4. Least Response Time
- Send to server with fastest response
- Combines least connections + response time
- Optimizes for latency

### 5. IP Hash
- Hash client IP to determine server
- Session persistence
- Good for stateful applications

### 6. Random
- Random server selection
- Simple implementation
- Good for large server pools

## Load Balancer Types

### 1. Layer 4 (Transport)
- TCP/UDP level
- Fast, simple routing
- Example: AWS NLB, HAProxy TCP

### 2. Layer 7 (Application)
- HTTP/HTTPS level
- Content-based routing
- Example: NGINX, AWS ALB

## Implementation Example

### Round Robin Load Balancer

```typescript
// load-balancing/round-robin.ts
export class RoundRobinBalancer {
  private servers: Server[] = []
  private currentIndex: number = 0

  addServer(server: Server): void {
    this.servers.push(server)
  }

  removeServer(serverId: string): void {
    this.servers = this.servers.filter((s) => s.id !== serverId)
  }

  getNextServer(): Server | null {
    if (this.servers.length === 0) return null

    const server = this.servers[this.currentIndex % this.servers.length]
    this.currentIndex++
    return server
  }

  getServerCount(): number {
    return this.servers.length
  }
}

interface Server {
  id: string
  host: string
  port: number
  weight?: number
  healthy: boolean
}
```

### Weighted Load Balancer

```typescript
// load-balancing/weighted.ts
export class WeightedBalancer {
  private servers: Server[] = []

  addServer(server: Server): void {
    this.servers.push(server)
  }

  getNextServer(): Server | null {
    if (this.servers.length === 0) return null

    const totalWeight = this.servers.reduce((sum, s) => sum + (s.weight || 1), 0)
    let random = Math.random() * totalWeight

    for (const server of this.servers) {
      const weight = server.weight || 1
      random -= weight
      if (random <= 0) {
        return server
      }
    }

    return this.servers[this.servers.length - 1]
  }
}

interface Server {
  id: string
  host: string
  port: number
  weight: number
  healthy: boolean
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[load-balancing]] — Load balancing patterns
- [[high-availability]] — High availability design
- [[scalability-strategies]] — Scalability patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [load-balancer-guide](https://bytebytego.com/guides/how-do-we-design-a-load-balancer)
