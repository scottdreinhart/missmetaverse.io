---
slug: data-transfer-objects
sources:
  - https://martinfowler.com/bliki/DataTransferObject.html
  - https://docs.microsoft.com/en-us/dotnet/standard/microservices-architecture/microservice-ddc-caching/microservice-ddc-caching
date: 2026-11-02
tags:







  - dto
  - api
  - data-transfer
  - patterns
---

# Data Transfer Objects (DTOs)

## Definition

DTOs are **simple objects that carry data between processes without behavior**. They are used to transfer data between layers or services.

> "A Data Transfer Object is an object that carries data between processes. The motivation for its existence is to reduce the number of remote calls." — Martin Fowler

## Problem Addressed

Without DTOs:
- **Over-fetching**: Sending more data than needed
- **Under-fetching**: Multiple calls for related data
- **Leaking internals**: Exposing internal data structures
- **Coupling**: Clients depend on internal models

## Scope and Boundaries

- DTOs ≠ Entities (DTOs are for transfer, entities are for domain)
- DTOs ≠ View Models (DTOs are for transfer, VMs are for UI)
- DTOs are **data containers**, not business logic

## When to Apply

- When transferring data between layers
- When exposing data via APIs
- When decoupling internal models from external contracts
- When optimizing data transfer

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Boilerplate** — DTOs add code |
| **Mapping** — Need to map between DTOs and entities |
| **Duplication** — DTOs duplicate entity structure |

## Common Misuses

- **DTOs everywhere**: Not every data transfer needs a DTO
- **Confusing with entities**: DTOs ≠ domain entities
- **Over-mapping**: Complex mapping logic in DTOs

## Related Concepts

- [REST](Architecture/architecture-patterns.md) — REST APIs use DTOs
- [API Versioning](Architecture/api-versioning.md) — Versioned DTOs
- [DDD Patterns](Architecture/ddd-patterns.md) — DTOs separate from entities

## Project Observations

- No DTOs in existing code (src/ is empty)
- The project's architecture patterns note covers DTOs
- File naming conventions support DTOs:
  - `*.schema.ts` — DTO schemas
  - `*.mapper.ts` — DTO-to-entity mapping

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



