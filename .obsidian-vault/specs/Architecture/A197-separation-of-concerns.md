---
slug: separation-of-concerns
sources:
  - https://en.wikipedia.org/wiki/Separation_of_concerns
  - https://www.cs.utexas.edu/users/EWD/ewd02xx/EWD215.PDF
date: 2026-11-02
tags:
  - separation-of-concerns
  - principles
  - dijkstra
  - architecture
# Separation of Concerns

## Definition

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Separation of Concerns (SoC) is the principle of **dividing a computer program into distinct sections such that each section addresses a separate concern**. A concern is any feature or behavior that affects a program.

> "The basic idea is to separate a system into parts, where each part handles a distinct concern." â€” Edsger W. Dijkstra (1974)

## Problem Addressed

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without SoC:
- **Tangled code**: Multiple responsibilities mixed in one module
- **Cohesive changes**: Changing one feature requires modifying many places
- **Testing difficulty**: Hard to test isolated behavior
- **Team coordination**: Multiple developers interfere with each other's work

## Scope and Boundaries

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- SoC is a **fundamental design principle**, not a specific pattern
- It applies at all levels: modules, classes, functions, files
- SoC is **not** the same as Separation of Concerns in UI (which is a specific architectural pattern)

## When to Apply

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When designing module boundaries
- When organizing code into files and directories
- When choosing an architectural style
- When reviewing code for mixed responsibilities

## Tradeoffs and When to Avoid

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

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
| **Over-separation** | Too many layers add complexity and indirection |
| **Fragmentation** | Related code spread across too many files |
| **Boilerplate** | More interfaces and abstractions to maintain |

## Common Misuses

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Granularity obsession**: Separating at the function level when module-level is sufficient
- **Ignoring cross-cutting concerns**: Logging, error handling, validation span all layers
- **Confusing with file separation**: More files â‰  better separation

## Related Concepts

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Single Responsibility Principle** â€” SoC at the module level
- **High Cohesion** â€” Related concerns grouped together
- **Low Coupling** â€” Independent concerns separated
- **Clean Architecture** â€” SoC at the architectural level

## Project Observations

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- File naming conventions (`*.view.tsx`, `*.logic.ts`, `*.data.ts`) enforce SoC at the file level
- The project's architecture (React + Vite + TypeScript) naturally separates concerns:
  - React handles UI
  - Vite handles build
  - TypeScript handles types
  - Tailwind handles styling
- No evidence of mixed concerns in existing configuration

## Sources

## concept_id
a197-separation-of-concerns

## title
Separation of Concerns

## aliases
- A197-separation-of-concerns

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




