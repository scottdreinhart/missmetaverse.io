---
slug: event-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.event.ts

## Definition

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.event.ts` is **a file naming convention for TypeScript files that contain domain event definitions**.

> "The *.event.ts convention identifies TypeScript files that contain domain event definitions." â€” TypeScript Docs

## Problem Addressed

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.event.ts` convention:
- **Confusion**: Don't know which files contain event definitions
- **Mixing concerns**: Events are mixed with business logic
- **Testing**: Hard to test events separately
- **Maintenance**: Hard to maintain events

## Scope and Boundaries

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.event.ts` â‰  `*.logic.ts` (`*.event.ts` is for events, `*.logic.ts` is for business logic)
- `*.event.ts` = Events (`*.event.ts` is for event definitions)
- `*.event.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building event-driven applications
- when domain events are used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

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
| **Over-convention**: Not every event needs a separate file |

## Common Misuses

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything an event**: Not every notification needs an event file
- **Mixing concerns**: Event files should not contain business logic
- **Confusing with logic**: Event files contain events, logic files contain business logic

## Related Concepts

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Domain Event](DDD/domain-event.md) â€” Domain event pattern is the pattern behind `*.event.ts`
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) â€” Event-driven architecture uses `*.event.ts`
- [Logic File Convention](Project File Conventions/logic-file-convention.md) â€” Logic file convention separates business logic

## Project Observations

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.event.ts`:
  - TypeScript supports `*.event.ts` through module system
  - React supports `*.event.ts` through event definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.event.ts` in existing code (src/ is empty)
- File naming conventions support `*.event.ts`:
  - `*.event.ts` â€” Event files
  - `*.logic.ts` â€” Logic files

## Sources

## concept_id
e15-event-file-convention

## title
*.event.ts

## aliases
- E15-Event-File-Convention

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



