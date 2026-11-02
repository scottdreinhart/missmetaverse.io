---
slug: evolutionary-architecture
sources:
  - https://samnewman.io/books/
  - https://martinfowler.com/bliki/EvolutionaryArchitecture.html
date: 2026-11-02
tags:
  - evolutionary-architecture
  - architecture
  - design
  - agility
---

# Evolutionary Architecture

## Definition

Evolutionary Architecture is **an architecture approach that supports continuous change and adaptation throughout the system's lifecycle**.

> "Evolutionary architecture is an architecture that supports change without significant rework." — Martin Fowler

## Problem Addressed

Without evolutionary architecture:
- **Rigidity**: Architecture can't adapt to changing requirements
- **Rework**: Significant rework is needed for changes
- **Technical debt**: Technical debt accumulates
- **Stalled progress**: Progress stalls while reworking architecture

## Scope and Boundaries

- Evolutionary Architecture ≠ Big Design Up Front (evolutionary architecture evolves over time, big design up front plans everything upfront)
- Evolutionary Architecture = Adaptability (evolutionary architecture supports change)
- Evolutionary Architecture is an **architecture approach**, not a pattern

## When to Apply

- When building systems with uncertain requirements
- when continuous change is expected
- when agility is important
- when big design up front is not feasible

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Evolutionary architecture requires discipline |
| **Time** — Continuous evolution takes time |
| **Risk**: Without discipline, architecture can degrade |

## Common Misuses

- **No architecture**: Evolutionary architecture is not no architecture
- **Ignoring discipline**: Evolutionary architecture requires discipline
- **Confusing with agile**: Evolutionary architecture supports agility but is not the same

## Related Concepts

- [Architecture Decision Records](Architecture/architecture-decision-records.md) — Architecture decision records document evolutionary decisions
- [Incremental Refactoring](Quality Delivery/incremental-refactoring.md) — Incremental refactoring supports evolutionary architecture
- [Modular Monolith](Architecture/modular-monolith.md) — Modular monolith supports evolutionary architecture

## Project Observations

- The project uses evolutionary architecture:
  - TypeScript supports evolutionary architecture through type system
  - Vite supports evolutionary architecture through fast builds
  - The project's architecture patterns note covers architecture concepts
  - No evidence of evolutionary architecture in existing code (src/ is empty)
- File naming conventions support evolutionary architecture:
  - `*.config.ts` — Config files
  - `*.types.ts` — Type files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

