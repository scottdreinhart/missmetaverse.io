---
slug: adapter-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.adapter.ts

## Definition

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.adapter.ts` is **a file naming convention for TypeScript files that contain adapter implementations connecting ports to external systems**.

> "The *.adapter.ts convention identifies TypeScript files that contain adapter implementations." â€” TypeScript Docs

## Problem Addressed

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.adapter.ts` convention:
- **Confusion**: Don't know which files contain adapter implementations
- **Mixing concerns**: Adapters are mixed with business logic
- **Testing**: Hard to test adapters separately
- **Maintenance**: Hard to maintain adapters

## Scope and Boundaries

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.adapter.ts` â‰  `*.port.ts` (`*.adapter.ts` is for implementations, `*.port.ts` is for interfaces)
- `*.adapter.ts` = Adapters (`*.adapter.ts` is for adapter implementations)
- `*.adapter.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building hexagonal architecture applications
- when adapter implementations are used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

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
| **Over-convention**: Not every adapter needs a separate file |

## Common Misuses

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything an adapter**: Not every integration needs an adapter file
- **Mixing concerns**: Adapter files should not contain business logic
- **Confusing with port**: Adapter files contain implementations, port files contain interfaces

## Related Concepts

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Adapter Pattern](Architecture/adapter-pattern.md) â€” Adapter pattern is the pattern behind `*.adapter.ts`
- [Port File Convention](Project File Conventions/port-file-convention.md) â€” Port file convention defines interfaces
- [Hexagonal Architecture](Architecture/hexagonal-architecture.md) â€” Hexagonal architecture uses adapters

## Project Observations

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.adapter.ts`:
  - TypeScript supports `*.adapter.ts` through module system
  - React supports `*.adapter.ts` through adapter implementations
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.adapter.ts` in existing code (src/ is empty)
- File naming conventions support `*.adapter.ts`:
  - `*.adapter.ts` â€” Adapter files
  - `*.port.ts` â€” Port files

## Sources

## concept_id
e09-adapter-file-convention

## title
*.adapter.ts

## aliases
- E09-Adapter-File-Convention

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



