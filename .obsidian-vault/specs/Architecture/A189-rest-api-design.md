---
slug: rest-api-design
sources:
  - https://restfulapi.net/
  - https://martinfowler.com/articles/richardsonMaturityModel.html
date: 2026-11-02
tags:

  - maturity/deprecated










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

- [GraphQL Patterns](graphql-patterns.md) — REST with GraphQL
- [API Versioning](api-versioning.md) — REST with API versioning
- [Data Transfer Objects](data-transfer-objects.md) — REST with DTOs

## Project Observations

- The project uses REST:
  - The project's architecture patterns note covers REST (from existing notes)
  - No evidence of REST in existing code (src/ is empty)
- File naming conventions support REST:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

---

## Copilot Instructions

### When to Read This Note
- Creating new API endpoints
- Designing API contracts
- Code review: checking REST compliance
- API documentation updates

### What to Do With This Information
1. **Resource naming**: Use plural nouns for collections (`/users`, `/orders`), singular for items (`/users/123`)
2. **HTTP methods**: GET (read), POST (create), PUT (full update), PATCH (partial update), DELETE (remove)
3. **Status codes**: 200 (OK), 201 (Created), 204 (No Content), 400 (Bad Request), 401 (Unauthorized), 404 (Not Found), 409 (Conflict), 429 (Rate Limit), 500 (Server Error)
4. **Response format**: `{ data, error, pagination }` for all endpoints
5. **Versioning**: Use URL path versioning (`/api/v1/`)
6. **Pagination**: Use cursor-based pagination (not offset-based)

### Tools to Use
- **VS Code Extension**: REST Client — for testing API endpoints
- **VS Code Extension**: Thunder Client — alternative API testing
- **npm Package**: `zod` — for request/response validation
- **npm Package**: `@fastify/swagger` — for OpenAPI documentation
- **Terminal Command**: `pnpm add zod @fastify/swagger` — install validation and docs
- **Terminal Command**: `pnpm add -D @types/supertest` — for API testing types

### Agents to Invoke
- **Code Review Agent**: Run when reviewing API endpoint changes
- **Security Review Agent**: Run when adding authentication/authorization to endpoints

### Integration with Other Notes
- Read [api-versioning](https://restfulapi.net/versioning/) for versioning strategies
- Read [data-transfer-objects](https://martinfowler.com/eaaCatalog/dataTransferObject.html) for DTO patterns
- Read [rate-limiting](https://cheatsheetseries.owasp.org/cheatsheets/Rate_Limiting_Cheat_Sheet.html) for rate limiting implementation
- Read [authentication](https://en.wikipedia.org/wiki/Authentication) for auth patterns
- Read [[project-structure-mapping]] for controller folder placement

### Common Pitfalls
- Don't use verbs in resource names (`/getUsers` → `/users`)
- Don't mix resource types in URLs (`/users/123/orders/items` → `/users/123/orders`)
- Don't return raw database entities (use DTOs)
- Don't forget to version your API (`/api/v1/`)
- Don't use offset-based pagination for large datasets
- Don't expose internal error details in API responses

### Quick Validation Checklist
- [ ] Are resource names plural nouns?
- [ ] Are HTTP methods used correctly?
- [ ] Are status codes appropriate?
- [ ] Is the response format consistent?
- [ ] Is the API versioned?
- [ ] Is pagination cursor-based?
- [ ] Are errors structured consistently?

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




