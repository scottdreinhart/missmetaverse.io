---
slug: e04-hook-file-convention
sources:
  - https://react.dev/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.hook.ts

## Definition

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.hook.ts` is **a file naming convention for React custom hook files that encapsulate reusable stateful logic**.

> "The *.hook.ts convention identifies React custom hook files that encapsulate reusable stateful logic." â€” React Docs

## Problem Addressed

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.hook.ts` convention:
- **Confusion**: Don't know which files contain custom hooks
- **Mixing concerns**: Hooks are mixed with components
- **Testing**: Hard to test hooks separately
- **Maintenance**: Hard to maintain hooks

## Scope and Boundaries

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.hook.ts` â‰  `*.view.tsx` (`*.hook.ts` is for hooks, `*.view.tsx` is for UI)
- `*.hook.ts` = Hooks (`*.hook.ts` is for custom hooks)
- `*.hook.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building React applications
- when custom hooks are used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

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
| **Over-convention**: Not every hook needs a separate file |

## Common Misuses

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a hook**: Not every piece of logic needs a hook
- **Mixing concerns**: Hooks should not contain UI code
- **Confusing with logic**: Hooks encapsulate stateful logic, logic files contain business logic

## Related Concepts

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Custom Hooks](Architecture/custom-hooks-composables.md) â€” Custom hooks are the pattern behind `*.hook.ts`
- [Logic File Convention](Project File Conventions/logic-file-convention.md) â€” Logic file convention separates business logic
- [View File Convention](Project File Conventions/view-file-convention.md) â€” View file convention separates UI

## Project Observations

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.hook.ts`:
  - React supports `*.hook.ts` through custom hook system
  - TypeScript supports `*.hook.ts` through module system
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.hook.ts` in existing code (src/ is empty)
- File naming conventions support `*.hook.ts`:
  - `*.hook.ts` â€” Hook files
  - `*.view.tsx` â€” View files

## Sources

## concept_id
e04-hook-file-convention

## title
*.hook.ts

## aliases
- E04-Hook-File-Convention

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



