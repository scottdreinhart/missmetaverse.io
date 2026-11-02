---
slug: application-service
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/ApplicationService.html
date: 2026-11-02
tags:
  - ddd
  - application-service
  - domain-modeling
  - orchestration
---

# Application Service

## Definition

Application Service is **a operation defined by the way the application needs to work, coordinating domain objects to accomplish a task**.

> "An operation offered as an interface by a layer specifically designed to coordinate application tasks." — Martin Fowler

## Problem Addressed

Without application services:
- **No orchestration**: No clear coordination of domain objects
- **UI coupling**: Domain logic coupled to UI
- **Transaction issues**: No clear transaction boundaries
- **Security issues**: No clear security boundaries

## Scope and Boundaries

- Application Service ≠ Domain Service (application service orchestrates, domain service contains domain logic)
- Application Service = Orchestration (application service coordinates domain objects)
- Application Service is a **layer pattern**, not a domain pattern

## When to Apply

- When building applications with domain models
- when coordination of domain objects is needed
- when transaction boundaries need to be defined
- when security boundaries are important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Application services add architectural layers |
| **Time** — Designing application services takes time |
| **Over-service** — Not every operation needs an application service |

## Common Misuses

- **Every operation a service**: Not every operation needs an application service
- **Domain logic in application service**: Application services should orchestrate, not contain domain logic
- **Confusing with domain service**: Application services orchestrate, domain services contain domain logic

## Related Concepts

- [Domain Service](DDD/domain-service.md) — Domain services contain domain logic, application services orchestrate them
- [Use Case](DDD/use-case.md) — Application services often implement use cases
- [Service Layer](Architecture/service-layer-pattern.md) — Application services are a form of service layer

## Project Observations

- The project uses application services:
  - TypeScript functions can serve as application services
  - The project's architecture patterns note covers DDD concepts
  - No evidence of application services in existing code (src/ is empty)
- File naming conventions support application services:
  - `*.use-case.ts` — Use case files
  - `*.service.ts` — Service files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

