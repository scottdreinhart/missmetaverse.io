---
slug: e06-types-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.types.ts

## Definition

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.types.ts` is **a file naming convention for TypeScript files that contain type definitions, interfaces, and type aliases**.

> "The *.types.ts convention identifies TypeScript files that contain type definitions and interfaces." â€” TypeScript Docs

## Problem Addressed

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.types.ts` convention:
- **Confusion**: Don't know which files contain type definitions
- **Mixing concerns**: Types are mixed with implementation
- **Testing**: Hard to test type definitions
- **Maintenance**: Hard to maintain types

## Scope and Boundaries

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.types.ts` â‰  `*.data.ts` (`*.types.ts` is for types, `*.data.ts` is for data definitions)
- `*.types.ts` = Types (`*.types.ts` is for type definitions)
- `*.types.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building TypeScript applications
- when type definitions are shared across modules
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
| Cost | Description |
|------|-------------|
| **Complexity** â€” File conventions add naming complexity |
| **Time** â€” Following conventions takes time |
| **Over-convention**: Not every type needs a separate file |

## Common Misuses

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a type file**: Not every type needs a separate file
- **Mixing concerns**: Type files should not contain implementation
- **Confusing with schemas**: Type files contain TypeScript types, schema files contain validation schemas

## Related Concepts

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Strict Typing](TypeScript/typescript-strict-mode.md) â€” Strict typing uses `*.types.ts`
- [Discriminated Unions](Architecture/discriminated-unions.md) â€” Discriminated unions use `*.types.ts`
- [Generics Patterns](Architecture/generics-patterns.md) â€” Generics use `*.types.ts`

## Project Observations

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.types.ts`:
  - TypeScript supports `*.types.ts` through module system
  - React supports `*.types.ts` through type definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.types.ts` in existing code (src/ is empty)
- File naming conventions support `*.types.ts`:
  - `*.types.ts` â€” Type files
  - `*.schema.ts` â€” Schema files

## Sources

## concept_id
e06-types-file-convention

## title
*.types.ts

## aliases
- E06-Types-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]


