---
slug: service-mesh-patterns
sources:
  - https://www.cncf.io/project-standards/service-mesh/
  - https://en.wikipedia.org/wiki/Service_mesh
date: 2026-11-02
tags:
  - service-mesh
  - distributed-systems
  - microservices
  - patterns
---

# Service Mesh Patterns

## Definition

Service Mesh Patterns are **design patterns for working with service mesh infrastructure**.

> "A service mesh is a dedicated infrastructure layer for handling service-to-service communication." — CNCF

## Problem Addressed

Without service mesh patterns:
- **Complexity**: Service communication is complex
- **Security**: Service communication is insecure
- **Observability**: Service communication is hard to observe
- **Reliability**: Service communication is unreliable

## Scope and Boundaries

- Service Mesh Patterns ≠ Service Mesh (service mesh patterns are patterns, service mesh is an infrastructure layer)
- Service Mesh Patterns ≠ Microservices (service mesh patterns are patterns, microservices is an architecture style)
- Service Mesh Patterns is a **patterns**, not an infrastructure layer

## When to Apply

- When building microservices
- when security matters
- when observability is important
- when reliability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Service mesh patterns are complex |
| **Time** — Service mesh patterns take time |
| **Over-service-mesh** — Don't use service mesh for everything |

## Common Misuses

- **Everything service mesh**: Not everything needs service mesh patterns
- **Confusing with microservices**: Service mesh patterns ≠ microservices
- **Over-service-mesh**: Too many service meshes create complexity

## Related Concepts

- [Microservices](Architecture/microservices-patterns.md) — Service mesh patterns with microservices
- [API Gateway](Architecture/api-gateway-pattern.md) — Service mesh patterns with API gateway
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Service mesh patterns with EDA

## Project Observations

- The project uses service mesh patterns:
  - The project's architecture patterns note covers service mesh patterns (from existing notes)
  - No evidence of service mesh patterns in existing code (src/ is empty)
- File naming conventions support service mesh patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
