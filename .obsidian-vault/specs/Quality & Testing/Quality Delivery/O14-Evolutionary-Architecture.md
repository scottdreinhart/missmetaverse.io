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
  - --
# Evolutionary Architecture

## Definition

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Evolutionary Architecture is **an architecture approach that supports continuous change and adaptation throughout the system's lifecycle**.

> "Evolutionary architecture is an architecture that supports change without significant rework." â€” Martin Fowler

## Problem Addressed

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Without evolutionary architecture:
- **Rigidity**: Architecture can't adapt to changing requirements
- **Rework**: Significant rework is needed for changes
- **Technical debt**: Technical debt accumulates
- **Stalled progress**: Progress stalls while reworking architecture

## Scope and Boundaries

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- Evolutionary Architecture â‰  Big Design Up Front (evolutionary architecture evolves over time, big design up front plans everything upfront)
- Evolutionary Architecture = Adaptability (evolutionary architecture supports change)
- Evolutionary Architecture is an **architecture approach**, not a pattern

## When to Apply

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- When building systems with uncertain requirements
- when continuous change is expected
- when agility is important
- when big design up front is not feasible

## Tradeoffs and When to Avoid

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

| Cost | Description |
|------|-------------|
| **Complexity** â€” Evolutionary architecture requires discipline |
| **Time** â€” Continuous evolution takes time |
| **Risk**: Without discipline, architecture can degrade |

## Common Misuses

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- **No architecture**: Evolutionary architecture is not no architecture
- **Ignoring discipline**: Evolutionary architecture requires discipline
- **Confusing with agile**: Evolutionary architecture supports agility but is not the same

## Related Concepts

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [Architecture Decision Records](Architecture/architecture-decision-records.md) â€” Architecture decision records document evolutionary decisions
- [Incremental Refactoring](Quality Delivery/incremental-refactoring.md) â€” Incremental refactoring supports evolutionary architecture
- [Modular Monolith](Architecture/Application Architecture/modular-monolith-architecture.md) â€” Modular monolith supports evolutionary architecture

## Project Observations

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- The project uses evolutionary architecture:
  - TypeScript supports evolutionary architecture through type system
  - Vite supports evolutionary architecture through fast builds
  - The project's architecture patterns note covers architecture concepts
  - No evidence of evolutionary architecture in existing code (src/ is empty)
- File naming conventions support evolutionary architecture:
  - `*.config.ts` â€” Config files
  - `*.types.ts` â€” Type files

## Sources

## concept_id
o14-evolutionary-architecture

## title
O14-Evolutionary-Architecture

## aliases
- O14-Evolutionary-Architecture

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]





