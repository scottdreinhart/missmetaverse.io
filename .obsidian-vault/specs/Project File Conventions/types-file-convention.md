---
slug: types-file-convention
tags:
  - core-concepts

  - conventions-file-structure-organization
---

# Types File Convention

> **Purpose:** Centralize type definitions.
> **Last Updated:** 2026-11-03

## concept_id
`project-types-file`

## title
*.types.ts File Convention

## aliases
- Types File Convention
- *.types.ts
- Type Definitions

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- TypeScript projects
- Type definitions
- Interface definitions
- Project organization

## tags
- type/convention
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- goF-1994

## related_concept_ids
- project-schema-file
- project-view-file
- project-logic-file
- project-data-file
- coding-strict-typing

## Definition

The *.types.ts file convention designates files that contain type definitions â€” interfaces, types, and enums that define the shape of data.

## Problem Addressed

Without file conventions:
- Types are scattered
- Type definitions are duplicated
- Maintenance is error-prone
- Consistency is lost

## Scope and Boundaries

Types files apply to:
- Type definitions
- Interface definitions
- Enum definitions
- Type aliases

Types files do not apply to:
- Implementation code
- Business logic
- UI rendering
- Data fetching

## When to Apply

- Defining types
- Creating interfaces
- Building enums
- Organizing type definitions

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every type needs separate file
- **Not for logic**: Types files should not contain implementation
- **Not for UI**: Types files should not render UI
- **Not for data**: Types files should not fetch data

## Implementation Guidance

1. **Centralize types**: Put types in dedicated files
2. **Export types**: Export types for reuse
3. **Group related types**: Group related types together
4. **Document types**: Document type purpose
5. **Review types**: Review types regularly

## Verification

- [ ] Types are centralized
- [ ] Types are exported
- [ ] Related types are grouped
- [ ] Types are documented
- [ ] Types are reviewed

## Common Misuses

- **Not centralizing**: Not putting types in dedicated files
- **Not exporting**: Not exporting types
- **Not grouping**: Not grouping related types
- **Not documenting**: Not documenting types

## Related Concepts

- [[Project File Conventions/schema-file-convention]] â€” *.schema.ts File Convention
- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Project File Conventions/data-file-convention]] â€” *.data.ts File Convention

## Project Observations

The project follows types file convention through:
- *.types.ts files for type definitions
- *.schema.ts files for validation
- Clear type boundaries
- Strict TypeScript

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Types File Convention Note**
