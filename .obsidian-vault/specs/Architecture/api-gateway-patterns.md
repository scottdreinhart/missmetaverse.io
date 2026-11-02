---
slug: api-gateway-patterns
sources:
  - https://www.nginx.com/resources/glossary/api-gateway/
  - https://docs.aws.amazon.com/apigateway/
date: 2026-11-02
tags:
  - api-gateway
  - microservices
  - networking
  - patterns
---

# API Gateway Patterns

## Definition

API Gateway Patterns are **design patterns for working with API gateways**.

> "An API gateway sits in front of your services and manages requests, security, and monitoring." — AWS

## Problem Addressed

Without API gateway patterns:
- **Complexity**: Client needs to know about multiple services
- **Security**: Security is distributed
- **Monitoring**: Monitoring is distributed
- **Rate limiting**: Rate limiting is distributed

## Scope and Boundaries

- API Gateway Patterns ≠ API Gateway (API gateway patterns are patterns, API gateway is an infrastructure component)
- API Gateway Patterns ≠ Service Mesh (API gateway patterns are patterns, service mesh is an infrastructure layer)
- API Gateway Patterns is a **patterns**, not an infrastructure component

## When to Apply

- When building microservices
- when security matters
- when monitoring is important
- when rate limiting is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — API gateway patterns are complex |
| **Time** — API gateway patterns take time |
| **Over-API-gateway** — Don't use API gateway for everything |

## Common Misuses

- **Everything API gateway**: Not everything needs API gateway patterns
- **Confusing with service mesh**: API gateway patterns ≠ service mesh
- **Over-API-gateway**: Too many API gateways create complexity

## Related Concepts

- [Microservices](Architecture/microservices-patterns.md) — API gateway patterns with microservices
- [Service Mesh](Architecture/service-mesh-patterns.md) — API gateway patterns with service mesh
- [Rate Limiting](Architecture/rate-limiting.md) — API gateway patterns with rate limiting

## Project Observations

- The project uses API gateway patterns:
  - The project's architecture patterns note covers API gateway patterns (from existing notes)
  - No evidence of API gateway patterns in existing code (src/ is empty)
- File naming conventions support API gateway patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

