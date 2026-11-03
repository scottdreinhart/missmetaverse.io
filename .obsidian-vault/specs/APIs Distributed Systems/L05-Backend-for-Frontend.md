---
slug: bff
sources:
  - https://www.thoughtworks.com/radar/techniques/backend-for-frontend
  - https://martinfowler.com/articles/201701-frontend.html
date: 2026-11-02
tags:
  - bff
  - api
  - backend
  - frontend
# Backend for Frontend

## Definition

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Backend for Frontend (BFF) is **a pattern where a dedicated backend service is created for each frontend type (web, mobile, etc.) to aggregate and transform data**.

> "A BFF is a specialized backend service that serves a specific frontend, aggregating data from multiple backend services." â€” ThoughtWorks

## Problem Addressed

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Without BFF:
- **Over-fetching**: Frontends fetch more data than needed
- **Under-fetching**: Frontends make multiple calls
- **Coupling**: Frontends coupled to backend structure
- **Performance**: Frontends get suboptimal data formats

## Scope and Boundaries

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- BFF â‰  API Gateway (BFF is per-frontend, API gateway is shared across all frontends)
- BFF = Specialization (BFF specializes for each frontend type)
- BFF is an **architecture pattern**, not a design pattern

## When to Apply

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- When building multiple frontend types (web, mobile, etc.)
- when each frontend has different data needs
- when aggregating data from multiple backends
- when frontend-specific transformations are needed

## Tradeoffs and When to Avoid

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

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
| **Complexity** â€” BFF adds backend services |
| **Time** â€” Implementing BFFs takes time |
| **Duplication** â€” Common logic may be duplicated |

## Common Misuses

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- **Every frontend a BFF**: Not every frontend needs a dedicated BFF
- **BFF as thin wrapper**: BFFs should add value, not just pass through
- **Confusing with API gateway**: BFF is per-frontend, API gateway is shared

## Related Concepts

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- [API Gateway](Architecture/api-gateway.md) â€” API gateway complements BFF
- [DTOs](APIs Distributed Systems/dtos.md) â€” BFFs use DTOs to transform data
- [REST API Design](APIs Distributed Systems/rest-api-design.md) â€” BFFs consume REST APIs

## Project Observations

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- The project uses BFF:
  - Node.js can serve as BFF
  - TypeScript supports BFF implementation
  - The project's architecture patterns note covers API concepts
  - No evidence of BFF in existing code (src/ is empty)
- File naming conventions support BFF:
  - `*.bff.ts` â€” BFF files
  - `*.service.ts` â€” Service files

## Sources

## concept_id
l05-backend-for-frontend

## title
Backend for Frontend

## aliases
- L05-Backend-for-Frontend

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




