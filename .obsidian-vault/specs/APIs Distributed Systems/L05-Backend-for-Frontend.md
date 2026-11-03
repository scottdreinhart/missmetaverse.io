---
slug: bff
sources:
  - https://www.thoughtworks.com/radar/techniques/backend-for-frontend
  - https://martinfowler.com/articles/201701-frontend.html
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/optimization
  - bff
  - api
  - backend
  - frontend
---

# Backend for Frontend

## Definition

Backend for Frontend (BFF) is **a pattern where a dedicated backend service is created for each frontend type (web, mobile, etc.) to aggregate and transform data**.

> "A BFF is a specialized backend service that serves a specific frontend, aggregating data from multiple backend services." — ThoughtWorks

## Problem Addressed

Without BFF:
- **Over-fetching**: Frontends fetch more data than needed
- **Under-fetching**: Frontends make multiple calls
- **Coupling**: Frontends coupled to backend structure
- **Performance**: Frontends get suboptimal data formats

## Scope and Boundaries

- BFF ≠ API Gateway (BFF is per-frontend, API gateway is shared across all frontends)
- BFF = Specialization (BFF specializes for each frontend type)
- BFF is an **architecture pattern**, not a design pattern

## When to Apply

- When building multiple frontend types (web, mobile, etc.)
- when each frontend has different data needs
- when aggregating data from multiple backends
- when frontend-specific transformations are needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — BFF adds backend services |
| **Time** — Implementing BFFs takes time |
| **Duplication** — Common logic may be duplicated |

## Common Misuses

- **Every frontend a BFF**: Not every frontend needs a dedicated BFF
- **BFF as thin wrapper**: BFFs should add value, not just pass through
- **Confusing with API gateway**: BFF is per-frontend, API gateway is shared

## Related Concepts

- [API Gateway](Architecture/api-gateway.md) — API gateway complements BFF
- [DTOs](APIs Distributed Systems/dtos.md) — BFFs use DTOs to transform data
- [REST API Design](APIs Distributed Systems/rest-api-design.md) — BFFs consume REST APIs

## Project Observations

- The project uses BFF:
  - Node.js can serve as BFF
  - TypeScript supports BFF implementation
  - The project's architecture patterns note covers API concepts
  - No evidence of BFF in existing code (src/ is empty)
- File naming conventions support BFF:
  - `*.bff.ts` — BFF files
  - `*.service.ts` — Service files

## Sources

- [[]
- [[Sources/react-docs-2026|react-docs-2026]]




