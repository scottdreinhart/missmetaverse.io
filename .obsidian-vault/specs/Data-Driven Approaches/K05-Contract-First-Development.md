---
slug: contract-first
sources:
  - https://swagger.io/
  - https://www.openapis.org/
date: 2026-11-02
tags:
  - contract-first
  - api
  - design
  - swagger
  - --
# Contract-First Development

## Definition

Contract-First Development is **an API design approach where the API contract (schema) is defined before implementation, ensuring clear agreements between consumers and providers**.

> "Contract-first development defines the API contract before implementation, ensuring clear agreements between consumers and providers." â€” Swagger

## Problem Addressed

Without contract-first:
- **Inconsistent APIs**: APIs are inconsistent across services
- **Breaking changes**: Changes break consumers without warning
- **Documentation**: Documentation is an afterthought
- **Testing**: Hard to test APIs without a contract

## Scope and Boundaries

- Contract-First â‰  Code-First (contract-first defines the contract first, code-first generates the contract from code)
- Contract-First = Agreement (contract-first defines agreements before implementation)
- Contract-First is a **design approach**, not a pattern

## When to Apply

- When building APIs with multiple consumers
- when API stability is important
- when documentation is critical
- when multiple teams work on the same API

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** â€” Defining contracts takes time |
| **Complexity** â€” More upfront design required |
| **Rigidity** â€” Changes to contract require versioning |

## Common Misuses

- **Everything contract-first**: Not every API needs contract-first
- **Ignoring evolution**: Contracts must evolve over time
- **Confusing with code-first**: Contract-first defines the contract first, code-first generates from code

## Related Concepts

- [Schema-Driven Development](Data-Driven Approaches/schema-driven-development.md) â€” Schema-driven development is related to contract-first
- [API Versioning](Architecture/api-versioning.md) â€” API versioning manages contract changes
- [REST API Design](APIs Distributed Systems/rest-api-design.md) â€” REST API design uses contracts

## Project Observations

- The project uses contract-first:
  - OpenAPI/Swagger supports contract-first development
  - TypeScript can enforce contracts through type system
  - The project's architecture patterns note covers API concepts
  - No evidence of contract-first in existing code (src/ is empty)
- File naming conventions support contract-first:
  - `*.schema.ts` â€” Schema files
  - `*.types.ts` â€” Type files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]



