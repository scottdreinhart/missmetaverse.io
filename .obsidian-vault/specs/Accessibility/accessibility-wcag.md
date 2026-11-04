---
slug: accessibility-wcag
tags:
  - accessibility-a11y

  - accessibility-a11y-frontend
---

# Accessibility WCAG

> **Purpose:** Ensure accessibility with WCAG guidelines.
> **Last Updated:** 2026-11-03

## concept_id
`accessibility-wcag`

## title
Accessibility WCAG

## aliases
- WCAG
- Web Content Accessibility Guidelines
- Accessibility Standards
- ARIA

## category
accessibility

## concept_type
accessibility-standard

## research_status
verified

## project_adoption
declared

## applicability
- Web accessibility
- WCAG compliance
- ARIA usage
- Screen reader support

## tags
- type/standard
- domain/accessibility
- status/verified
- priority/high

## source_ids
- wcag-21-specification
- martinfowler-patterns

## related_concept_ids
- accessibility-wcag
- aria-usage
- screen-readers
- accessibility-testing

## Definition

Accessibility WCAG is the Web Content Accessibility Guidelines specification that provides standards for making web content accessible to people with disabilities.

## Problem Addressed

Without WCAG:
- Content is inaccessible
- Legal compliance is at risk
- User base is limited
- Screen readers don't work

## Scope of Boundaries

WCAG applies to:
- Web accessibility
- WCAG compliance
- ARIA usage
- Screen reader support

WCAG does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building web apps
- Needing accessibility compliance
- Using ARIA
- Supporting screen readers

## Tradeoffs and When to Avoid

- **Complexity**: WCAG adds complexity
- **Not for simple apps**: Simple apps may not need full WCAG
- **Not for internal**: Internal apps may not need WCAG
- **Not for all**: Not all content needs WCAG

## Implementation Guidance

1. **Understand WCAG**: Understand WCAG levels (A, AA, AAA)
2. **Add ARIA**: Add ARIA attributes
3. **Test**: Test with screen readers
4. **Check contrast**: Check color contrast
5. **Keyboard nav**: Ensure keyboard navigation

## Verification

- [ ] WCAG understood
- [ ] ARIA added
- [ ] Testing done
- [ ] Contrast checked
- [ ] Navigation ensured

## Common Misuses

- **Not testing**: Not testing with screen readers
- **Not adding ARIA**: Not adding ARIA attributes
- **Ignoring contrast**: Ignoring color contrast
- **Not keyboard**: Not ensuring keyboard navigation

## Related Concepts

- [[Accessibility/accessibility-wcag]] â€” Accessibility WCAG
- [[Accessibility/accessibility-wcag]] â€” ARIA Usage
- [[Accessibility/accessibility-wcag]] â€” Screen Readers
- [[Accessibility/axe-core-react-accessibility]] â€” Accessibility Testing

## Project Observations

The project uses Accessibility WCAG through:
- WCAG compliance implementation
- ARIA attribute usage
- Screen reader testing
- Color contrast checking

## Sources

- [[Sources/S024-wcag-21|WCAG 2.1 Specification]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Accessibility WCAG Note**
