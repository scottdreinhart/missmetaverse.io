---
slug: context-map
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/ContextMap.html
date: 2026-11-02
tags:
  - ddd
  - context-map
  - domain-modeling
  - integration
---

# Context Map

## Definition

Context Map is **a document that describes the relationships between bounded contexts and the integration patterns used between them**.

> "The context map is a diagram that shows the relationships between bounded contexts." — Eric Evans

## Problem Addressed

Without context map:
- **Integration chaos**: No clear understanding of how bounded contexts interact
- **Coupling**: Bounded contexts become tightly coupled
- **Dependency confusion**: Unknown dependencies between contexts
- **Scaling issues**: Can't scale teams without clear boundaries

## Scope and Boundaries

- Context Map ≠ Bounded Context (context map describes relationships, bounded context is a single model)
- Context Map = Integration (context map defines integration patterns)
- Context Map is a **documentation artifact**, not a pattern

## When to Apply

- When building systems with multiple bounded contexts
- when integration between contexts is complex
- when scaling development teams
- when onboarding new team members

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Effort** — Maintaining context map requires effort |
| **Time** — Creating context map takes time |
| **Over-documentation** — Don't create context maps for simple systems |

## Common Misuses

- **One context map for everything**: Context maps should be living documents, updated as the system evolves
- **Ignoring integration patterns**: Each relationship needs an explicit integration pattern
- **Confusing with architecture diagram**: Context map focuses on relationships, not technical architecture

## Related Concepts

- [Bounded Context](DDD/bounded-context.md) — Context map describes relationships between bounded contexts
- [Anti-Corruption Layer](DDD/anti-corruption-layer.md) — Anti-corruption layer is an integration pattern
- [Shared Kernel](DDD/context-map.md) — Shared kernel is an integration pattern

## Project Observations

- The project uses context maps:
  - The project's architecture patterns note covers DDD concepts
  - TypeScript modules can serve as bounded context boundaries
  - No evidence of context maps in existing code (src/ is empty)
- File naming conventions support context maps:
  - `*.integration.ts` — Integration files
  - `*.bounded-context.ts` — Bounded context files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

