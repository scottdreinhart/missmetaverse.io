---
slug: accessiblity-a11y-patterns.md
sources:
  - https://www.w3.org/WAI/
  - https://react.dev/
date: 2026-11-02
tags:
  - accessibility
  - a11y
  - frontend-patterns
  - react
---

# Accessibility (a11y) Patterns

## Definition

Accessibility Patterns are **design patterns for building inclusive user interfaces that work for all users, including those with disabilities**.

> "Web accessibility means that websites, tools, and technologies are designed and developed so that people with disabilities can use them." — W3C WAI

## Problem Addressed

Without accessibility patterns:
- **Exclusion**: Users with disabilities can't use the application
- **Legal**: May violate accessibility regulations (WCAG, ADA, EAA)
- **SEO**: Poor accessibility often correlates with poor SEO
- **UX**: Accessibility improvements benefit all users

## Scope and Boundaries

- Accessibility Patterns ≠ Accessibility (accessibility patterns are patterns, accessibility is a feature)
- Accessibility Patterns = Performance (accessibility patterns are patterns, performance is a feature)
- Accessibility Patterns is a **feature**, not a pattern

## When to Apply

- When building user interfaces
- when accessibility compliance matters (WCAG 2.1 AA minimum)
- when inclusive design is important
- when legal compliance is required

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Accessibility adds complexity to markup and styling |
| **Time** — Accessibility testing requires specialized tools and users |
| **Over-accessibility** — Don't add unnecessary complexity for marginal gains |

## Common Misuses

- **Accessibility as an afterthought**: Must be designed in from the start
- **Automated testing only**: Automated tools catch ~30% of issues; manual testing is essential
- **Confusing accessibility with accessibility tools**: Tools help but don't replace design

## Related Concepts

- [Design Systems](Frontend%20UI/design-systems-patterns.md) — Design systems provide accessibility foundations
- [Headless UI](Frontend%20UI/headless-ui-pattern-patterns.md) — Headless UI libraries provide accessible foundations
- [HTML Semantic Patterns](CSS%20UI/html-semantic-patterns.md) — Semantic HTML is the foundation of accessibility

## Project Observations

- The project uses accessibility patterns:
  - Tailwind CSS supports accessibility utilities (focus rings, screen reader classes)
  - shadcn/ui components are built on Radix UI which provides accessibility
  - React's accessibility APIs (aria-*) are available
  - No evidence of accessibility patterns in existing code (src/ is empty)
- File naming conventions support accessibility:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

