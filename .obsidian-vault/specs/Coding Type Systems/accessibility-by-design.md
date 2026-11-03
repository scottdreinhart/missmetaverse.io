---
slug: accessibility-by-design
tags:
  - core-concepts

  - coding   - type-system   - best-practices
---

# Accessibility by Design

> **Purpose:** Build accessible interfaces from the start.
> **Last Updated:** 2026-11-03

## concept_id
`coding-accessibility-by-design`

## title
Accessibility by Design

## aliases
- a11y by Design
- Accessible by Design
- Inclusive Design

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
- domain/accessibility
- status/verified
- priority/high

## source_ids
- mdn-web-documentation
- owasp-top-10

## related_concept_ids
- coding-internationalization-by-design
- arch-design-systems
- arch-headless-components
- testing-observability

## Definition

Accessibility by Design is a practice where accessibility is considered from the start of development, not as an afterthought. This includes semantic HTML, keyboard navigation, screen reader support, and color contrast.

## Problem Addressed

Without accessibility by design:
- Accessibility is an afterthought
- Remediation is expensive
- Legal compliance is at risk
- User experience suffers

## Scope and Boundaries

Accessibility by design applies to:
- UI development
- Component design
- Frontend architecture
- User experience

Accessibility by design does not apply to:
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

- **Initial cost**: Accessibility requires initial investment
- **Complexity**: Some accessibility features are complex
- **Not for backend**: Backend doesn't need accessibility
- **Not for infrastructure**: Infrastructure doesn't need accessibility

## Implementation Guidance

1. **Use semantic HTML**: Use HTML elements for their purpose
2. **Support keyboard navigation**: Ensure keyboard accessibility
3. **Test with screen readers**: Test with assistive technology
4. **Ensure color contrast**: Meet WCAG contrast requirements
5. **Add ARIA labels**: Add ARIA labels when needed

## Verification

- [ ] Semantic HTML is used
- [ ] Keyboard navigation works
- [ ] Screen reader testing is done
- [ ] Color contrast meets WCAG
- [ ] ARIA labels are added

## Common Misuses

- **Afterthought**: Adding accessibility after development
- **Ignoring keyboard**: Not testing keyboard navigation
- **Not testing**: Not testing with screen readers
- **Poor contrast**: Not meeting WCAG requirements

## Related Concepts

- [[Coding Type Systems/internationalization-by-design]] â€” Internationalization by Design
- [[Architecture/atomic-design]] â€” Design Systems
- [[Headless UI/headless-ui-components]] â€” Headless Components
- [[Quality & Testing/observability]] â€” Observability

## Project Observations

The project follows accessibility by design through:
- ShadCN UI components (accessible by default)
- @axe-core/react for automated testing
- Semantic HTML
- Keyboard navigation support

## Sources

- [[Sources/S008-mdn-css-2024|MDN Web Documentation]]
- [[Sources/S014-owasp-top-ten-2021|OWASP â€” Top 10 Web Application Security Risks]]

**End of Accessibility by Design Note**
