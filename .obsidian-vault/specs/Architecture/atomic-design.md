# Atomic Design

> **Purpose:** UI composition methodology for building consistent interfaces.
> **Last Updated:** 2026-11-03

---

## concept_id
`arch-atomic-design`

## title
Atomic Design

## aliases
- Atomic Design
- Brad Frost Atomic Design
- UI Atoms

## category
frontend-ui-composition

## concept_type
design-methodology

## research_status
verified

## project_adoption
declared

## applicability
- React component libraries
- Design systems
- UI component development
- Consistent interface design

## tags
- type/methodology
- domain/frontend
- domain/ui
- status/verified
- priority/medium

## source_ids
- frost-atomic-design-2016
- martin-fowler-patterns

## related_concept_ids
- arch-atoms
- arch-molecules
- arch-organisms
- arch-templates
- arch-pages
- arch-design-systems
- arch-design-tokens
- arch-component-composition

---

## Definition

Atomic Design is a methodology for creating design systems, developed by Brad Frost. It breaks UI components down into five distinct levels:

1. **Atoms**: Basic building blocks (buttons, inputs, labels)
2. **Molecules**: Groups of atoms functioning together (search form = input + button)
3. **Organisms**: Complex UI components (header, footer, card)
4. **Templates**: Page-level layouts without content
5. **Pages**: Specific instances of templates with real content

## Problem Addressed

Without atomic design:
- UI components are inconsistent
- Reusability is limited
- Design systems are hard to maintain
- Developers and designers speak different languages

## Scope and Boundaries

Atomic design applies to:
- UI component composition
- Design system development
- Component library architecture
- Consistent interface design

Atomic design does not directly address:
- State management
- Business logic
- Data fetching
- Routing

## When to Apply

- Building a design system
- Creating a component library
- Establishing UI consistency
- Onboarding new developers

## Tradeoffs and When to Avoid

- **Over-engineering risk**: Simple applications don't need atomic design
- **Granularity overhead**: Creating too many small components can increase complexity
- **Not for simple pages**: Single-use pages don't benefit
- **Learning curve**: Requires understanding of the methodology

## Implementation Guidance

1. **Start with atoms**: Create basic UI elements
2. **Build molecules**: Combine atoms into functional units
3. **Create organisms**: Build complex components from molecules
4. **Design templates**: Define page layouts
5. **Populate pages**: Add real content to templates

## Verification

- [ ] Atoms are basic, reusable UI elements
- [ ] Molecules combine atoms meaningfully
- [ ] Organisms are complex UI components
- [ ] Templates define page layouts
- [ ] Pages use templates with real content

## Common Misuses

- **Over-splitting**: Creating too many small components
- **Ignoring context**: Forcing atomic design where it doesn't fit
- **Confusing with ACID**: Atomic Design is UI composition, not database atomicity
- **Ignoring design tokens**: Not using tokens for consistency

## Related Concepts

- [[Architecture/atoms]] — Atoms
- [[Architecture/molecules]] — Molecules
- [[Architecture/organisms]] — Organisms
- [[Architecture/templates]] — Templates
- [[Architecture/pages]] — Pages
- [[Architecture/design-systems]] — Design Systems

## Project Observations

The project uses React and ShadCN UI, which supports atomic design through:
- Component composition
- Props for customization
- Storybook for documentation
- Tailwind CSS for styling consistency

## Sources

- [[Sources/frost-atomic-design-2016|Brad Frost — Atomic Design]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Atomic Design Note**
