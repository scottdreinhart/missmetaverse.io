---
slug: accessibility-a11y-patterns
sources:
  - https://www.w3.org/TR/WCAG21/
  - https://www.w3.org/WAI/
date: 2026-11-02
tags:
  - accessibility
  - a11y
  - wcag
  - patterns
---

# Accessibility Patterns

## Definition

Accessibility Patterns are **design patterns for building accessible software**.

> "Web accessibility means that websites, tools, and technologies are designed and developed so that people with disabilities can use them." — W3C

## Problem Addressed

Without accessibility patterns:
- **Exclusion**: People with disabilities can't use the software
- **Legal**: Accessibility is required by law in many places
- **Business**: Accessibility expands the user base
- **Ethics**: Accessibility is the right thing to do

## Scope and Boundaries

- Accessibility Patterns ≠ Accessibility (accessibility patterns are patterns, accessibility is a practice)
- Accessibility Patterns ≠ WCAG (accessibility patterns are patterns, WCAG is a standard)
- Accessibility Patterns is a **patterns**, not a standard

## When to Apply

- When building public-facing software
- when legal compliance matters
- when ethics are important
- when building for everyone

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Accessibility patterns are complex |
| **Time** — Accessibility patterns take time |
| **Over-accessibility** — Don't over-accessibility |

## Common Misuses

- **Everything accessible**: Not everything needs accessibility patterns
- **Confusing with WCAG**: Accessibility patterns ≠ WCAG
- **Over-accessibility**: Too much accessibility creates complexity

## Related Concepts

- [Design Tokens](Architecture/design-tokens.md) — Accessibility patterns with design tokens
- [React Patterns](../React/react-patterns) — Accessibility patterns with React
- [Tailwind CSS Patterns](Architecture/tailwind-css-patterns.md) — Accessibility patterns with Tailwind

## Project Observations

- The project uses accessibility patterns:
  - The project's quality and delivery note covers accessibility patterns (from existing notes)
  - No evidence of accessibility patterns in existing code (src/ is empty)
- File naming conventions support accessibility patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]


