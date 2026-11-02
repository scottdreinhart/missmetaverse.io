---
slug: microservices-patterns
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

# Microservices Patterns

## Definition

Microservices Patterns are **design patterns for working with microservices architecture**.

> "Microservices is an architectural style that structures an application as a collection of loosely coupled services." — Martin Fowler

## Problem Addressed

Without microservices patterns:
- **Scaling difficulty**: Hard to scale individual components
- **Deployment difficulty**: Hard to deploy individual components
- **Technology lock-in**: Hard to use different technologies
- **Team coordination**: Hard for multiple teams to work together

## Scope and Boundaries

- Microservices Patterns ≠ Microservices (microservices patterns are patterns, microservices is an architecture style)
- Microservices Patterns ≠ Distributed Systems (microservices patterns are patterns, distributed systems is a category)
- Microservices Patterns is a **patterns**, not an architecture style

## When to Apply

- When building large applications
- when scaling is important
- when multiple teams are involved
- when technology diversity matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Microservices patterns are complex |
| **Time** — Microservices patterns take time |
| **Over-microservices** — Don't use microservices for everything |

## Common Misuses

- **Everything microservices**: Not everything needs microservices patterns
- **Confusing with distributed systems**: Microservices patterns ≠ distributed systems
- **Over-microservices**: Too many microservices create complexity

## Related Concepts

- [Modular Monolith](Architecture/modular-monolith.md) — Microservices patterns with modular monolith
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Microservices patterns with EDA
- [API Versioning](Architecture/api-versioning.md) — Microservices patterns with API versioning

## Project Observations

- The project uses microservices patterns:
  - The project's architecture patterns note covers microservices patterns (from existing notes)
  - No evidence of microservices patterns in existing code (src/ is empty)
- File naming conventions support microservices patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

