---
slug: data-file-convention
tags:
  - core-concepts

  - conventions   - file-structure   - organization
---

# Data File Convention

> **Purpose:** Separate data layer from business logic.
> **Last Updated:** 2026-11-03

## concept_id
`project-data-file`

## title
*.data.ts File Convention

## aliases
- Data File Convention
- *.data.ts
- Data Module

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
- Data fetching
- API integration
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
- project-hook-file
- project-schema-file
- arch-port-file-convention

## Definition

The *.data.ts file convention designates files that handle data layer concerns â€” data fetching, API integration, and data transformation.

## Problem Addressed

Without file conventions:
- Data fetching is scattered
- API integration is inconsistent
- Data transformation is repeated
- Maintenance is error-prone

## Scope and Boundaries

Data files apply to:
- Data fetching
- API integration
- Data transformation
- Data caching

Data files do not apply to:
- Business logic
- UI rendering
- User interaction
- State management

## When to Apply

- Fetching data from APIs
- Integrating with external services
- Transforming data
- Caching data

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every data operation needs separate file
- **Not for logic**: Data files should not contain business logic
- **Not for UI**: Data files should not render UI
- **Not for state**: Data files should not manage state

## Implementation Guidance

1. **Separate data**: Keep data operations separate
2. **Use hooks**: Use custom hooks for data fetching
3. **Handle errors**: Handle errors gracefully
4. **Cache data**: Cache data when appropriate
5. **Test data**: Test data operations

## Verification

- [ ] Data operations are separate
- [ ] Hooks are used
- [ ] Errors are handled
- [ ] Data is cached
- [ ] Operations are tested

## Common Misuses

- **Putting logic in data**: Putting business logic in data files
- **Not handling errors**: Not handling errors
- **Not caching**: Not caching data
- **Not testing**: Not testing data operations

## Related Concepts

- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Project File Conventions/hook-file-convention]] â€” *.hook.ts File Convention
- [[Project File Conventions/port-file-convention]] â€” *.port.ts File Convention

## Project Observations

The project follows data file convention through:
- *.data.ts files for data operations
- *.logic.ts files for business logic
- *.hook.ts files for reusable logic
- Clear separation of concerns

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994.md|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Data File Convention Note**
