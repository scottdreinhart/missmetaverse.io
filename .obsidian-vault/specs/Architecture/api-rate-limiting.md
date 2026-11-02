---
slug: api-rate-limiting
sources:
  - https://swagger.io/blog/api-design/rate-limiting-in-rest-apis/
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
date: 2026-11-02
tags:
  - rate-limiting
  - api
  - security
  - patterns
---

# API Rate Limiting

## Definition

API Rate Limiting is a **security and resilience pattern that controls the number of requests a client can make to an API**.

> "API rate limiting is a technique used to control the rate of traffic sent or received by a network interface." — Swagger

## Problem Addressed

Without API rate limiting:
- **Abuse**: Clients overwhelm the API
- **Cost**: Excessive API calls increase costs
- **Availability**: Legitimate users can't access the API
- **Security**: Brute force attacks succeed

## Scope and Boundaries

- API Rate Limiting ≠ Rate Limiting (API rate limiting is for APIs, rate limiting is broader)
- API Rate Limiting ≠ Throttling (API rate limiting controls input, throttling controls output)
- API Rate Limiting is a **security pattern**, not a resilience pattern

## When to Apply

- When building APIs
- when security matters
- when cost is important
- when availability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — API rate limiting is complex |
| **Time** — API rate limiting takes time |
| **Over-rate-limiting** — Don't rate limit everything |

## Common Misuses

- **Everything rate limited**: Not everything needs API rate limiting
- **Confusing with throttling**: API rate limiting ≠ throttling
- **Over-rate-limiting**: Too much rate limiting creates complexity

## Related Concepts

- [Rate Limiting](Architecture/rate-limiting.md) — API rate limiting with rate limiting
- [Security Principles](Architecture/security-principles.md) — API rate limiting with security
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) — API rate limiting with circuit breaker

## Project Observations

- The project uses API rate limiting:
  - The project's architecture patterns note covers API rate limiting (from existing notes)
  - No evidence of API rate limiting in existing code (src/ is empty)
- File naming conventions support API rate limiting:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
