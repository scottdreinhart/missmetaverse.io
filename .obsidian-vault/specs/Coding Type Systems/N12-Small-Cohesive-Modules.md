---
slug: small-cohesive-modules
sources:
  - https://www.typescriptlang.org/
  - https://eslint.org/
date: 2026-11-02
tags:
  - small-cohesive-modules
  - typescript
  - type-system
  - patterns
# Small Cohesive Modules

## Definition

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
Small Cohesive Modules is **a TypeScript pattern for organizing code into small, focused modules with high cohesion and low coupling**.

> "Small cohesive modules are modules that are small, focused, and have high cohesion with low coupling to other modules." â€” TypeScript Docs

## Problem Addressed

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
Without small cohesive modules:
- **Large modules**: Modules are too large and do too much
- **Low cohesion**: Modules have low cohesion
- **High coupling**: Modules are tightly coupled
- **Testing**: Hard to test large modules

## Scope and Boundaries

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- Small Cohesive Modules â‰  Separation of Concerns (small cohesive modules is a TypeScript pattern, separation of concerns is a principle)
- Small Cohesive Modules = Organization (small cohesive modules organize code)
- Small Cohesive Modules is a **TypeScript pattern**, not a design pattern

## When to Apply

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- When building TypeScript applications
- when code organization is important
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
| Cost | Description |
|------|-------------|
| **Complexity** â€” Small modules add file count |
| **Time** â€” Organizing code into small modules takes time |
| **Over-modularization**: Not every piece of code needs its own module |

## Common Misuses

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- **Everything a module**: Not every piece of code needs its own module
- **Ignoring cohesion**: Modules should have high cohesion
- **Confusing with separation of concerns**: Small cohesive modules is a TypeScript pattern, separation of concerns is a principle

## Related Concepts

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- [Separation of Concerns](Architecture/separation-of-concerns.md) â€” Separation of concerns supports small cohesive modules
- [High Cohesion](Architecture/high-cohesion.md) â€” High cohesion is a principle behind small cohesive modules
- [Low Coupling](Architecture/low-coupling.md) â€” Low coupling is a principle behind small cohesive modules

## Project Observations

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- The project uses small cohesive modules:
  - TypeScript supports small cohesive modules through module system
  - ESLint supports small cohesive modules through linting rules
  - The project's architecture patterns note covers TypeScript concepts
  - No evidence of small cohesive modules in existing code (src/ is empty)
- File naming conventions support small cohesive modules:
  - `*.module.ts` â€” Module files
  - `*.component.ts` â€” Component files

## Sources

## concept_id
n12-small-cohesive-modules

## title
Small Cohesive Modules

## aliases
- N12-Small-Cohesive-Modules

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]


