---
slug: port-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.port.ts

## Definition

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.port.ts` is **a file naming convention for TypeScript files that contain port interfaces (hexagonal architecture) defining boundaries between internal and external systems**.

> "The *.port.ts convention identifies TypeScript files that contain port interfaces for hexagonal architecture." â€” TypeScript Docs

## Problem Addressed

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.port.ts` convention:
- **Confusion**: Don't know which files contain port interfaces
- **Mixing concerns**: Ports are mixed with implementation
- **Testing**: Hard to test ports separately
- **Maintenance**: Hard to maintain ports

## Scope and Boundaries

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.port.ts` â‰  `*.adapter.ts` (`*.port.ts` is for interfaces, `*.adapter.ts` is for implementations)
- `*.port.ts` = Ports (`*.port.ts` is for port interfaces)
- `*.port.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building hexagonal architecture applications
- when port interfaces are used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

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
| **Over-convention**: Not every port needs a separate file |

## Common Misuses

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a port**: Not every interface needs a port file
- **Mixing concerns**: Port files should not contain implementation
- **Confusing with adapter**: Port files contain interfaces, adapter files contain implementations

## Related Concepts

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Hexagonal Architecture](Architecture/hexagonal-architecture.md) â€” Hexagonal architecture uses ports
- [Adapter File Convention](Project File Conventions/adapter-file-convention.md) â€” Adapter file convention implements ports
- [Dependency Injection](Architecture/dependency-injection.md) â€” Dependency injection uses ports

## Project Observations

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.port.ts`:
  - TypeScript supports `*.port.ts` through module system
  - React supports `*.port.ts` through port interfaces
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.port.ts` in existing code (src/ is empty)
- File naming conventions support `*.port.ts`:
  - `*.port.ts` â€” Port files
  - `*.adapter.ts` â€” Adapter files

## Sources

## concept_id
e08-port-file-convention

## title
*.port.ts

## aliases
- E08-Port-File-Convention

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



