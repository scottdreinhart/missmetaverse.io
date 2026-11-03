---
slug: architecture-fitness
sources:
  - https://martinfowler.com/bliki/ArchitectureFitnessFunction.html
  - https://www.thoughtworks.com/radar
date: 2026-11-02
tags:
  - architecture-fitness
  - testing
  - architecture
  - quality
  - --
# Architecture Fitness Functions

## Definition

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Architecture Fitness Functions are **automated tests that verify whether the architecture meets specific quality attributes or constraints**.

> "An architecture fitness function is an automated test that checks whether the architecture meets a specific quality attribute." â€” Martin Fowler

## Problem Addressed

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Without architecture fitness functions:
- **Architecture drift**: Architecture drifts from the intended design
- **Quality degradation**: Quality attributes are not enforced
- **Technical debt**: Technical debt accumulates unnoticed
- **Violations**: Architecture violations go undetected

## Scope and Boundaries

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- Architecture Fitness Functions â‰  Unit Tests (architecture fitness functions test architecture, unit tests test code behavior)
- Architecture Fitness Functions = Enforcement (architecture fitness functions enforce architecture)
- Architecture Fitness Functions is a **testing approach**, not a pattern

## When to Apply

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- When building systems with architectural constraints
- when quality attributes must be enforced
- when architecture drift is a concern
- when technical debt needs to be controlled

## Tradeoffs and When to Avoid

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

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
| **Complexity** â€” Architecture fitness functions add tooling complexity |
| **Time** â€” Writing fitness functions takes time |
| **Rigidity** â€” Too many fitness functions make architecture rigid |

## Common Misuses

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- **Everything a fitness function**: Not every architectural constraint needs a fitness function
- **Over-constraining**: Too many fitness functions make architecture rigid
- **Confusing with unit tests**: Architecture fitness functions test architecture, unit tests test code behavior

## Related Concepts

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [Automated Testing](Quality Delivery/automated-testing.md) â€” Automated testing supports architecture fitness functions
- [Architecture Decision Records](Architecture/architecture-decision-records.md) â€” Architecture decision records document architectural decisions
- [Refactoring](Quality Delivery/refactoring.md) â€” Refactoring can address fitness function failures

## Project Observations

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- The project uses architecture fitness functions:
  - ArchUnit supports architecture fitness functions
  - TypeScript's type system can enforce some architectural constraints
  - The project's architecture patterns note covers architecture concepts
  - No evidence of architecture fitness functions in existing code (src/ is empty)
- File naming conventions support architecture fitness functions:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
o07-architecture-fitness-functions

## title
O07-Architecture-Fitness-Functions

## aliases
- O07-Architecture-Fitness-Functions

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





