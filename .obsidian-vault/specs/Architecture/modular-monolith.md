---
slug: modular-monolith
sources:
  - https://martinfowler.com/bliki/ModularMonolith.html
  - https://www.infoq.com/articles/modular-monolith/
date: 2026-11-02
tags:
  - modular-monolith
  - architecture
  - monolith
  - microservices
---

# Modular Monolith

## Definition

A Modular Monolith is a **single deployed application that maintains explicit internal module boundaries**. It combines the simplicity of a monolith with the organizational benefits of modular design.

> "A modular monolith is a single deployment unit with well-defined module boundaries." — Martin Fowler

## Problem Addressed

Monoliths without modules lead to:
- **Spaghetti code**: No clear boundaries between concerns
- **Team coordination**: Developers interfere with each other's work
- **Testing difficulty**: Hard to test isolated components

## Scope and Boundaries

- Modular Monolith ≠ Microservices (single deployment unit)
- Modules are **logical boundaries**, not physical deployments
- Modules can evolve into microservices later if needed

## When to Apply

- When starting a new project
- When a monolith is too disorganized
- When teams need clear boundaries without deployment complexity
- As a starting point before considering microservices

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Single deployment** — Can't scale modules independently |
| **Shared database** — Modules share the same data layer |
| **Single point of failure** — All modules go down together |

## Common Misuses

- **Fake modules**: Physical separation without logical boundaries
- **Over-engineering**: Creating modules before they're needed
- **Confusing with microservices**: Modular monolith is a single deployment

## Related Concepts

- [Microservices](Architecture/architecture-patterns.md) — Alternative for scaling
- [Clean Architecture](Architecture/clean-architecture.md) — Module boundaries
- [DDD Patterns](Architecture/ddd-patterns.md) — Module design

## Project Observations

- The project is currently a single application (no evidence of microservices)
- File naming conventions support modular design
- pnpm workspace supports modular structure if needed

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
