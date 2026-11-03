---
slug: view-file-convention
sources:
  - https://react.dev/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.view.tsx

## Definition

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.view.tsx` is **a file naming convention for React components that represent the UI view layer, separating presentation from business logic**.

> "The *.view.tsx convention identifies React components that represent the UI view layer." â€” React Docs

## Problem Addressed

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.view.tsx` convention:
- **Confusion**: Don't know which components are views
- **Mixing concerns**: Views mix presentation and business logic
- **Testing**: Hard to test views separately
- **Maintenance**: Hard to maintain views

## Scope and Boundaries

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.view.tsx` â‰  `*.logic.ts` (`*.view.tsx` is for UI, `*.logic.ts` is for business logic)
- `*.view.tsx` = Presentation (`*.view.tsx` is for presentation)
- `*.view.tsx` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building React applications
- when separating presentation from business logic is important
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

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
| **Over-convention**: Not every component needs a view file |

## Common Misuses

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a view**: Not every component is a view
- **Mixing concerns**: Views should not contain business logic
- **Confusing with container**: Views are for presentation, containers are for logic

## Related Concepts

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Presentational/Container Pattern](Architecture/presentational-container-pattern.md) â€” Presentational/container pattern supports `*.view.tsx`
- [Component Composition](Architecture/component-composition.md) â€” Component composition supports `*.view.tsx`
- [Custom Hooks](Architecture/custom-hooks-composables.md) â€” Custom hooks separate logic from views

## Project Observations

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.view.tsx`:
  - React supports `*.view.tsx` through component system
  - Vite supports `*.view.tsx` through build system
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.view.tsx` in existing code (src/ is empty)
- File naming conventions support `*.view.tsx`:
  - `*.view.tsx` â€” View files
  - `*.logic.ts` â€” Logic files

## Sources

## concept_id
e01-view-file-convention

## title
*.view.tsx

## aliases
- E01-View-File-Convention

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



