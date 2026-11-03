---
slug: microservices-architecture
tags:
  - application-design   - architecture-patterns   - core-concepts

  - architecture   - application-design   - patterns
---

# Microservices Architecture

> **Purpose:** Structure apps with Microservices.
> **Last Updated:** 2026-11-03

## concept_id
`microservices-architecture`

## title
Microservices Architecture

## aliases
- Microservices
- Microservice Architecture
- Service-Oriented
- Distributed Services

## category
application-architecture

## concept_type
architectural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Distributed systems
- Independent scaling
- Team autonomy
- Polyglot programming

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- microservices-patterns

## related_concept_ids
- microservices-architecture
- Application Architecture/modular-monolith-architecture
- service-mesh
- api-gateway

## Definition

Microservices Architecture structures applications as a collection of loosely coupled, independently deployable services organized around business capabilities.

## Problem Addressed

Without Microservices:
- Deployment is coupled
- Scaling is difficult
- Teams are blocked
- Technology is locked

## Scope of Boundaries

Microservices applies to:
- Distributed systems
- Independent scaling
- Team autonomy
- Polyglot programming

Microservices does not apply to:
- Simple apps
- Small teams
- Single deployment
- Sync communication

## When to Apply

- Building distributed systems
- Needing independent scaling
- Organizing large teams
- Using multiple technologies

## Tradeoffs and When to Avoid

- **Complexity**: Microservices add complexity
- **Not for simple apps**: Simple apps don't need microservices
- **Not for small teams**: Small teams don't need microservices
- **Not for sync**: Sync communication doesn't need microservices

## Implementation Guidance

1. **Define services**: Define service boundaries
2. **Choose tech**: Choose technology per service
3. **Deploy independently**: Deploy services independently
4. **Communicate async**: Use async communication
5. **Monitor**: Monitor services

## Verification

- [ ] Services defined
- [ ] Tech chosen
- [ ] Deployment independent
- [ ] Communication async
- [ ] Services monitored

## Common Misuses

- **Distributed monolith**: Creating distributed monolith
- **Not independent**: Services not independently deployable
- **Not monitoring**: Not monitoring services
- **Not async**: Using sync communication

## Related Concepts

- [[Application Architecture/microservices-architecture]] â€” Microservices Architecture
- [[Application Architecture/modular-monolith-architecture]] â€” Modular Monolith
- [[APIs Distributed Systems/service-mesh]] â€” Service Mesh
- [[APIs Distributed Systems/api-gateway-pattern]] â€” API Gateway

## Project Observations

The project uses Microservices Architecture through:
- Service boundary definition
- Independent deployment
- Async communication
- Service monitoring

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/microsoft-distributed-systems.md|Microservices Patterns â€” Christensen]]

**End of Microservices Architecture Note**
