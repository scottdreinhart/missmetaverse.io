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
# Data Transfer Objects (DTOs)

## Definition

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
DTOs are **simple objects that carry data between processes without behavior**. They are used to transfer data between layers or services.

> "A Data Transfer Object is an object that carries data between processes. The motivation for its existence is to reduce the number of remote calls." â€” Martin Fowler

## Problem Addressed

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without DTOs:
- **Over-fetching**: Sending more data than needed
- **Under-fetching**: Multiple calls for related data
- **Leaking internals**: Exposing internal data structures
- **Coupling**: Clients depend on internal models

## Scope and Boundaries

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- DTOs â‰  Entities (DTOs are for transfer, entities are for domain)
- DTOs â‰  View Models (DTOs are for transfer, VMs are for UI)
- DTOs are **data containers**, not business logic

## When to Apply

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When transferring data between layers
- When exposing data via APIs
- When decoupling internal models from external contracts
- When optimizing data transfer

## Tradeoffs and When to Avoid

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

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
| **Boilerplate** â€” DTOs add code |
| **Mapping** â€” Need to map between DTOs and entities |
| **Duplication** â€” DTOs duplicate entity structure |

## Common Misuses

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **DTOs everywhere**: Not every data transfer needs a DTO
- **Confusing with entities**: DTOs â‰  domain entities
- **Over-mapping**: Complex mapping logic in DTOs

## Related Concepts

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [REST](Architecture/architecture-patterns.md) â€” REST APIs use DTOs
- [API Versioning](Architecture/api-versioning.md) â€” Versioned DTOs
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” DTOs separate from entities

## Project Observations

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- No DTOs in existing code (src/ is empty)
- The project's architecture patterns note covers DTOs
- File naming conventions support DTOs:
  - `*.schema.ts` â€” DTO schemas
  - `*.mapper.ts` â€” DTO-to-entity mapping

## Sources

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



