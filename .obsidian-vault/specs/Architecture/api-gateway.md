---
slug: api-gateway
sources:
  - https://www.nginx.com/resources/glossary/api-gateway/
  - https://docs.aws.amazon.com/apigateway/
date: 2026-11-02
tags:
  - api-gateway
  - microservices
  - networking
  - security
---

# API Gateway

## Definition

API Gateway is a **server that acts as an API front-end, receiving API requests, enforcing throttling and security policies, forwarding requests to the back-end service, and then returning the service response to the requester**.

> "An API gateway sits in front of your services and manages requests, security, and monitoring." — AWS

## Problem Addressed

Without API gateway:
- **Complexity**: Client needs to know about multiple services
- **Security**: Security is distributed
- **Monitoring**: Monitoring is distributed
- **Rate limiting**: Rate limiting is distributed

## Scope and Boundaries

- API Gateway ≠ Service Mesh (API gateway is external, service mesh is internal)
- API Gateway ≠ Load Balancer (API gateway is for APIs, load balancer is for traffic)
- API Gateway is an **infrastructure component**, not an architecture style

## When to Apply

- When building microservices
- When security matters
- When monitoring is important
- When rate limiting is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — API gateway is complex |
| **Time** — API gateway takes time |
| **Over-api-gateway** — Don't use API gateway for everything |

## Common Misuses

- **Everything API gateway**: Not everything needs API gateway
- **Confusing with service mesh**: API gateway ≠ service mesh
- **Over-api-gateway**: Too much API gateway creates complexity

## Related Concepts

- [Microservices](Architecture/microservices.md) — API gateway with microservices
- [Service Mesh](Architecture/service-mesh.md) — API gateway with service mesh
- [Rate Limiting](Architecture/rate-limiting.md) — API gateway with rate limiting

## Project Observations

- The project uses API gateway:
  - The project's architecture patterns note covers API gateway (from existing notes)
  - No evidence of API gateway in existing code (src/ is empty)
- File naming conventions support API gateway:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
