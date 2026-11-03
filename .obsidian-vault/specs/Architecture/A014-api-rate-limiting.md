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
# API Rate Limiting

## Definition

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
API Rate Limiting is a **security and resilience pattern that controls the number of requests a client can make to an API**.

> "API rate limiting is a technique used to control the rate of traffic sent or received by a network interface." â€” Swagger

## Problem Addressed

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without API rate limiting:
- **Abuse**: Clients overwhelm the API
- **Cost**: Excessive API calls increase costs
- **Availability**: Legitimate users can't access the API
- **Security**: Brute force attacks succeed

## Scope and Boundaries

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- API Rate Limiting â‰  Rate Limiting (API rate limiting is for APIs, rate limiting is broader)
- API Rate Limiting â‰  Throttling (API rate limiting controls input, throttling controls output)
- API Rate Limiting is a **security pattern**, not a resilience pattern

## When to Apply

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building APIs
- when security matters
- when cost is important
- when availability is important

## Tradeoffs and When to Avoid

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” API rate limiting is complex |
| **Time** â€” API rate limiting takes time |
| **Over-rate-limiting** â€” Don't rate limit everything |

## Common Misuses

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything rate limited**: Not everything needs API rate limiting
- **Confusing with throttling**: API rate limiting â‰  throttling
- **Over-rate-limiting**: Too much rate limiting creates complexity

## Related Concepts

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Rate Limiting](Architecture/rate-limiting.md) â€” API rate limiting with rate limiting
- [Security Principles](Architecture/security-principles.md) â€” API rate limiting with security
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) â€” API rate limiting with circuit breaker

## Project Observations

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses API rate limiting:
  - The project's architecture patterns note covers API rate limiting (from existing notes)
  - No evidence of API rate limiting in existing code (src/ is empty)
- File naming conventions support API rate limiting:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a014-api-rate-limiting

## title
API Rate Limiting

## aliases
- A014-api-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




