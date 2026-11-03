---
slug: api-gateway-pattern
sources:
  - https://www.nginx.com/resources/glossary/api-gateway/
  - https://docs.aws.amazon.com/apigateway/
date: 2026-11-02
tags:
  - api-gateway
  - microservices
  - security
  - patterns
# API Gateway Pattern

## Definition

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
API Gateway Pattern is a **design pattern that provides a single entry point for multiple microservices**.

> "An API gateway sits in front of your services and manages requests, security, and monitoring." â€” AWS

## Problem Addressed

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without API gateway pattern:
- **Complexity**: Client needs to know about multiple services
- **Security**: Security is distributed
- **Monitoring**: Monitoring is distributed
- **Rate limiting**: Rate limiting is distributed

## Scope and Boundaries

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- API Gateway Pattern â‰  Service Mesh (API gateway is external, service mesh is internal)
- API Gateway Pattern â‰  Load Balancer (API gateway is for APIs, load balancer is for traffic)
- API Gateway Pattern is a **design pattern**, not an infrastructure component

## When to Apply

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building microservices
- when security matters
- when monitoring is important
- when rate limiting is important

## Tradeoffs and When to Avoid

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

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
| **Complexity** â€” API gateway pattern is complex |
| **Time** â€” API gateway pattern takes time |
| **Over-api-gateway** â€” Don't use API gateway for everything |

## Common Misuses

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything API gateway**: Not everything needs API gateway pattern
- **Confusing with service mesh**: API gateway pattern â‰  service mesh
- **Over-api-gateway**: Too many API gateways create complexity

## Related Concepts

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Service Mesh](Architecture/service-mesh.md) â€” API gateway pattern with service mesh
- [Microservices](Architecture/microservices.md) â€” API gateway pattern with microservices
- [Rate Limiting](Architecture/rate-limiting.md) â€” API gateway pattern with rate limiting

## Project Observations

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses API gateway pattern:
  - The project's architecture patterns note covers API gateway pattern (from existing notes)
  - No evidence of API gateway pattern in existing code (src/ is empty)
- File naming conventions support API gateway pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a012-api-gateway-pattern

## title
API Gateway Pattern

## aliases
- A012-api-gateway-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




