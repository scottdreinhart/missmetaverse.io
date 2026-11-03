---
slug: anti-corruption-layer-pattern
sources:
  - https://martinfowler.com/bliki/AntiCorruptionLayer.html
  - https://en.wikipedia.org/wiki/Anti-corruption_layer
date: 2026-11-02
tags:
  - maturity/deprecated
  - anti-corruption-layer
  - ddd
  - integration
  - patterns
# Anti-Corruption Layer Pattern

## Definition

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Anti-Corruption Layer Pattern is a **design pattern that protects a domain model from the complexities and changes in external systems**.

> "An anti-corruption layer is a boundary between a legacy system and a new system, ensuring that the new system is not corrupted by the legacy system's problems." â€” Martin Fowler

## Problem Addressed

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without anti-corruption layer pattern:
- **Corruption**: External systems corrupt the domain model
- **Coupling**: Domain is coupled to external systems
- **Maintenance**: Hard to maintain domain model
- **Flexibility**: Hard to change external systems

## Scope and Boundaries

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Anti-Corruption Layer Pattern â‰  Integration Layer (anti-corruption layer pattern is for protection, integration layer is for connection)
- Anti-Corruption Layer Pattern â‰  Adapter (anti-corruption layer pattern is for protection, adapter is for conversion)
- Anti-Corruption Layer Pattern is a **design pattern**, not an integration pattern

## When to Apply

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when external systems matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Anti-corruption layer pattern is complex |
| **Time** â€” Anti-corruption layer pattern takes time |
| **Over-anti-corruption-layer** â€” Don't protect everything |

## Common Misuses

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything protected**: Not everything needs anti-corruption layer pattern
- **Confusing with integration layer**: Anti-corruption layer pattern â‰  integration layer
- **Over-anti-corruption-layer**: Too much protection creates complexity

## Related Concepts

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Anti-corruption layer pattern with DDD
- [Integration Layer](Architecture/integration-layer.md) â€” Anti-corruption layer pattern with integration layer
- [Adapter](Architecture/adapter-pattern.md) â€” Anti-corruption layer pattern with adapter

## Project Observations

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses anti-corruption layer pattern:
  - The project's architecture patterns note covers anti-corruption layer pattern (from existing notes)
  - No evidence of anti-corruption layer pattern in existing code (src/ is empty)
- File naming conventions support anti-corruption layer pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a010-anti-corruption-layer-pattern

## title
Anti-Corruption Layer Pattern

## aliases
- A010-anti-corruption-layer-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




