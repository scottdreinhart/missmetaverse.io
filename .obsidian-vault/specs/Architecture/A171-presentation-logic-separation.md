---
slug: presentation-logic-separation
sources:
  - https://react.dev/
  - https://martinfowler.com/bliki/PresentationModel.html
date: 2026-11-02
tags:
  - presentation-logic
  - frontend
  - react
  - separation-of-concerns
# Presentation-Logic Separation

## Definition

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Presentation-Logic Separation is **a frontend architecture principle that separates the presentation layer (UI) from the business logic layer**.

> "Presentation-logic separation ensures that the UI layer is independent of business logic, enabling testing and maintenance." â€” React Docs

## Problem Addressed

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without presentation-logic separation:
- **Tight coupling**: UI is coupled to business logic
- **Testing**: Hard to test business logic without UI
- **Reusability**: Logic can't be reused across UIs
- **Maintenance**: Changes to UI break business logic

## Scope and Boundaries

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Presentation-Logic Separation â‰  MVC (presentation-logic separation is a principle, MVC is a pattern)
- Presentation-Logic Separation = Separation (presentation-logic separation separates concerns)
- Presentation-Logic Separation is a **principle**, not a pattern

## When to Apply

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building React applications
- when testing is important
- when reusability is needed
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Separation adds abstraction |
| **Time** â€” Implementing separation takes time |
| **Over-separation**: Not every component needs separation |

## Common Misuses

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything separated**: Not every component needs full separation
- **Ignoring composition**: Composition can achieve separation without complex patterns
- **Confusing with MVP**: Presentation-logic separation is a principle, MVP is a pattern

## Related Concepts

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Presentational/Container Pattern](Architecture/presentational-container-pattern.md) â€” Presentational/container pattern implements presentation-logic separation
- [Custom Hooks](Architecture/custom-hooks-composables.md) â€” Custom hooks separate logic from presentation
- [Component Composition](Architecture/component-composition.md) â€” Component composition supports separation

## Project Observations

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses presentation-logic separation:
  - React supports presentation-logic separation through components and hooks
  - TypeScript supports presentation-logic separation through type system
  - The project's architecture patterns note covers frontend architecture
  - No evidence of presentation-logic separation in existing code (src/ is empty)
- File naming conventions support presentation-logic separation:
  - `*.view.tsx` â€” View files
  - `*.logic.ts` â€” Logic files

## Sources

## concept_id
a171-presentation-logic-separation

## title
Presentation-Logic Separation

## aliases
- A171-presentation-logic-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




