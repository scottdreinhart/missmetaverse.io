---
slug: internationalization-by-design
tags:
  - coding   - type-system   - best-practices
---

# Internationalization by Design

> **Purpose:** Build internationalized applications from the start.
> **Last Updated:** 2026-11-03

## concept_id
`coding-internationalization-by-design`

## title
Internationalization by Design

## aliases
- i18n by Design
- Internationalization by Design
- Globalization by Design

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- UI development
- Component design
- Frontend architecture
- User experience

## tags
- type/practice
- domain/coding
- domain/i18n
- status/verified
- priority/high

## source_ids
- typescript-documentation
- mdn-web-documentation

## related_concept_ids
- coding-accessibility-by-design
- arch-design-systems
- arch-headless-components
- testing-observability

## Definition

Internationalization by Design is a practice where internationalization (i18n) is considered from the start of development, not as an afterthought. This includes string externalization, date/number formatting, RTL support, and locale-aware validation.

## Problem Addressed

Without internationalization by design:
- i18n is an afterthought
- Remediation is expensive
- User experience suffers in other languages
- Legal compliance is at risk in some regions

## Scope and Boundaries

Internationalization by design applies to:
- UI development
- Component design
- Frontend architecture
- User experience

Internationalization by design does not apply to:
- Backend logic
- Database design
- Infrastructure
- Build tools

## When to Apply

- Designing UI components
- Building interfaces
- Creating design systems
- Developing frontends

## Tradeoffs and When to Avoid

- **Initial cost**: i18n requires initial investment
- **Complexity**: Some i18n features are complex
- **Not for single-language**: Single-language apps may not need i18n
- **Not for backend**: Backend doesn't need i18n

## Implementation Guidance

1. **Externalize strings**: Move strings to translation files
2. **Use i18n libraries**: Use i18next, react-i18next, or similar
3. **Format dates/numbers**: Use locale-aware formatting
4. **Support RTL**: Support right-to-left languages
5. **Test with locales**: Test with different locales

## Verification

- [ ] Strings are externalized
- [ ] i18n library is used
- [ ] Dates/numbers are formatted
- [ ] RTL is supported
- [ ] Testing is done with locales

## Common Misuses

- **Afterthought**: Adding i18n after development
- **Hardcoding strings**: Hardcoding strings in code
- **Not formatting**: Not formatting dates/numbers
- **Not supporting RTL**: Not supporting RTL languages

## Related Concepts

- [[Coding Type Systems/accessibility-by-design]] â€” Accessibility by Design
- [[Architecture/atomic-design]] â€” Design Systems
- [[Headless UI/headless-ui-components]] â€” Headless Components
- [[Quality & Testing/observability]] â€” Observability

## Project Observations

The project follows internationalization by design through:
- i18next and react-i18next
- String externalization
- Locale-aware formatting
- RTL support

## Sources

- [[Sources/typescript-documentation|Microsoft â€” TypeScript Documentation]]
- [[Sources/mdn-web-documentation|MDN Web Documentation]]

**End of Internationalization by Design Note**
