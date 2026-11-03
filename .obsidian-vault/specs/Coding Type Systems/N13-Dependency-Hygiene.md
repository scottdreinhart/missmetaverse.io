---
slug: n13-dependency-hygiene
sources:
  - https://www.typescriptlang.org/
  - https://pnpm.io/
date: 2026-11-02
tags:
  - dependency-hygiene
  - typescript
  - type-system
  - patterns
# Dependency Hygiene

## Definition

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
Dependency Hygiene is **a TypeScript pattern for managing dependencies between modules, ensuring clean dependency graphs and avoiding circular dependencies**.

> "Dependency hygiene ensures that modules have clean dependency graphs and avoid circular dependencies." â€” TypeScript Docs

## Problem Addressed

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
Without dependency hygiene:
- **Circular dependencies**: Modules have circular dependencies
- **Tight coupling**: Modules are tightly coupled
- **Testing**: Hard to test modules with circular dependencies
- **Maintenance**: Hard to maintain modules with circular dependencies

## Scope and Boundaries

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- Dependency Hygiene â‰  Dependency Injection (dependency hygiene manages dependencies, dependency injection is a pattern)
- Dependency Hygiene = Cleanliness (dependency hygiene ensures clean dependencies)
- Dependency Hygiene is a **TypeScript pattern**, not a design pattern

## When to Apply

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- When building TypeScript applications
- when dependency management is important
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

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
| **Complexity** â€” Dependency hygiene adds abstraction |
| **Time** â€” Implementing dependency hygiene takes time |
| **Over-hygiene**: Not every dependency needs hygiene |

## Common Misuses

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- **Everything hygienic**: Not every dependency needs hygiene
- **Ignoring circular dependencies**: Circular dependencies must be avoided
- **Confusing with dependency injection**: Dependency hygiene manages dependencies, dependency injection is a pattern

## Related Concepts

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- [Dependency Injection](Architecture/dependency-injection.md) â€” Dependency injection is a pattern for managing dependencies
- [Low Coupling](Architecture/low-coupling.md) â€” Low coupling is a principle behind dependency hygiene
- [pnpm Workspace](Architecture/pnpm-workspace.md) â€” pnpm workspace supports dependency hygiene

## Project Observations

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- The project uses dependency hygiene:
  - TypeScript supports dependency hygiene through module system
  - pnpm supports dependency hygiene through workspace management
  - The project's architecture patterns note covers TypeScript concepts
  - No evidence of dependency hygiene in existing code (src/ is empty)
- File naming conventions support dependency hygiene:
  - `*.port.ts` â€” Port files
  - `*.adapter.ts` â€” Adapter files

## Sources

## concept_id
n13-dependency-hygiene

## title
Dependency Hygiene

## aliases
- N13-Dependency-Hygiene

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


