# Logic File Convention

> **Purpose:** Separate business logic from presentation.
> **Last Updated:** 2026-11-03

---

## concept_id
`project-logic-file`

## title
*.logic.ts File Convention

## aliases
- Logic File Convention
- *.logic.ts
- Logic Module

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
- Business logic separation
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
- project-view-file
- project-data-file
- project-hook-file
- project-schema-file
- arch-presentation-logic-separation

---

## Definition

The *.logic.ts file convention designates files that contain business logic — the domain logic that operates on data and implements business rules.

## Problem Addressed

Without file conventions:
- Logic is mixed with presentation
- Testing is difficult
- Reuse is limited
- Maintenance is error-prone

## Scope and Boundaries

Logic files apply to:
- Business rules
- Data transformation
- Domain logic
- Business calculations

Logic files do not apply to:
- UI rendering
- User interaction
- Layout and structure
- Styling

## When to Apply

- Implementing business rules
- Transforming data
- Building domain logic
- Separating concerns

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every component needs separate logic file
- **Not for UI**: Logic files should not render UI
- **Not for data**: Logic files should not fetch data
- **Not for state**: Logic files should not manage state

## Implementation Guidance

1. **Keep logic pure**: Logic should be pure when possible
2. **Accept data**: Accept data as parameters
3. **Return results**: Return results, don't mutate
4. **Test logic**: Test logic independently
5. **Reuse logic**: Reuse logic across views

## Verification

- [ ] Logic is pure
- [ ] Data is accepted as parameters
- [ ] Results are returned
- [ ] Logic is tested
- [ ] Logic is reused

## Common Misuses

- **Putting UI in logic**: Putting UI rendering in logic files
- **Not testing**: Not testing logic independently
- **Not reusing**: Not reusing logic
- **Mutating state**: Mutating state in logic files

## Related Concepts

- [[Project File Conventions/view-file-convention]] — *.view.tsx File Convention
- [[Project File Conventions/data-file-convention]] — *.data.ts File Convention
- [[Project File Conventions/hook-file-convention]] — *.hook.ts File Convention
- [[Architecture/presentation-logic-separation]] — Presentation-Logic Separation

## Project Observations

The project follows logic file convention through:
- *.logic.ts files for business logic
- *.view.tsx files for UI
- *.hook.ts files for reusable logic
- Clear separation of concerns

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of Logic File Convention Note**
