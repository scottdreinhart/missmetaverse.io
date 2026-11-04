---
slug: api-gateway-pattern
tags:
  - core-concepts

  - api-distributed-systems-backend
---

# API Gateway Pattern

> **Purpose:** Manage APIs with API Gateway.
> **Last Updated:** 2026-11-03

## concept_id
`api-gateway-pattern`

## title
API Gateway Pattern

## aliases
- API Gateway
- Gateway Pattern
- API Gateway Service
- BFF Pattern

## category
apis-distributed-systems

## concept_type
architectural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- API aggregation
- Authentication
- Rate limiting
- Request routing

## tags
- type/pattern
- domain/api
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- microservices-patterns

## related_concept_ids
- api-gateway-pattern
- backend-for-frontend
- service-mesh
- load-balancer

## Definition

API Gateway Pattern provides a single entry point for clients to access multiple backend services, handling cross-cutting concerns like authentication, rate limiting, and request routing.

## Problem Addressed

Without API Gateway:
- Clients need to know multiple endpoints
- Authentication is duplicated
- Rate limiting is scattered
- Request routing is complex

## Scope of Boundaries

API Gateway applies to:
- API aggregation
- Authentication
- Rate limiting
- Request routing

API Gateway does not apply to:
- Business logic
- Data modeling
- Database design
- UI rendering

## When to Apply

- Needing API aggregation
- Managing authentication
- Implementing rate limiting
- Routing requests

## Tradeoffs and When to Avoid

- **Single point of failure**: Gateway is single point of failure
- **Not for simple apps**: Simple apps don't need gateway
- **Not for internal**: Internal APIs don't need gateway
- **Not for performance**: Gateway adds latency

## Implementation Guidance

1. **Choose gateway**: Choose API gateway technology
2. **Configure routes**: Configure request routing
3. **Add authentication**: Add authentication/authorization
4. **Add rate limiting**: Add rate limiting
5. **Monitor traffic**: Monitor API traffic

## Verification

- [ ] Gateway chosen
- [ ] Routes configured
- [ ] Authentication added
- [ ] Rate limiting added
- [ ] Traffic monitored

## Common Misuses

- **Not monitoring**: Not monitoring gateway health
- **Business logic**: Putting business logic in gateway
- **Not scaling**: Not scaling gateway appropriately
- **Not securing**: Not securing gateway properly

## Related Concepts

- [[APIs Distributed Systems/api-gateway-pattern]] â€” API Gateway Pattern
- [[APIs Distributed Systems/L05-Backend-for-Frontend]] â€” Backend for Frontend
- [[APIs Distributed Systems/service-mesh]] â€” Service Mesh
- [[APIs Distributed Systems/load-balancing]] â€” Load Balancer

## Project Observations

The project uses API Gateway Pattern through:
- Single entry point for clients
- Authentication and authorization
- Rate limiting implementation
- Request routing configuration

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S010-microsoft-distributed-systems|Microservices Patterns â€” Christensen]]

**End of API Gateway Pattern Note**
