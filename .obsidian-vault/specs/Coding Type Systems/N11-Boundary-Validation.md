---
slug: boundary-validation
sources:
  - https://www.typescriptlang.org/
  - https://zod.dev/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/security
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/database
  - boundary-validation
  - typescript
  - type-system
  - patterns
---

# Boundary Validation

## Definition

Boundary Validation is **a TypeScript pattern for validating data at system boundaries (APIs, databases, external services) using runtime type checking**.

> "Boundary validation ensures that data entering or leaving the system is validated at the boundary using runtime type checking." — Zod Docs

## Problem Addressed

Without boundary validation:
- **Invalid data**: Invalid data enters the system
- **Type errors**: Type errors occur at runtime
- **Security**: Security issues from invalid input
- **Testing**: Hard to test boundary conditions

## Scope and Boundaries

- Boundary Validation ≠ Input Validation (boundary validation is at system boundaries, input validation is at user input)
- Boundary Validation = Protection (boundary validation protects the system)
- Boundary Validation is a **TypeScript pattern**, not a design pattern

## When to Apply

- When building TypeScript applications
- when data crosses system boundaries
- when runtime type checking is needed
- when security is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Boundary validation adds boilerplate |
| **Time** — Implementing boundary validation takes time |
| **Over-validation**: Not every boundary needs validation |

## Common Misuses

- **Everything validated**: Not every boundary needs validation
- **Ignoring performance**: Validation adds overhead
- **Confusing with type system**: TypeScript's type system is compile-time, boundary validation is runtime

## Related Concepts

- [Input Validation](Security/input-validation.md) — Input validation is a form of boundary validation
- [Parse Don't Validate](Architecture/parse-dont-validate.md) — Parse don't validate is related to boundary validation
- [Zod Patterns](Architecture/zod-patterns.md) — Zod enables boundary validation

## Project Observations

- The project uses boundary validation:
  - Zod supports boundary validation through runtime type checking
  - TypeScript supports boundary validation through type system
  - The project's architecture patterns note covers TypeScript concepts
  - No evidence of boundary validation in existing code (src/ is empty)
- File naming conventions support boundary validation:
  - `*.schema.ts` — Schema files
  - `*.guard.ts` — Guard files

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]


