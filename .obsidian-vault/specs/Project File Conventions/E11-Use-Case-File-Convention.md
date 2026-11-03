---
slug: use-case-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.use-case.ts

## Definition

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.use-case.ts` is **a file naming convention for TypeScript files that contain use case implementations (application services)**.

> "The *.use-case.ts convention identifies TypeScript files that contain use case implementations." â€” TypeScript Docs

## Problem Addressed

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.use-case.ts` convention:
- **Confusion**: Don't know which files contain use case implementations
- **Mixing concerns**: Use cases are mixed with business logic
- **Testing**: Hard to test use cases separately
- **Maintenance**: Hard to maintain use cases

## Scope and Boundaries

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.use-case.ts` â‰  `*.logic.ts` (`*.use-case.ts` is for use cases, `*.logic.ts` is for general business logic)
- `*.use-case.ts` = Use Cases (`*.use-case.ts` is for use case implementations)
- `*.use-case.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building applications with use case driven design
- when use case pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

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
| **Over-convention**: Not every use case needs a separate file |

## Common Misuses

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a use case**: Not every operation needs a use case file
- **Mixing concerns**: Use case files should not contain domain logic
- **Confusing with logic**: Use case files contain use case implementations, logic files contain business logic

## Related Concepts

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Use Case Driven Design](Architecture/use-case-driven-design.md) â€” Use case driven design uses `*.use-case.ts`
- [Logic File Convention](Project File Conventions/logic-file-convention.md) â€” Logic file convention separates business logic
- [Application Service](DDD/application-service.md) â€” Application service is the pattern behind `*.use-case.ts`

## Project Observations

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.use-case.ts`:
  - TypeScript supports `*.use-case.ts` through module system
  - React supports `*.use-case.ts` through use case implementations
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.use-case.ts` in existing code (src/ is empty)
- File naming conventions support `*.use-case.ts`:
  - `*.use-case.ts` â€” Use case files
  - `*.logic.ts` â€” Logic files

## Sources

## concept_id
e11-use-case-file-convention

## title
*.use-case.ts

## aliases
- E11-Use-Case-File-Convention

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



