---
slug: soa
sources:
  - https://martinfowler.com/articles/soa.html
  - https://en.wikipedia.org/wiki/Service-oriented_architecture
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - domain/frontend
  - type/guide
  - type/concept
  - status/complete
  - type/reference
  - domain/architecture
  - soa
  - service-oriented-architecture
  - architecture
  - microservices
---

# Service-Oriented Architecture

## Definition

Service-Oriented Architecture (SOA) is **an architectural style that structures applications as a collection of loosely coupled, interoperable services that communicate over a network**.

> "SOA is an architectural style that supports service-orientation, where services are loosely coupled, self-contained, and communicate over a network." — Martin Fowler

## Problem Addressed

Without SOA:
- **Tight coupling**: Systems are tightly coupled
- **Reusability**: Code can't be reused across systems
- **Integration**: Hard to integrate different systems
- **Scalability**: Can't scale individual components

## Scope and Boundaries

- SOA ≠ Microservices (SOA services are typically larger and share infrastructure, microservices are smaller and independent)
- SOA = Services (SOA structures applications as services)
- SOA is an **architectural style**, not a pattern

## When to Apply

- When building enterprise applications
- when system integration is important
- when reusability is needed
- when multiple platforms need to communicate

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — SOA adds infrastructure complexity |
| **Time** — Implementing SOA takes time |
| **Over-soa**: Not every application needs SOA |

## Common Misuses

- **Everything a service**: Not every operation needs a service
- **Ignoring governance**: SOA requires service governance
- **Confusing with microservices**: SOA services are typically larger and share infrastructure, microservices are smaller and independent

## Related Concepts

- [Microservices](Architecture/microservices.md) — Microservices are a form of SOA
- [API Gateway](Architecture/api-gateway.md) — API gateway manages SOA services
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Event-driven architecture complements SOA

## Project Observations

- The project uses SOA:
  - Node.js supports SOA through service architecture
  - TypeScript supports SOA through service interfaces
  - The project's architecture patterns note covers SOA concepts
  - No evidence of SOA in existing code (src/ is empty)
- File naming conventions support SOA:
  - `*.service.ts` — Service files
  - `*.api.ts` — API files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]




