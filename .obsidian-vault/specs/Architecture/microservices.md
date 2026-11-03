---
slug: microservices
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# Microservices

> **Purpose:** Architectural style decomposing systems into small services.
> **Last Updated:** 2026-11-03

## concept_id
`arch-microservices`

## title
Microservices

## aliases
- Microservices
- Microservice Architecture
- Service-Oriented Architecture (related)

## category
application-architecture

## concept_type
architectural-style

## research_status
verified

## project_adoption
declared

## applicability
- Large teams
- Complex domains
- Scalable systems
- Independent deployment

## tags
- type/style
- domain/architecture
- status/verified
- priority/medium

## source_ids
- martin-fowler-patterns
- evans-ddd-2003

## related_concept_ids
- arch-domain-driven-design
- api-api-gateway
- api-circuit-breaker
- api-eventual-consistency
- ddd-bounded-context

## Definition

Microservices is an architectural style that structures a system as a collection of small, independently deployable services, each owning its own data and business logic.

## Problem Addressed

Without microservices:
- Monoliths become hard to maintain
- Teams are blocked by shared codebase
- Scaling is all-or-nothing
- Technology choices are constrained

## Scope and Boundaries

Microservices apply to:
- Large teams
- Complex domains
- Scalable systems
- Independent deployment

Microservices do not apply to:
- Small teams
- Simple domains
- Rapid prototyping
- Resource-constrained environments

## When to Apply

- Multiple teams working on the same system
- Different parts have different scaling needs
- Independent deployment is desired
- Domain boundaries are clear

## Tradeoffs and When to Avoid

- **Complexity**: Distributed systems are complex
- **Network latency**: Service calls are slower than local calls
- **Data consistency**: Distributed transactions are hard
- **Not for small teams**: Small teams don't need microservices

## Implementation Guidance

1. **Define bounded contexts**: Align services with domains
2. **Define APIs**: Clear service boundaries
3. **Handle failures**: Circuit breakers, retries
4. **Monitor**: Distributed tracing, logging
5. **Deploy independently**: CI/CD for each service

## Verification

- [ ] Services are independently deployable
- [ ] Services own their data
- [ ] Services communicate via APIs
- [ ] Failures are handled gracefully
- [ ] Services are monitored

## Common Misuses

- **Distributed monolith**: Services that are tightly coupled
- **Not using DDD**: Without bounded contexts, services are unclear
- **Ignoring network**: Treating service calls like local calls
- **Over-engineering**: Not needed for small systems

## Related Concepts

- [[Application Architecture/domain-driven-design]] â€” Domain-Driven Design
- [[APIs Distributed Systems/api-gateway-pattern]] â€” API Gateway
- [[APIs Distributed Systems/circuit-breaker]] â€” Circuit Breaker
- [[APIs Distributed Systems/eventual-consistency]] â€” Eventual Consistency
- [[DDD/bounded-context]] â€” Bounded Context

## Project Observations

The project is a frontend application, which may use microservices patterns through:
- Backend for Frontend (BFF) pattern
- API gateway for routing
- Independent service deployment
- Event-driven communication

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S002-evans-ddd-2003|Eric Evans â€” Domain-Driven Design: Tackling Complexity in the Heart of Software]]

**End of Microservices Note**
