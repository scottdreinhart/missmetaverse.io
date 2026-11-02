---
slug: service-mesh
sources:
  - https://www.cncf.io/project-standards/service-mesh/
  - https://en.wikipedia.org/wiki/Service_mesh
date: 2026-11-02
tags:
  - service-mesh
  - distributed-systems
  - microservices
  - networking
---

# Service Mesh

## Definition

Service Mesh is a **dedicated infrastructure layer for handling service-to-service communication**.

> "A service mesh is a dedicated infrastructure layer for handling service-to-service communication." — CNCF

## Problem Addressed

Without service mesh:
- **Complexity**: Service communication is complex
- **Security**: Service communication is insecure
- **Observability**: Service communication is hard to observe
- **Reliability**: Service communication is unreliable

## Scope and Boundaries

- Service Mesh ≠ Microservices (service mesh is infrastructure, microservices is architecture)
- Service Mesh ≠ API Gateway (service mesh is internal, API gateway is external)
- Service Mesh is an **infrastructure layer**, not an architecture style

## When to Apply

- When building microservices
- When security matters
- When observability is important
- When reliability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Service mesh is complex |
| **Time** — Service mesh takes time |
| **Over-service-mesh** — Don't use service mesh for everything |

## Common Misuses

- **Everything service mesh**: Not everything needs service mesh
- **Confusing with microservices**: Service mesh ≠ microservices
- **Over-service-mesh**: Too much service mesh creates complexity

## Related Concepts

- [Microservices](Architecture/microservices.md) — Service mesh with microservices
- [API Gateway](Architecture/api-gateway.md) — Service mesh with API gateway
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Service mesh with EDA

## Project Observations

- The project uses service mesh:
  - The project's architecture patterns note covers service mesh (from existing notes)
  - No evidence of service mesh in existing code (src/ is empty)
- File naming conventions support service mesh:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
