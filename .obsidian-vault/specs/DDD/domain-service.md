---
slug: domain-service
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/DomainService.html
date: 2026-11-02
tags:
  - ddd
  - domain-service
  - domain-modeling
  - business-logic
---

# Domain Service

## Definition

Domain Service is **a operation between two or more entities that does not naturally belong to any single entity**.

> "A domain operation that is not a natural responsibility of an Entity or Value Object." — Eric Evans

## Problem Addressed

Without domain services:
- **Anemic domain**: Domain objects become data containers only
- **Logic placement**: Business logic has nowhere to live
- **Duplication**: Same logic duplicated across entities
- **Violation**: SRP violated when entities do too much

## Scope and Boundaries

- Domain Service ≠ Application Service (domain service contains domain logic, application service orchestrates application steps)
- Domain Service = Business Logic (domain service contains business rules)
- Domain Service is a **domain model building block**, not a pattern

## When to Apply

- When building domain models
- when business logic doesn't belong to a single entity
- when anemic domain model is a risk
- when business rules need explicit representation

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Domain services add architectural complexity |
| **Time** — Designing domain services takes time |
| **Over-service** — Not every operation needs a service |

## Common Misuses

- **Everything a service**: Not every operation needs a domain service
- **Transaction script**: Domain services should contain domain logic, not transaction scripts
- **Confusing with application service**: Domain services contain domain logic, application services orchestrate

## Related Concepts

- [Entity](DDD/entity.md) — Domain services operate on entities
- [Value Object](DDD/value-object.md) — Domain services operate on value objects
- [Application Service](DDD/application-service.md) — Application services orchestrate domain services

## Project Observations

- The project uses domain services:
  - TypeScript functions can serve as domain services
  - The project's architecture patterns note covers DDD concepts
  - No evidence of domain services in existing code (src/ is empty)
- File naming conventions support domain services:
  - `*.service.ts` — Service files
  - `*.use-case.ts` — Use case files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

