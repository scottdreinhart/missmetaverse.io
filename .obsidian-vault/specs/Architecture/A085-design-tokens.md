---
slug: design-tokens
sources:
  - https://design-tokens.github.io/community-group/format/
  - https://m3.material.io/styles/color/the-color-system/color-tokens
date: 2026-11-02
tags:
  - design-tokens
  - design-systems
  - css
  - theming
  - --
# Design Tokens

## Definition

Design Tokens are **the atomic values of a design system â€” colors, spacing, typography, etc. â€” stored as machine-readable values that can be used across platforms**.

> "Design tokens are the visual design attributes teams use to construct their applications." â€” Design Tokens Community Group

## Problem Addressed

Without design tokens:
- **Inconsistent design**: Different values used in different places
- **Theme switching**: Hard to implement dark mode
- **Platform inconsistency**: Different values on web vs. mobile
- **Maintenance burden**: Changing a color requires finding all instances

## Scope and Boundaries

- Design Tokens â‰  Design System (tokens are values, system is the whole)
- Design Tokens â‰  CSS Variables (CSS variables are one implementation)
- Design Tokens are **platform-agnostic** values

## When to Apply

- When building a design system
- When implementing theming
- When maintaining consistency across platforms
- When onboarding new designers/developers

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Setup time** â€” Creating tokens takes time |
| **Tooling** â€” May need additional tools |
| **Complexity** â€” Token hierarchy can be complex |

## Common Misuses

- **Every value as token**: Not every value needs to be a token
- **Over-hierarchy**: Too many token levels
- **Confusing with CSS variables**: Tokens are values, CSS variables are implementation

## Related Concepts

- [Tailwind CSS](../TailwindsCSS/tailwind-css-patterns.md) â€” Tailwind config is a form of design tokens
- [CSS Fundamentals](../Cascading%20Stylesheets/css-fundamentals.md) â€” CSS custom properties
- [ShadCN UI](../ShadCN/shadcn-ui-patterns.md) â€” shadcn uses CSS variables as tokens

---

## Integration with Other Notes

- Read [tailwind-css-patterns](D/tailwind-css-patterns.md) for Tailwind CSS patterns
- Read [css-fundamentals](D/css-fundamentals.md) for CSS fundamentals
- Read [shadcn-ui-patterns](D/shadcn-ui-patterns.md) for shadcn/ui component patterns
- Read [ShadCN/shadcn-ui-component-library](D/ShadCN/shadcn-ui-component-library.md) for shadcn/ui best practices
- Read [atomic-design](https://bradfrost.com/blog/post/atomic-web-design/) for atomic design patterns

## Project Observations

- The project uses Tailwind CSS which supports design tokens via `tailwind.config.js`
- shadcn/ui uses CSS variables as design tokens
- No evidence of design token violations in existing configuration

## Sources

- [[Sources/tailwind-docs-2024|tailwind-docs-2024]]



