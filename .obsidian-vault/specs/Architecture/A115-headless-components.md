---
slug: headless-components
sources:
  - https://www.radix-ui.com/primitives/docs/overview/introduction
  - https://headlessui.dev/
date: 2026-11-02
tags:
  - headless
  - radix-ui
  - accessibility
  - components
# Headless Components

## Definition

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Headless Components are **UI components that provide behavior and accessibility without styling**. They give full control over appearance while handling complex interactions.

> "Headless UI components are unstyled, fully accessible interactive components." â€” Headless UI

## Problem Addressed

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Styled components lead to:
- **Limited customization**: Hard to match design systems
- **Accessibility gaps**: Custom styles may break accessibility
- **Bundle size**: Full component libraries add weight

## Scope and Boundaries

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Headless â‰  No UI (headless components have UI, just no styles)
- Headless â‰  Lightweight (behavior can be complex)
- Headless is a **component pattern**, not a framework

## When to Apply

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building custom design systems
- When existing component libraries don't match design
- When accessibility is critical
- When bundle size matters

## Tradeoffs and When to Avoid

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

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
| **Styling responsibility** â€” You must style everything |
| **Accessibility responsibility** â€” You must ensure accessibility |
| **Learning curve** â€” Headless patterns are complex |

## Common Misuses

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Headless everywhere**: Simple components don't need headless
- **Ignoring accessibility**: Headless doesn't mean no accessibility
- **Reinventing wheels**: Simple components may not need headless

## Related Concepts

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [ShadCN UI](../ShadCN/shadcn-ui-patterns.md) â€” Built on Radix UI (headless)
- [Radix UI](Sources/radix-ui-docs-2024.md) â€” Headless primitives
- [Accessibility by Design](Architecture/accessibility-by-design.md) â€” Headless ensures accessibility

## Project Observations

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses shadcn/ui which is built on Radix UI (headless)
- Headless components provide maximum customization
- Accessibility is handled by Radix UI primitives

## Sources

## concept_id
a115-headless-components

## title
Headless Components

## aliases
- A115-headless-components

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/radix-ui-docs-2024|radix-ui-docs-2024]]



