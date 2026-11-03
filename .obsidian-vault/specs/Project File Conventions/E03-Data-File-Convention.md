---
slug: e03-data-file-convention
sources:
  - https://react.dev/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.data.ts

## Definition

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.data.ts` is **a file naming convention for TypeScript files that contain data definitions, constants, and configuration data**.

> "The *.data.ts convention identifies TypeScript files that contain data definitions and constants." â€” React Docs

## Problem Addressed

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.data.ts` convention:
- **Confusion**: Don't know which files contain data definitions
- **Mixing concerns**: Data is mixed with business logic
- **Testing**: Hard to test data definitions separately
- **Maintenance**: Hard to maintain data definitions

## Scope and Boundaries

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.data.ts` â‰  `*.logic.ts` (`*.data.ts` is for data, `*.logic.ts` is for business logic)
- `*.data.ts` = Data (`*.data.ts` is for data definitions)
- `*.data.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building React applications
- when separating data from business logic is important
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

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
| **Over-convention**: Not every data file needs a separate file |

## Common Misuses

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a data file**: Not every data definition needs a separate file
- **Mixing concerns**: Data files should not contain business logic
- **Confusing with types**: Data files contain data, type files contain types

## Related Concepts

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Types File Convention](Project File Conventions/types-file-convention.md) â€” Types file convention is related
- [Logic File Convention](Project File Conventions/logic-file-convention.md) â€” Logic file convention separates business logic
- [Schema File Convention](Project File Conventions/schema-file-convention.md) â€” Schema file convention defines data schemas

## Project Observations

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.data.ts`:
  - TypeScript supports `*.data.ts` through module system
  - React supports `*.data.ts` through data definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.data.ts` in existing code (src/ is empty)
- File naming conventions support `*.data.ts`:
  - `*.data.ts` â€” Data files
  - `*.types.ts` â€” Type files

## Sources

## concept_id
e03-data-file-convention

## title
*.data.ts

## aliases
- E03-Data-File-Convention

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



