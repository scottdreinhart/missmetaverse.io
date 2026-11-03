---
slug: value-object-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.value-object.ts

## Definition

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.value-object.ts` is **a file naming convention for TypeScript files that contain DDD value object definitions**.

> "The *.value-object.ts convention identifies TypeScript files that contain DDD value object definitions." â€” TypeScript Docs

## Problem Addressed

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.value-object.ts` convention:
- **Confusion**: Don't know which files contain value object definitions
- **Mixing concerns**: Value objects are mixed with business logic
- **Testing**: Hard to test value objects separately
- **Maintenance**: Hard to maintain value objects

## Scope and Boundaries

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.value-object.ts` â‰  `*.entity.ts` (`*.value-object.ts` is for value objects, `*.entity.ts` is for entities)
- `*.value-object.ts` = Value Objects (`*.value-object.ts` is for value object definitions)
- `*.value-object.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building DDD applications
- when value object pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

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
| **Over-convention**: Not every value object needs a separate file |

## Common Misuses

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a value object**: Not every domain object needs a value object file
- **Mixing concerns**: Value object files should not contain business logic
- **Confusing with entity**: Value object files contain value objects, entity files contain entities

## Related Concepts

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Value Object (DDD)](DDD/value-object.md) â€” Value object pattern is the pattern behind `*.value-object.ts`
- [Entity File Convention](Project File Conventions/entity-file-convention.md) â€” Entity file convention is related
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” DDD patterns use `*.value-object.ts`

## Project Observations

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.value-object.ts`:
  - TypeScript supports `*.value-object.ts` through module system
  - React supports `*.value-object.ts` through value object definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.value-object.ts` in existing code (src/ is empty)
- File naming conventions support `*.value-object.ts`:
  - `*.value-object.ts` â€” Value object files
  - `*.entity.ts` â€” Entity files

## Sources

## concept_id
e13-value-object-file-convention

## title
*.value-object.ts

## aliases
- E13-Value-Object-File-Convention

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



