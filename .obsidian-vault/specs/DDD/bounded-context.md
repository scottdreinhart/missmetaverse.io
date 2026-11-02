---
slug: bounded-context
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/BoundedContext.html
date: 2026-11-02
tags:
  - ddd
  - bounded-context
  - domain-modeling
  - architecture
---

# Bounded Context

## Definition

Bounded Context is **a explicit boundary within which a domain model is valid and a ubiquitous language applies**.

> "Each context map has a bounded context that defines the applicability of the model." — Eric Evans

## Problem Addressed

Without bounded contexts:
- **Model confusion**: The same term means different things in different parts of the system
- **Model bloat**: One model tries to cover everything and becomes unwieldy
- **Team confusion**: Teams don't know which model they're working with
- **Integration issues**: Different teams use different terms for the same concept

## Scope and Boundaries

- Bounded Context ≠ Context Map (bounded context is a single model, context map is the relationship between bounded contexts)
- Bounded Context = Model (bounded context defines the boundary of a model)
- Bounded Context is an **architectural boundary**, not a pattern

## When to Apply

- When building complex systems with multiple domains
- when different teams work on different parts of the system
- when the same term has different meanings in different parts of the system
- when scaling development teams

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Bounded contexts add architectural complexity |
| **Time** — Defining boundaries takes time |
| **Over-bounded** — Don't create bounded contexts for simple domains |

## Common Misuses

- **Every module a bounded context**: Not every module needs its own bounded context
- **Ignoring context maps**: Bounded contexts need explicit integration strategies
- **Confusing with microservice**: A bounded context is a modeling concept, not a deployment unit

## Related Concepts

- [Ubiquitous Language](DDD/ubiquitous-language.md) — Each bounded context has its own ubiquitous language
- [Context Map](DDD/context-map.md) — Context map defines relationships between bounded contexts
- [Anti-Corruption Layer](DDD/anti-corruption-layer.md) — Anti-corruption layer protects a bounded context

## Project Observations

- The project uses bounded contexts:
  - The project's architecture patterns note covers DDD concepts
  - TypeScript modules can serve as bounded context boundaries
  - No evidence of bounded contexts in existing code (src/ is empty)
- File naming conventions support bounded contexts:
  - `*.bounded-context.ts` — Bounded context files
  - `*.use-case.ts` — Use case files

## Sources

- [[Sources/evans-ddd-ddd-2003|evans-ddd-ddd-2003]]
- [[Sources/fowler-ddd-ddd-2003|fowler-ddd-ddd-2003]]
