---
slug: schema-file-convention
sources:
  - https://zod.dev/
  - https://www.typescriptlang.org/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.schema.ts

## Definition

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.schema.ts` is **a file naming convention for TypeScript files that contain data validation schemas (e.g., Zod schemas)**.

> "The *.schema.ts convention identifies TypeScript files that contain data validation schemas." â€” Zod Docs

## Problem Addressed

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.schema.ts` convention:
- **Confusion**: Don't know which files contain validation schemas
- **Mixing concerns**: Schemas are mixed with business logic
- **Testing**: Hard to test schemas separately
- **Maintenance**: Hard to maintain schemas

## Scope and Boundaries

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.schema.ts` â‰  `*.data.ts` (`*.schema.ts` is for validation schemas, `*.data.ts` is for data definitions)
- `*.schema.ts` = Schemas (`*.schema.ts` is for validation schemas)
- `*.schema.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building React applications with validation
- when Zod or similar validation libraries are used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

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
| **Over-convention**: Not every schema needs a separate file |

## Common Misuses

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a schema**: Not every validation needs a separate schema file
- **Mixing concerns**: Schema files should not contain business logic
- **Confusing with types**: Schema files contain validation schemas, type files contain TypeScript types

## Related Concepts

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Zod Patterns](Architecture/zod-patterns.md) â€” Zod patterns use `*.schema.ts`
- [Input Validation](Security/input-validation.md) â€” Input validation uses schemas
- [Boundary Validation](Coding Type Systems/boundary-validation.md) â€” Boundary validation uses schemas

## Project Observations

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.schema.ts`:
  - Zod supports `*.schema.ts` through schema definitions
  - TypeScript supports `*.schema.ts` through module system
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.schema.ts` in existing code (src/ is empty)
- File naming conventions support `*.schema.ts`:
  - `*.schema.ts` â€” Schema files
  - `*.data.ts` â€” Data files

## Sources

## concept_id
e05-schema-file-convention

## title
*.schema.ts

## aliases
- E05-Schema-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]



