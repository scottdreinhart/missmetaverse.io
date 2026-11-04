---
slug: rest
tags:
  - core-concepts

  - api-distributed-systems-backend
---

# REST

> **Purpose:** Architectural style for distributed systems.
> **Last Updated:** 2026-11-03

## concept_id
`api-rest`

## title
REST

## aliases
- REST
- RESTful
- Representational State Transfer

## category
apis-distributed-systems

## concept_type
architectural-style

## research_status
verified

## project_adoption
declared

## applicability
- Web APIs
- Distributed systems
- Client-server architectures
- Stateless services

## tags
- type/style
- domain/api
- domain/architecture
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- rest-dissertation

## related_concept_ids
- api-api-versioning
- api-backward-compatibility
- api-data-transfer-objects
- api-backend-for-frontend
- arch-service-layer

## Definition

REST (Representational State Transfer) is an architectural style for distributed systems that uses HTTP methods to manipulate resources identified by URIs. It emphasizes statelessness, cacheability, and uniform interface.

## Problem Addressed

Without REST:
- APIs are inconsistent
- Clients are tightly coupled to servers
- Caching is difficult
- Scalability is limited

## Scope and Boundaries

REST applies to:
- Web APIs
- Distributed systems
- Client-server architectures
- Stateless services

REST does not apply to:
- Real-time communication (use WebSockets)
- Complex workflows (use GraphQL or gRPC)
- Binary protocol requirements

## When to Apply

- Building public APIs
- Creating stateless services
- Needing cacheable responses
- Working with web clients

## Tradeoffs and When to Avoid

- **Over-fetching**: REST may return more data than needed
- **Not for real-time**: REST is request-response, not push-based
- **Not for complex queries**: REST struggles with complex filtering
- **Not for binary data**: REST is text-oriented

## Implementation Guidance

1. **Use resources**: Identify nouns, not verbs
2. **Use HTTP methods**: GET, POST, PUT, DELETE, PATCH
3. **Use status codes**: 200, 201, 400, 404, 500
4. **Be stateless**: Each request is independent
5. **Support caching**: Use Cache-Control headers

## Verification

- [ ] Resources are identified by URIs
- [ ] HTTP methods are used correctly
- [ ] Status codes are appropriate
- [ ] Requests are stateless
- [ ] Caching is supported

## Common Misuses

- **Confusing with HTTP CRUD**: REST is more than CRUD operations
- **Using GET for mutations**: GET should be safe and idempotent
- **Ignoring status codes**: Not using appropriate HTTP status codes
- **Tight coupling**: Clients depending on implementation details

## Related Concepts

- [[APIs Distributed Systems/api-versioning]] â€” API Versioning
- [[APIs Distributed Systems/L03-Backward-Compatibility]] â€” Backward Compatibility
- [[APIs Distributed Systems/L04-Data-Transfer-Objects]] â€” Data Transfer Objects
- [[APIs Distributed Systems/L05-Backend-for-Frontend]] â€” Backend for Frontend

## Project Observations

The project uses TypeScript with Express, which supports REST through:
- Route definitions
- Middleware for validation
- Response formatting
- Error handling

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S061-rest-dissertation|Roy Fielding â€” Architectural Styles and the Design of Network-based Software Architectures]]

**End of REST Note**
