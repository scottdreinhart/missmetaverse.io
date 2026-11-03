---
slug: e10-repository-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.repository.ts

## Definition

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.repository.ts` is **a file naming convention for TypeScript files that contain repository implementations for data access**.

> "The *.repository.ts convention identifies TypeScript files that contain repository implementations." â€” TypeScript Docs

## Problem Addressed

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.repository.ts` convention:
- **Confusion**: Don't know which files contain repository implementations
- **Mixing concerns**: Repositories are mixed with business logic
- **Testing**: Hard to test repositories separately
- **Maintenance**: Hard to maintain repositories

## Scope and Boundaries

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.repository.ts` â‰  `*.port.ts` (`*.repository.ts` is for implementations, `*.port.ts` is for interfaces)
- `*.repository.ts` = Repositories (`*.repository.ts` is for repository implementations)
- `*.repository.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building applications with data access
- when repository pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

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
| **Over-convention**: Not every repository needs a separate file |

## Common Misuses

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a repository**: Not every data access needs a repository file
- **Mixing concerns**: Repository files should not contain business logic
- **Confusing with port**: Repository files contain implementations, port files contain interfaces

## Related Concepts

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Repository Pattern](Architecture/repository-pattern.md) â€” Repository pattern is the pattern behind `*.repository.ts`
- [Port File Convention](Project File Conventions/port-file-convention.md) â€” Port file convention defines repository interfaces
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) â€” Data mapper pattern is related

## Project Observations

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.repository.ts`:
  - TypeScript supports `*.repository.ts` through module system
  - React supports `*.repository.ts` through data access
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.repository.ts` in existing code (src/ is empty)
- File naming conventions support `*.repository.ts`:
  - `*.repository.ts` â€” Repository files
  - `*.port.ts` â€” Port files

## Sources

## concept_id
e10-repository-file-convention

## title
*.repository.ts

## aliases
- E10-Repository-File-Convention

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



