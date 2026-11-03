# Jotai State Management

> **Purpose:** Manage application state with Jotai.
> **Last Updated:** 2026-11-03

---

## concept_id
`jotai-state-management`

## title
Jotai State Management

## aliases
- Jotai
- Jotai State
- Jotai Atoms

## category
state-management

## concept_type
state-library

## research_status
verified

## project_adoption
declared

## applicability
- React applications
- State management
- Atomic state
- Derived state

## tags
- type/library
- domain/frontend
- status/verified
- priority/high

## source_ids
- jotai-documentation
- martinfowler-patterns

## related_concept_ids
- react-modern-react
- zustand-state-management
- recoil-state-management
- mobx-state-management

---

## Definition

Jotai is a primitive and flexible state management library for React that uses an atomic approach to state management.

## Problem Addressed

Without Jotai:
- State management is complex
- Derived state is difficult
- Performance is poor
- Boilerplate is excessive

## Scope of Boundaries

Jotai applies to:
- State management
- Atomic state
- Derived state
- React applications

Jotai does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building React applications
- Managing complex state
- Needing derived state
- Wanting atomic state

## Tradeoffs and When to Avoid

- **Not for simple state**: Simple state doesn't need Jotai
- **Not for server state**: Server state is better handled by React Query
- **Not for global state**: Global state is better handled by Redux
- **Not for backend**: Jotai is for frontend only

## Implementation Guidance

1. **Install Jotai**: Install Jotai
2. **Create atoms**: Create atoms for state
3. **Use atoms**: Use atoms in components
4. **Derive state**: Derive state from atoms
5. **Persist state**: Persist state as needed

## Verification

- [ ] Jotai is installed
- [ ] Atoms are created
- [ ] Atoms are used in components
- [ ] State is derived
- [ ] State is persisted

## Common Misuses

- **Not installing**: Not installing Jotai
- **Not creating atoms**: Not creating atoms
- **Not using atoms**: Not using atoms in components
- **Not deriving state**: Not deriving state

## Related Concepts

- [[React/modern-react-project-template]] — Modern React Project Template
- [[State Management/zustand-state-management]] — Zustand State Management
- [[State Management/recoil-state-management]] — Recoil State Management
- [[State Management/mobx-state-management]] — MobX State Management

## Project Observations

The project uses Jotai through:
- Atomic state management
- Derived state
- React integration
- State persistence

## Sources

- [[Sources/jotai-documentation|Jotai Documentation]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Jotai State Management Note**
