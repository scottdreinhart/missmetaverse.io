---
slug: accessibility-by-design
sources:
  - https://www.w3.org/WAI/
  - https://developer.mozilla.org/en-US/docs/Web/Accessibility
date: 2026-11-02
tags:
  - accessibility
  - a11y
  - design
  - w3c
## Sources

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/wcag-21|wcag-21]]

# Accessibility by Design

## Definition

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Accessibility by Design is the principle that **accessible features should be built into the design from the start, not added as an afterthought**.

> "Accessibility is not a feature. It's a fundamental aspect of good design." â€” Web Accessibility Initiative

## Problem Addressed

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Accessibility as an afterthought leads to:
- **Expensive fixes**: Adding accessibility later is costly
- **Incomplete coverage**: Some features may be impossible to make accessible
- **Legal risk**: Many jurisdictions require accessibility compliance
- **Exclusion**: Users with disabilities can't use the product

## Scope and Boundaries

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Accessibility â‰  Screen readers (it includes keyboard, color, motion, etc.)
- Accessibility â‰  WCAG (WCAG is a standard, accessibility is a principle)
- Accessibility is a **design principle**, not a testing checklist

## When to Apply

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When designing UI components
- When creating content
- When choosing color schemes
- When building forms

## Tradeoffs and When to Avoid

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

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
| **Design constraints** â€” Accessibility limits design choices |
| **Testing** â€” Requires testing with assistive technologies |
| **Knowledge** â€” Accessibility is complex and evolving |

## Common Misuses

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Checkbox accessibility**: Adding `alt` text to decorative images
- **Color only**: Relying only on color to convey information
- **Testing only**: Assuming automated tests catch all issues

## Related Concepts

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [HTML Semantic Patterns](../Hypertext%20HTML/html-semantic-patterns.md) â€” Semantic HTML is accessible
- [React Patterns](../React/Architecture/react-patterns) â€” Accessible React components
- [ShadCN UI](../ShadCN/shadcn-ui-patterns.md) â€” Accessible components by default

## Project Observations

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses shadcn/ui which provides accessible components by default
- HTML semantic patterns note covers accessibility best practices
- No evidence of accessibility violations in existing configuration

## Sources

## concept_id
a004-accessibility-by-design

## title
Accessibility by Design

## aliases
- A004-accessibility-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/mdn-html-2024|mdn-html-2024]]




