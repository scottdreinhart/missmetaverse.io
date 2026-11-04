---
slug: rest-api-design
tags:
  - core-concepts

  - api-distributed-systems-backend
---

# REST API Design

> **Purpose:** Design RESTful APIs following best practices.
> **Last Updated:** 2026-11-03

## concept_id
`rest-api-design`

## title
REST API Design

## aliases
- REST Design
- RESTful API
- REST Architecture
- API Design

## category
apis-distributed-systems

## concept_type
api-concept

## research_status
verified

## project_adoption
declared

## applicability
- API design
- Resource modeling
- HTTP methods
- Status codes

## tags
- type/concept
- domain/api
- status/verified
- priority/high

## source_ids
- fielding-rest-2000
- martinfowler-patterns

## related_concept_ids
- rest-api-design
- api-versioning
- hateoas
- api-gateway

## Definition

REST API Design is the practice of designing web APIs following REST architectural constraints including stateless communication, uniform interface, and resource-based URLs.

## Problem Addressed

Without REST Design:
- APIs are inconsistent
- Resources are poorly modeled
- HTTP semantics are misused
- Clients are tightly coupled

## Scope of Boundaries

REST Design applies to:
- API design
- Resource modeling
- HTTP methods
- Status codes

REST Design does not apply to:
- GraphQL design
- gRPC design
- WebSocket design
- Internal APIs

## When to Apply

- Designing public APIs
- Modeling resources
- Using HTTP semantics
- Building stateless APIs

## Tradeoffs and When to Avoid

- **Not for complex queries**: REST is not ideal for complex queries
- **Not for real-time**: REST is not ideal for real-time
- **Not for internal**: Internal APIs may not need REST
- **Not for performance**: REST has overhead

## Implementation Guidance

1. **Model resources**: Model API resources
2. **Use HTTP methods**: Use GET/POST/PUT/DELETE appropriately
3. **Design URLs**: Design resource-based URLs
4. **Use status codes**: Use appropriate HTTP status codes
5. **Add versioning**: Add API versioning

## Verification

- [ ] Resources modeled
- [ ] HTTP methods used
- [ ] URLs designed
- [ ] Status codes used
- [ ] Versioning added

## Common Misuses

- **Verb URLs**: Using verbs in URLs
- **Wrong status codes**: Using wrong HTTP status codes
- **Not versioning**: Not versioning APIs
- **Tight coupling**: Creating tightly coupled APIs

## Related Concepts

- [[APIs Distributed Systems/rest-api-design]] â€” REST API Design
- [[APIs Distributed Systems/api-versioning]] â€” API Versioning
- [[APIs Distributed Systems/rest-api-design]] â€” HATEOAS
- [[APIs Distributed Systems/api-gateway-pattern]] â€” API Gateway

## Project Observations

The project uses REST API Design through:
- Resource-based URL design
- Proper HTTP method usage
- Appropriate status codes
- API versioning strategy

## Sources

- [[Sources/S038-fielding-rest-2000|REST Architectural Style â€” Fielding 2000]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of REST API Design Note**
