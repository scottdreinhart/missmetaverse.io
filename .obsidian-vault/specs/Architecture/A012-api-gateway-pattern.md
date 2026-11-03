---
slug: api-gateway-pattern
sources:
  - https://www.nginx.com/resources/glossary/api-gateway/
  - https://docs.aws.amazon.com/apigateway/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
  - api-gateway
  - microservices
  - security
  - patterns
---

# API Gateway Pattern

## Definition

API Gateway Pattern is a **design pattern that provides a single entry point for multiple microservices**.

> "An API gateway sits in front of your services and manages requests, security, and monitoring." — AWS

## Problem Addressed

Without API gateway pattern:
- **Complexity**: Client needs to know about multiple services
- **Security**: Security is distributed
- **Monitoring**: Monitoring is distributed
- **Rate limiting**: Rate limiting is distributed

## Scope and Boundaries

- API Gateway Pattern ≠ Service Mesh (API gateway is external, service mesh is internal)
- API Gateway Pattern ≠ Load Balancer (API gateway is for APIs, load balancer is for traffic)
- API Gateway Pattern is a **design pattern**, not an infrastructure component

## When to Apply

- When building microservices
- when security matters
- when monitoring is important
- when rate limiting is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — API gateway pattern is complex |
| **Time** — API gateway pattern takes time |
| **Over-api-gateway** — Don't use API gateway for everything |

## Common Misuses

- **Everything API gateway**: Not everything needs API gateway pattern
- **Confusing with service mesh**: API gateway pattern ≠ service mesh
- **Over-api-gateway**: Too many API gateways create complexity

## Related Concepts

- [Service Mesh](Architecture/service-mesh.md) — API gateway pattern with service mesh
- [Microservices](Architecture/microservices.md) — API gateway pattern with microservices
- [Rate Limiting](Architecture/rate-limiting.md) — API gateway pattern with rate limiting

## Project Observations

- The project uses API gateway pattern:
  - The project's architecture patterns note covers API gateway pattern (from existing notes)
  - No evidence of API gateway pattern in existing code (src/ is empty)
- File naming conventions support API gateway pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




