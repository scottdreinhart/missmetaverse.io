---
slug: soa
sources:
  - https://martinfowler.com/articles/soa.html
  - https://en.wikipedia.org/wiki/Service-oriented_architecture
date: 2026-11-02
tags:
  - soa
  - service-oriented-architecture
  - architecture
  - microservices
# Service-Oriented Architecture

## Definition

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Service-Oriented Architecture (SOA) is **an architectural style that structures applications as a collection of loosely coupled, interoperable services that communicate over a network**.

> "SOA is an architectural style that supports service-orientation, where services are loosely coupled, self-contained, and communicate over a network." â€” Martin Fowler

## Problem Addressed

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without SOA:
- **Tight coupling**: Systems are tightly coupled
- **Reusability**: Code can't be reused across systems
- **Integration**: Hard to integrate different systems
- **Scalability**: Can't scale individual components

## Scope and Boundaries

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- SOA â‰  Microservices (SOA services are typically larger and share infrastructure, microservices are smaller and independent)
- SOA = Services (SOA structures applications as services)
- SOA is an **architectural style**, not a pattern

## When to Apply

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building enterprise applications
- when system integration is important
- when reusability is needed
- when multiple platforms need to communicate

## Tradeoffs and When to Avoid

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

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
| **Complexity** â€” SOA adds infrastructure complexity |
| **Time** â€” Implementing SOA takes time |
| **Over-soa**: Not every application needs SOA |

## Common Misuses

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything a service**: Not every operation needs a service
- **Ignoring governance**: SOA requires service governance
- **Confusing with microservices**: SOA services are typically larger and share infrastructure, microservices are smaller and independent

## Related Concepts

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Microservices](Architecture/microservices.md) â€” Microservices are a form of SOA
- [API Gateway](Architecture/api-gateway.md) â€” API gateway manages SOA services
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) â€” Event-driven architecture complements SOA

## Project Observations

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses SOA:
  - Node.js supports SOA through service architecture
  - TypeScript supports SOA through service interfaces
  - The project's architecture patterns note covers SOA concepts
  - No evidence of SOA in existing code (src/ is empty)
- File naming conventions support SOA:
  - `*.service.ts` â€” Service files
  - `*.api.ts` â€” API files

## Sources

## concept_id
a205-soa

## title
Service-Oriented Architecture

## aliases
- A205-soa

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




