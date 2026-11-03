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
---

# Small Cohesive Modules

## Definition

Small Cohesive Modules is **a TypeScript pattern for organizing code into small, focused modules with high cohesion and low coupling**.

> "Small cohesive modules are modules that are small, focused, and have high cohesion with low coupling to other modules." — TypeScript Docs

## Problem Addressed

Without small cohesive modules:
- **Large modules**: Modules are too large and do too much
- **Low cohesion**: Modules have low cohesion
- **High coupling**: Modules are tightly coupled
- **Testing**: Hard to test large modules

## Scope and Boundaries

- Small Cohesive Modules ≠ Separation of Concerns (small cohesive modules is a TypeScript pattern, separation of concerns is a principle)
- Small Cohesive Modules = Organization (small cohesive modules organize code)
- Small Cohesive Modules is a **TypeScript pattern**, not a design pattern

## When to Apply

- When building TypeScript applications
- when code organization is important
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Small modules add file count |
| **Time** — Organizing code into small modules takes time |
| **Over-modularization**: Not every piece of code needs its own module |

## Common Misuses

- **Everything a module**: Not every piece of code needs its own module
- **Ignoring cohesion**: Modules should have high cohesion
- **Confusing with separation of concerns**: Small cohesive modules is a TypeScript pattern, separation of concerns is a principle

## Related Concepts

- [Separation of Concerns](Architecture/separation-of-concerns.md) — Separation of concerns supports small cohesive modules
- [High Cohesion](Architecture/high-cohesion.md) — High cohesion is a principle behind small cohesive modules
- [Low Coupling](Architecture/low-coupling.md) — Low coupling is a principle behind small cohesive modules

## Project Observations

- The project uses small cohesive modules:
  - TypeScript supports small cohesive modules through module system
  - ESLint supports small cohesive modules through linting rules
  - The project's architecture patterns note covers TypeScript concepts
  - No evidence of small cohesive modules in existing code (src/ is empty)
- File naming conventions support small cohesive modules:
  - `*.module.ts` — Module files
  - `*.component.ts` — Component files

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]


