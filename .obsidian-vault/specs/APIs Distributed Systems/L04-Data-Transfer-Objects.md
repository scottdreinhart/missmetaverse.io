---
slug: dtos
sources:
  - https://martinfowler.com/bliki/DataTransferObject.html
  - https://www.npmjs.com/package/class-transformer
date: 2026-11-02
tags:
  - dto
  - api
  - data-transfer
  - serialization
# Data Transfer Objects

## Definition

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Data Transfer Objects (DTOs) are **objects that carry data between processes to reduce the number of method calls, encapsulating data without business logic**.

> "A DTO is an object that carries data between processes. The reason for its existence is to reduce the number of method calls required." â€” Martin Fowler

## Problem Addressed

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Without DTOs:
- **Over-fetching**: Exposing more data than needed
- **Under-fetching**: Multiple calls needed for related data
- **Coupling**: Domain model coupled to API consumers
- **Serialization**: Hard to serialize domain models

## Scope and Boundaries

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- DTO â‰  Domain Model (DTO carries data, domain model contains business logic)
- DTO = Data Carrying (DTO carries data between processes)
- DTO is a **data pattern**, not a design pattern

## When to Apply

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- When building APIs
- when data needs to be transferred between processes
- when domain model should not be exposed
- when serialization is needed

## Tradeoffs and When to Avoid

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Boilerplate** â€” DTOs add boilerplate code |
| **Mapping** â€” Mapping between DTOs and domain models |
| **Over-DTO** â€” Not every data transfer needs a DTO |

## Common Misuses

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- **Everything a DTO**: Not every data transfer needs a DTO
- **DTOs with logic**: DTOs should not contain business logic
- **Confusing with value object**: DTOs carry data between processes, value objects represent domain concepts

## Related Concepts

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- [REST API Design](APIs Distributed Systems/rest-api-design.md) â€” REST APIs use DTOs
- [GraphQL Patterns](APIs Distributed Systems/graphql-patterns.md) â€” GraphQL uses DTOs
- [Service Layer Pattern](Architecture/service-layer-pattern.md) â€” Service layer uses DTOs

## Project Observations

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- The project uses DTOs:
  - TypeScript supports DTOs through interfaces and classes
  - class-transformer supports DTO serialization
  - The project's architecture patterns note covers API concepts
  - No evidence of DTOs in existing code (src/ is empty)
- File naming conventions support DTOs:
  - `*.dto.ts` â€” DTO files
  - `*.data.ts` â€” Data files

## Sources

## concept_id
l04-data-transfer-objects

## title
Data Transfer Objects

## aliases
- L04-Data-Transfer-Objects

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- [[]
- [[Sources/react-docs-2026|react-docs-2026]]




