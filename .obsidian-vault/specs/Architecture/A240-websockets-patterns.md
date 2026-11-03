---
slug: websockets-patterns
sources:
  - https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API
  - https://en.wikipedia.org/wiki/WebSocket
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - type/concept
  - domain/frontend
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - websockets
  - real-time
  - api
  - patterns
---

# WebSockets Patterns

## Definition

WebSockets Patterns are **design patterns for working with WebSockets for real-time communication**.

> "WebSocket is a computer communications protocol, providing full-duplex communication channels over a single TCP connection." — Wikipedia

## Problem Addressed

Without WebSockets patterns:
- **Real-time**: Can't communicate in real-time
- **Latency**: High latency in communication
- **Scalability**: Hard to scale real-time communication
- **User experience**: Poor user experience

## Scope and Boundaries

- WebSockets ≠ REST (WebSockets is a protocol, REST is an architecture style)
- WebSockets ≠ HTTP (WebSockets is a protocol, HTTP is a protocol)
- WebSockets is a **protocol**, not an architecture style

## When to Apply

- When building applications
- when real-time communication matters
- when latency is important
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — WebSockets are complex |
| **Time** — WebSockets take time |
| **Over-WebSockets** — Don't use WebSockets for everything |

## Common Misuses

- **Everything WebSockets**: Not everything needs WebSockets
- **Confusing with REST**: WebSockets ≠ REST
- **Over-WebSockets**: Too much WebSockets creates complexity

## Related Concepts

- [REST API Design](Architecture/rest-api-design.md) — WebSockets with REST
- [GraphQL Patterns](Architecture/graphql-patterns.md) — WebSockets with GraphQL
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — WebSockets with EDA

## Project Observations

- The project uses WebSockets:
  - The project's architecture patterns note covers WebSockets (from existing notes)
  - No evidence of WebSockets in existing code (src/ is empty)
- File naming conventions support WebSockets:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




