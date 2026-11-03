---
slug: types-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:








  - file-conventions
  - react
  - typescript
  - project-structure
---

# *.types.ts

## Definition

`*.types.ts` is **a file naming convention for TypeScript files that contain type definitions, interfaces, and type aliases**.

> "The *.types.ts convention identifies TypeScript files that contain type definitions and interfaces." — TypeScript Docs

## Problem Addressed

Without `*.types.ts` convention:
- **Confusion**: Don't know which files contain type definitions
- **Mixing concerns**: Types are mixed with implementation
- **Testing**: Hard to test type definitions
- **Maintenance**: Hard to maintain types

## Scope and Boundaries

- `*.types.ts` ≠ `*.data.ts` (`*.types.ts` is for types, `*.data.ts` is for data definitions)
- `*.types.ts` = Types (`*.types.ts` is for type definitions)
- `*.types.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building TypeScript applications
- when type definitions are shared across modules
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every type needs a separate file |

## Common Misuses

- **Everything a type file**: Not every type needs a separate file
- **Mixing concerns**: Type files should not contain implementation
- **Confusing with schemas**: Type files contain TypeScript types, schema files contain validation schemas

## Related Concepts

- [Strict Typing](TypeScript/typescript-strict-mode.md) — Strict typing uses `*.types.ts`
- [Discriminated Unions](Architecture/discriminated-unions.md) — Discriminated unions use `*.types.ts`
- [Generics Patterns](Architecture/generics-patterns.md) — Generics use `*.types.ts`

## Project Observations

- The project uses `*.types.ts`:
  - TypeScript supports `*.types.ts` through module system
  - React supports `*.types.ts` through type definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.types.ts` in existing code (src/ is empty)
- File naming conventions support `*.types.ts`:
  - `*.types.ts` — Type files
  - `*.schema.ts` — Schema files

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]


