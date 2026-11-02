---
slug: rest-api-design
sources:
  - https://restfulapi.net/
  - https://martinfowler.com/articles/richardsonMaturityModel.html
date: 2026-11-02
tags:
  - rest
  - api
  - design
  - patterns
---

# REST API Design

## Definition

REST API Design is an **architecture style for designing networked applications using HTTP methods and resources**.

> "REST (Representational State Transfer) is an architecture style for designing networked applications." — Wikipedia

## Problem Addressed

Without REST API design:
- **Inconsistency**: APIs are inconsistent
- **Coupling**: Clients are coupled to APIs
- **Versioning**: Hard to version APIs
- **Scalability**: Hard to scale APIs

## Scope and Boundaries

- REST ≠ GraphQL (REST is an architecture style, GraphQL is a query language)
- REST ≠ API (REST is an architecture style, API is a boundary)
- REST is an **architecture style**, not a query language

## When to Apply

- When building applications
- when API consistency matters
- when scalability is important
- when versioning is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — REST is complex |
| **Time** — REST takes time |
| **Over-REST** — Don't use REST for everything |

## Common Misuses

- **Everything REST**: Not everything needs REST
- **Confusing with GraphQL**: REST ≠ GraphQL
- **Over-REST**: Too much REST creates complexity

## Related Concepts

- [GraphQL Patterns](Architecture/graphql-patterns.md) — REST with GraphQL
- [API Versioning](Architecture/api-versioning.md) — REST with API versioning
- [Data Transfer Objects](Architecture/data-transfer-objects.md) — REST with DTOs

## Project Observations

- The project uses REST:
  - The project's architecture patterns note covers REST (from existing notes)
  - No evidence of REST in existing code (src/ is empty)
- File naming conventions support REST:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
