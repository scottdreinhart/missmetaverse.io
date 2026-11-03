---
slug: a181-rate-limiting
sources:
  - https://swagger.io/blog/api-design/rate-limiting-in-rest-apis/
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
date: 2026-11-02
tags:
  - rate-limiting
  - security
  - api
  - resilience
# Rate Limiting

## Definition

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Rate Limiting is a **resilience and security pattern that controls the number of requests a client can make within a time period**.

> "Rate limiting is a technique used to control the rate of traffic sent or received by a network interface." â€” Wikipedia

## Problem Addressed

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without rate limiting:
- **Abuse**: Clients overwhelm the system
- **Cost**: Excessive API calls increase costs
- **Availability**: Legitimate users can't access the system
- **Security**: Brute force attacks succeed

## Scope and Boundaries

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Rate Limiting â‰  Throttling (rate limiting controls input, throttling controls output)
- Rate Limiting â‰  Circuit Breaker (rate limiting is per-client, circuit breaker is per-service)
- Rate Limiting is a **security and resilience pattern**

## When to Apply

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building public APIs
- When protecting against abuse
- When managing resource usage
- When dealing with third-party APIs

## Tradeoffs and When to Avoid

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

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
| **User experience** â€” Legitimate users may be limited |
| **Complexity** â€” Rate limiting algorithms are complex |
| **False positives** â€” Shared IPs cause issues |

## Common Misuses

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Too strict**: Legitimate users are blocked
- **Too loose**: Doesn't prevent abuse
- **Confusing with circuit breaker**: Rate limiting â‰  circuit breaker

## Related Concepts

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) â€” Complementary resilience pattern
- [Bulkheads](Architecture/architecture-patterns.md) â€” Complementary pattern
- [Security Principles](Architecture/security-principles.md) â€” Security pattern

## Project Observations

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- No rate limiting is configured yet
- The project's architecture patterns note covers rate limiting
- Docker deployment note covers Nginx (can add rate limiting)

## Sources

## concept_id
a181-rate-limiting

## title
Rate Limiting

## aliases
- A181-rate-limiting

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



