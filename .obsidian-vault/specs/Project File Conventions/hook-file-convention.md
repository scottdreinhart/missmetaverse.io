---
slug: hook-file-convention
tags:
  - core-concepts

  - conventions   - file-structure   - organization
---

# Hook File Convention

> **Purpose:** Encapsulate reusable logic in custom hooks.
> **Last Updated:** 2026-11-03

## concept_id
`project-hook-file`

## title
*.hook.ts File Convention

## aliases
- Hook File Convention
- *.hook.ts
- Custom Hook

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- React applications
- Reusable logic
- State management
- Project organization

## tags
- type/convention
- domain/frontend
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- goF-1994

## related_concept_ids
- project-view-file
- project-logic-file
- project-data-file
- project-schema-file
- arch-custom-hooks-composables

## Definition

The *.hook.ts file convention designates files that contain custom React hooks â€” reusable logic that encapsulates state, effects, and side effects.

## Problem Addressed

Without file conventions:
- Reusable logic is scattered
- Hooks are inconsistent
- Code duplication occurs
- Maintenance is error-prone

## Scope and Boundaries

Hook files apply to:
- Reusable state logic
- Side effects
- Event handling
- Data fetching

Hook files do not apply to:
- Business logic
- UI rendering
- Data transformation
- API integration

## When to Apply

- Creating reusable logic
- Encapsulating state
- Handling side effects
- Building custom hooks

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every piece of logic needs a hook
- **Not for business logic**: Hooks should not contain business logic
- **Not for UI**: Hooks should not render UI
- **Not for data**: Hooks should not fetch data

## Implementation Guidance

1. **Name hooks**: Name hooks with use prefix
2. **Keep hooks focused**: Each hook should do one thing
3. **Accept dependencies**: Accept dependencies as parameters
4. **Return values**: Return values and functions
5. **Test hooks**: Test hooks independently

## Verification

- [ ] Hooks are named correctly
- [ ] Hooks are focused
- [ ] Dependencies are accepted
- [ ] Values are returned
- [ ] Hooks are tested

## Common Misuses

- **Putting logic in hook**: Putting business logic in hooks
- **Not naming**: Not naming hooks with use prefix
- **Not testing**: Not testing hooks
- **Not focusing**: Not keeping hooks focused

## Related Concepts

- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Project File Conventions/data-file-convention]] â€” *.data.ts File Convention
- [[React/modern-react-hooks-custom]] â€” Custom Hooks / Composables

## Project Observations

The project follows hook file convention through:
- *.hook.ts files for custom hooks
- *.view.tsx files for UI
- *.logic.ts files for business logic
- Clear separation of concerns

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Hook File Convention Note**
