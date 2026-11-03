# React Modern React Fragments

> **Purpose:** Group children without extra DOM with React Fragments.
> **Last Updated:** 2026-11-03

---

## concept_id
`modern-react-fragments`

## title
React Modern React Fragments

## aliases
- React Fragments
- Modern React Fragments
- React Fragment
- React Fragment Configuration

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
- Component composition
- DOM structure
- Table rendering

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
- modern-react-fragments-table

---

## Definition

React Modern React Fragments is the effective grouping of children without adding extra DOM nodes using React Fragments for component composition and table rendering.

## Problem Addressed

Without Fragments:
- Extra DOM nodes are added
- Table rendering is broken
- Component composition is complex
- DOM structure is polluted

## Scope of Boundaries

Fragments apply to:
- Component composition
- DOM structure
- Table rendering
- DOM cleanup

Fragments do not apply to:
- State management
- Backend code
- Database design
- Infrastructure

## When to Apply

- Building React applications
- Needing component composition
- Wanting clean DOM structure
- Needing table rendering

## Tradeoffs and When to Avoid

- **Not for simple UI**: Simple UI doesn't need Fragments
- **Not for backend**: Fragments are for frontend only
- **Not for non-React**: Fragments are for React only
- **Not for SSR**: SSR requires additional configuration

## Implementation Guidance

1. **Install React**: Install React
2. **Use Fragment**: Use Fragment to group children
3. **Add keys**: Add keys for lists
4. **Short syntax**: Use short syntax (<>...</>)
5. **Maintain structure**: Maintain clean DOM structure

## Verification

- [ ] React is installed
- [ ] Fragment is used
- [ ] Keys are added
- [ ] Short syntax is used
- [ ] DOM structure is clean

## Common Misuses

- **Not installing**: Not installing React
- **Not using Fragment**: Not using Fragment
- **Not adding keys**: Not adding keys for lists
- **Not maintaining structure**: Not maintaining clean DOM structure

## Related Concepts

- [[React/modern-react-project-template]] — Modern React Project Template
- [[React/modern-react-hooks]] — Modern React Hooks
- [[React/modern-react-components]] — Modern React Components
- [[React/modern-react-fragments-table]] — Modern React Fragments Table

## Project Observations

The project uses React Fragments through:
- Component composition
- DOM structure
- Table rendering
- DOM cleanup

## Sources

- [[Sources/react-documentation|React Documentation]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of React Modern React Fragments Note**
