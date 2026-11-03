# View File Convention

> **Purpose:** Separate view logic from other concerns.
> **Last Updated:** 2026-11-03

---

## concept_id
`project-view-file`

## title
*.view.tsx File Convention

## aliases
- View File Convention
- *.view.tsx
- View Component

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
- UI development
- Component architecture
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
- project-logic-file
- project-data-file
- project-hook-file
- project-schema-file
- arch-presentation-logic-separation

---

## Definition

The *.view.tsx file convention designates files that contain UI view logic — the presentation layer that renders components and handles user interaction.

## Problem Addressed

Without file conventions:
- Code organization is inconsistent
- Finding code is difficult
- Responsibilities are unclear
- Maintenance is error-prone

## Scope and Boundaries

View files apply to:
- UI presentation
- Component rendering
- User interaction handling
- Layout and structure

View files do not apply to:
- Business logic
- Data fetching
- State management
- API calls

## When to Apply

- Building React components
- Creating UI views
- Implementing presentation layer
- Organizing project files

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every component needs a view file
- **Not for logic**: View files should not contain business logic
- **Not for data**: View files should not fetch data
- **Not for state**: View files should not manage state

## Implementation Guidance

1. **Keep views simple**: View files should be simple
2. **Separate logic**: Move logic to *.logic.ts files
3. **Use hooks**: Use custom hooks for reusable logic
4. **Pass data**: Receive data as props
5. **Handle events**: Handle user events and delegate

## Verification

- [ ] View files are simple
- [ ] Logic is separated
- [ ] Hooks are used
- [ ] Data is passed as props
- [ ] Events are delegated

## Common Misuses

- **Putting logic in view**: Putting business logic in view files
- **Fetching data in view**: Fetching data in view files
- **Managing state in view**: Managing state in view files
- **Not separating**: Not separating concerns

## Related Concepts

- [[Project File Conventions/logic-file-convention]] — *.logic.ts File Convention
- [[Project File Conventions/data-file-convention]] — *.data.ts File Convention
- [[Project File Conventions/hook-file-convention]] — *.hook.ts File Convention
- [[Architecture/presentation-logic-separation]] — Presentation-Logic Separation

## Project Observations

The project follows view file convention through:
- *.view.tsx files for UI
- *.logic.ts files for business logic
- *.hook.ts files for reusable logic
- Clear separation of concerns

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of View File Convention Note**
