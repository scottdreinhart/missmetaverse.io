---
slug: microservices
sources:
  - https://martinfowler.com/articles/microservices.html
  - https://docs.microsoft.com/en-us/azure/architecture/guide/microservices/
date: 2026-11-02
tags:
  - microservices
  - distributed-systems
  - architecture
  - patterns
---

# Microservices

## Definition

Microservices is an **architecture style that structures an application as a collection of loosely coupled services**.

> "Microservices is an architectural style that structures an application as a collection of loosely coupled services." — Martin Fowler

## Problem Addressed

Monolithic architectures lead to:
- **Scaling difficulty**: Hard to scale individual components
- **Deployment difficulty**: Hard to deploy individual components
- **Technology lock-in**: Hard to use different technologies
- **Team coordination**: Hard for multiple teams to work together

## Scope and Boundaries

- Microservices ≠ Distributed Systems (microservices is an architecture style, distributed systems is a category)
- Microservices ≠ SOA (microservices is a specific type of SOA)
- Microservices is an **architecture style**, not a specific pattern

## When to Apply

- When building large applications
- When scaling is important
- When multiple teams are involved
- When technology diversity matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Microservices are complex |
| **Time** — Microservices take time |
| **Over-microservices** — Don't microservice everything |

## Common Misuses

- **Everything microservices**: Not everything needs microservices
- **Confusing with distributed systems**: Microservices ≠ distributed systems
- **Over-microservices**: Too many microservices create complexity

## Related Concepts

- [Modular Monolith](Architecture/modular-monolith.md) — Microservices vs. modular monolith
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Microservices with EDA
- [API Versioning](Architecture/api-versioning.md) — Microservices with API versioning

## Project Observations

- The project uses microservices:
  - The project's architecture patterns note covers microservices (from existing notes)
  - No evidence of microservices in existing code (src/ is empty)
- File naming conventions support microservices:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
