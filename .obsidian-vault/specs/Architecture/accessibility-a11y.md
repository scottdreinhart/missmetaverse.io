---
slug: accessibility-a11y
sources:
  - https://www.w3.org/TR/WCAG21/
  - https://www.w3.org/WAI/
date: 2026-11-02
tags:
  - accessibility
  - a11y
  - wcag
  - w3c
---

# Accessibility (a11y)

## Definition

Accessibility (a11y) is a **practice of designing and building software that can be used by everyone, including people with disabilities**.

> "Web accessibility means that websites, tools, and technologies are designed and developed so that people with disabilities can use them." — W3C

## Problem Addressed

Without accessibility:
- **Exclusion**: People with disabilities can't use the software
- **Legal**: Accessibility is required by law in many places
- **Business**: Accessibility expands the user base
- **Ethics**: Accessibility is the right thing to do

## Scope and Boundaries

- Accessibility ≠ Usability (accessibility is for people with disabilities, usability is for everyone)
- Accessibility ≠ WCAG (accessibility is a practice, WCAG is a standard)
- Accessibility is a **practice**, not a specific technique

## When to Apply

- When building public-facing software
- When legal compliance matters
- When ethics are important
- When building for everyone

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Accessibility takes time |
| **Complexity** — Accessibility is complex |
| **Testing** — Accessibility testing is complex |

## Common Misuses

- **Everything accessible**: Not everything needs accessibility
- **Confusing with usability**: Accessibility ≠ usability
- **Over-accessibility**: Too much accessibility creates complexity

## Related Concepts

- [Design Tokens](Architecture/design-tokens.md) — Accessibility with design tokens
- [React Patterns](../React/react-patterns) — Accessibility with React
- [Tailwind CSS](../Tailwind%20CSS/tailwind-css-patterns.md) — Accessibility with Tailwind

## Project Observations

- The project uses accessibility:
  - The project's quality and delivery note covers accessibility (from existing notes)
  - No evidence of accessibility in existing code (src/ is empty)
- File naming conventions support accessibility:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]


