---
slug: accessibility-a11y
sources:
  - https://www.w3.org/TR/WCAG21/
  - https://www.w3.org/WAI/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/accessibility
  - status/complete
  - type/reference
  - domain/architecture
  - accessibility
  - a11y
  - wcag
  - w3c
---

## Sources

- [[Sources/wcag-21|wcag-21]]

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

---

## Copilot Instructions

### When to Read This Note
- Building public-facing applications
- Implementing WCAG 2.1 compliance
- Code review: checking for accessibility violations
- Adding new UI components

### What to Do With This Information
1. **Design for all users**: Consider keyboard navigation, screen readers, color contrast
2. **Follow WCAG 2.1**: Meet at least AA level for all success criteria
3. **Test with assistive tech**: Use screen readers, keyboard-only navigation
4. **Add ARIA labels**: Where semantic HTML is insufficient
5. **Ensure color contrast**: Minimum 4.5:1 for text, 3:1 for large text

### Tools to Use
- **VS Code Extension**: ESLint with `eslint-plugin-jsx-a11y` — for accessibility linting
- **Browser Extension**: axe DevTools — for automated accessibility testing
- **Browser Extension**: WAVE — for visual accessibility feedback
- **Terminal Command**: `npx axe <url>` — run axe accessibility tests
- **Terminal Command**: `npx lighthouse --categories accessibility` — run Lighthouse a11y audit

### Agents to Invoke
- **Security Review Agent**: Run when adding new UI components (accessibility is a security concern)
- **Code Review Agent**: Run when reviewing PRs that touch UI components

### Integration with Other Notes
- Read [accessibility-a11y-patterns](D/accessibility-a11y-patterns.md) for specific accessibility patterns
- Read [[accessibility-by-design]] for accessibility-first approach
- Read [wcag-21](D/wcag-21.md) for all WCAG 2.1 success criteria
- Read [shadcn-ui-patterns](D/shadcn-ui-patterns.md) for accessible UI components

### Common Pitfalls
- Don't skip accessibility because "we'll add it later" (it's harder to retrofit)
- Don't rely only on automated tools (manual testing is essential)
- Don't use `tabindex="-1"` without understanding keyboard navigation
- Don't use color alone to convey information (use text/icons too)
- Don't forget keyboard navigation (test with Tab/Shift+Tab/Escape)

### Quick Validation Checklist
- [ ] Can the app be used with keyboard only?
- [ ] Do all images have alt text?
- [ ] Is color contrast at least 4.5:1 for text?
- [ ] Are form inputs properly labeled?
- [ ] Are ARIA labels used where semantic HTML is insufficient?
- [ ] Can screen readers navigate the app logically?





