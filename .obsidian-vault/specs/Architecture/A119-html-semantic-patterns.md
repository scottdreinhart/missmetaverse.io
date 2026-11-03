---
slug: html-semantic-patterns-original
sources:
  - https://developer.mozilla.org/en-US/docs/Web/HTML
  - https://html.spec.whatwg.org/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/accessibility
  - status/complete
  - type/reference
  - domain/architecture
  - html
  - semantic
  - patterns
  - frontend
---

# HTML Semantic Patterns

## Definition

HTML Semantic Patterns are **design patterns for using HTML semantic elements**.

> "HTML semantic elements are elements that clearly describe their meaning to both the browser and the developer." — MDN

## Problem Addressed

Without HTML semantic patterns:
- **Accessibility**: UI is not accessible
- **SEO**: SEO is poor
- **Maintainability**: Code is hard to maintain
- **Readability**: Code is hard to read

## Scope and Boundaries

- HTML Semantic Patterns ≠ HTML (HTML semantic patterns are patterns, HTML is a language)
- HTML Semantic Patterns ≠ Accessibility (HTML semantic patterns are patterns, accessibility is a practice)
- HTML Semantic Patterns is a **patterns**, not a language

## When to Apply

- When building web applications
- when accessibility matters
- when SEO is important
- when maintainability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — HTML semantic patterns are complex |
| **Time** — HTML semantic patterns take time |
| **Over-HTML-semantic** — Don't use HTML semantic for everything |

## Common Misuses

- **Everything HTML semantic**: Not everything needs HTML semantic patterns
- **Confusing with HTML**: HTML semantic patterns ≠ HTML
- **Over-HTML-semantic**: Too much HTML semantic creates complexity

## Related Concepts

- [CSS Fundamentals](Architecture/css-fundamentals.md) — HTML semantic patterns with CSS
- [React Patterns](../React/react-patterns) — HTML semantic patterns with React
- [Accessibility](Architecture/accessibility-a11y.md) — HTML semantic patterns with accessibility

## Project Observations

- The project uses HTML semantic patterns:
  - The project's HTML note covers HTML semantic patterns (from existing notes)
  - No evidence of HTML semantic patterns in existing code (src/ is empty)
- File naming conventions support HTML semantic patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]





