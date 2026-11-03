---
slug: modern-react-portals
---

# React Modern React Portals

> **Purpose:** Render children outside parent with React Portals.
> **Last Updated:** 2026-11-03

## concept_id
`modern-react-portals`

## title
React Modern React Portals

## aliases
- React Portals
- Modern React Portals
- React Portal Rendering
- React Portal Configuration

## category
react

## concept_type
react-feature

## research_status
verified

## project_adoption
declared

## applicability
- React applications
- Modal rendering
- Tooltip rendering
- Overlay rendering

## tags
- type/feature
- domain/react
- status/verified
- priority/high

## source_ids
- react-documentation
- martinfowler-patterns

## related_concept_ids
- modern-react-project-template
- modern-react-hooks
- modern-react-components
- modern-react-portals-modal

## Definition

React Modern React Portals is the effective rendering of children outside their parent component using React Portals for modals, tooltips, and overlays.

## Problem Addressed

Without Portals:
- Modal rendering is manual
- Tooltip rendering is complex
- Overlay rendering is difficult
- DOM structure is limited

## Scope of Boundaries

Portals apply to:
- Modal rendering
- Tooltip rendering
- Overlay rendering
- DOM structure

Portals do not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building React applications
- Needing modal rendering
- Wanting tooltip rendering
- Needing overlay rendering

## Tradeoffs and When to Avoid

- **Not for simple UI**: Simple UI doesn't need Portals
- **Not for backend**: Portals are for frontend only
- **Not for non-React**: Portals are for React only
- **Not for SSR**: SSR requires additional configuration

## Implementation Guidance

1. **Install React**: Install React
2. **Create portal target**: Create portal target in HTML
3. **Use createPortal**: Use createPortal to render
4. **Add modals**: Add modals with Portal
5. **Handle events**: Handle events in Portal

## Verification

- [ ] React is installed
- [ ] Portal target is created
- [ ] createPortal is used
- [ ] Modals are added
- [ ] Events are handled

## Common Misuses

- **Not installing**: Not installing React
- **Not creating portal target**: Not creating portal target
- **Not using createPortal**: Not using createPortal
- **Not adding modals**: Not adding modals

## Related Concepts

- [[React/modern-react-project-template]] â€” Modern React Project Template
- [[React/modern-react-hooks]] â€” Modern React Hooks
- [[React/modern-react-components]] â€” Modern React Components
- [[React/modern-react-portals-modal]] â€” Modern React Portals Modal

## Project Observations

The project uses React Portals through:
- Modal rendering
- Tooltip rendering
- Overlay rendering
- DOM structure

## Sources

- [[Sources/react-documentation|React Documentation]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of React Modern React Portals Note**
