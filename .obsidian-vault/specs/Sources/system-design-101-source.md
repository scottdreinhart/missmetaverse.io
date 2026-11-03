---
slug: system-design-101
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - index
  - knowledge-base
  - reference
---

# System Design 101 — Source Reference

## Overview

**System Design 101** is a comprehensive knowledge base containing 150+ guides, cheat sheets, and architectural patterns for system design. It covers everything from fundamental computer science concepts to real-world case studies from companies like Netflix, Uber, and Discord.

## What This Source Provides

This source serves as a **verification reference** for system design principles, architectural patterns, and best practices discussed throughout the vault. It contains:

- **15 category guides** covering core system design topics
- **150+ individual guides** with practical examples and diagrams
- **Real-world case studies** from major tech companies
- **Cheat sheets** for quick reference
- **Deep-dive explanations** of how systems work

## How to Use This Source

### For Verification

When reading notes about system design patterns, cross-reference with:

```markdown
- [[system-design-101/categories/software-architecture]] — Architectural patterns
- [[system-design-101/categories/database-and-storage]] — Database design
- [[system-design-101/categories/caching-performance]] — Caching strategies
- [[system-design-101/categories/security]] — Security patterns
- [[system-design-101/categories/cloud-distributed-systems]] — Distributed systems
```

### For Implementation Guidance

Use specific guides for implementation details:

```markdown
- [Guide: 8-must-know-scalability-strategies](https://bytebytego.com/guides/8-must-know-scalability-strategies) — Scalability
- [Guide: top-5-caching-strategies](https://bytebytego.com/guides/top-5-caching-strategies) — Caching
- [Guide: 9-best-practices-for-building-microservices](https://bytebytego.com/guides/9-best-practices-for-building-microservices) — Microservices
- [Guide: system-design-cheat-sheet](https://bytebytego.com/guides/system-design-cheat-sheet) — Quick reference
```

### For Real-World Examples

Study case studies for practical insights:

```markdown
- [Guide: netflixs-overall-architecture](https://bytebytego.com/guides/netflixs-overall-architecture) — Netflix
- [Guide: uber-tech-stack](https://bytebytego.com/guides/uber-tech-stack) — Uber
- [Guide: discord-stores-trillions-of-messages](https://bytebytego.com/guides/discord-stores-trillions-of-messages) — Discord
- [Guide: twitter-architecture-2022-vs-2012](https://bytebytego.com/guides/twitter-architecture-2022-vs-2012) — Twitter
```

## Key Topics Covered

### Architecture Patterns
- Microservices vs Monolith
- Event-Driven Architecture
- CQRS (Command-Query Responsibility Segregation)
- Service Mesh
- API Gateway Pattern

### Database Design
- SQL vs NoSQL
- Sharding Strategies
- Replication Patterns
- Caching Layers
- Data Modeling

### Scalability
- Horizontal vs Vertical Scaling
- Load Balancing
- CDN Implementation
- Database Scaling
- Caching Strategies

### Reliability
- Circuit Breaker Pattern
- Retry Strategies
- Dead Letter Queues
- Health Checks
- Disaster Recovery

### Security
- Authentication (OAuth 2.0, JWT)
- Authorization (RBAC, ABAC)
- Encryption
- Rate Limiting
- DDoS Protection

## Integration with Vault

This source complements existing vault notes by:

1. **Verifying principles** — Cross-reference DDD, architecture, and security patterns
2. **Providing examples** — Real-world case studies from major companies
3. **Offering cheat sheets** — Quick reference for common patterns
4. **Supporting learning** — Structured learning paths for system design

## Related Vault Notes

Read these vault notes for deeper understanding:

- [architecture-patterns](D/architecture-patterns.md) — Architectural pattern selection
- [[microservices-architecture]] — Microservice design
- [event-driven-architecture](D/event-driven-architecture.md) — Event-driven patterns
- [caching-strategies](D/caching-strategies.md) — Caching implementation
- [[database-scaling]] — Database scaling strategies
- [security-principles](D/security-principles.md) — Security best practices
- [[scalability-strategies]] — Scalability patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]] — Complete index of all guides
- GitHub: https://github.com/donnemartin/system-design-cheat-sheet
