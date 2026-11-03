---
slug: graphql-patterns
sources:
  - https://graphql.org/
  - https://www.apollographql.com/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - type/concept
  - domain/frontend
  - domain/testing
  - type/guide
  - domain/optimization
  - status/complete
  - type/reference
  - domain/architecture
  - graphql
  - api
  - patterns
  - frontend
---

# GraphQL Patterns

## Definition

GraphQL Patterns are **design patterns for working with GraphQL as a query language for APIs**.

> "GraphQL is a query language for APIs and a runtime for fulfilling those queries with your existing data." — GraphQL

## Problem Addressed

Without GraphQL patterns:
- **Over-fetching**: Too much data is fetched
- **Under-fetching**: Too many requests are made
- **Coupling**: API is coupled to client
- **Versioning**: Hard to version APIs

## Scope and Boundaries

- GraphQL ≠ REST (GraphQL is a query language, REST is an architecture style)
- GraphQL ≠ API (GraphQL is a query language, API is a boundary)
- GraphQL is a **query language**, not an architecture style

## When to Apply

- When building applications
- when API flexibility matters
- when performance is important
- when versioning is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — GraphQL is complex |
| **Time** — GraphQL takes time |
| **Over-GraphQL** — Don't use GraphQL for everything |

## Common Misuses

- **Everything GraphQL**: Not everything needs GraphQL
- **Confusing with REST**: GraphQL ≠ REST
- **Over-GraphQL**: Too much GraphQL creates complexity

## Related Concepts

- [REST API](Architecture/rest-api.md) — GraphQL with REST
- [API Versioning](Architecture/api-versioning.md) — GraphQL with API versioning
- [Data Transfer Objects](Architecture/data-transfer-objects.md) — GraphQL with DTOs

## Project Observations

- The project uses GraphQL:
  - The project's architecture patterns note covers GraphQL (from existing notes)
  - No evidence of GraphQL in existing code (src/ is empty)
- File naming conventions support GraphQL:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




