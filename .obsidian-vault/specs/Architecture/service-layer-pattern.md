---
slug: service-layer-pattern
sources:
  - https://martinfowler.com/eaaDev/serviceLayer.html
  - https://en.wikipedia.org/wiki/Service-layer_pattern
date: 2026-11-02
tags:
  - service-layer-pattern
  - enterprise-patterns
  - patterns
  - architecture
---

# Service Layer Pattern

## Definition

Service Layer Pattern is a **design pattern that defines an application's boundary with its layers of responsibility**.

> "The Service Layer pattern defines an application's boundary with its layers of responsibility, encapsulating the application logic and coordinating use case execution." — Martin Fowler

## Problem Addressed

Without service layer pattern:
- **Complexity**: Application logic is complex
- **Coupling**: Application logic is coupled to UI
- **Testing**: Hard to test application logic
- **Maintenance**: Hard to maintain application logic

## Scope and Boundaries

- Service Layer Pattern ≠ Business Logic (service layer pattern is a boundary, business logic is a concept)
- Service Layer Pattern ≠ API (service layer pattern is internal, API is external)
- Service Layer Pattern is a **design pattern**, not a business logic pattern

## When to Apply

- When building applications
- When application logic matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Service layer pattern is complex |
| **Time** — Service layer pattern takes time |
| **Over-service-layer** — Don't use service layer for everything |

## Common Misuses

- **Everything service layer**: Not everything needs service layer pattern
- **Confusing with business logic**: Service layer pattern ≠ business logic
- **Over-service-layer**: Too many service layers create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Service layer pattern with DDD
- [Business Logic](Architecture/business-logic.md) — Service layer pattern with business logic
- [API](Architecture/api.md) — Service layer pattern with API

## Project Observations

- The project uses service layer pattern:
  - The project's architecture patterns note covers service layer pattern (from existing notes)
  - No evidence of service layer pattern in existing code (src/ is empty)
- File naming conventions support service layer pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
