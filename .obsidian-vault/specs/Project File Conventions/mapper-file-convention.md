---
slug: mapper-file-convention
tags:
  - core-concepts

  - conventions-file-structure-organization
---

# Mapper File Convention

> **Purpose:** Separate data transformation logic.
> **Last Updated:** 2026-11-03

## concept_id
`project-mapper-file`

## title
*.mapper.ts File Convention

## aliases
- Mapper File Convention
- *.mapper.ts
- Mapper Module

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- Data transformation
- DTO mapping
- API integration
- Project organization

## tags
- type/convention
- domain/frontend
- status/verified
- priority/medium

## source_ids
- martinfowler-patterns
- goF-1994

## related_concept_ids
- project-view-file
- project-logic-file
- project-data-file
- project-hook-file
- project-schema-file

## Definition

The *.mapper.ts file convention designates files that handle data transformation â€” mapping between different data formats (DTOs, API responses, domain models).

## Problem Addressed

Without file conventions:
- Transformation logic is scattered
- Mapping is inconsistent
- Code duplication occurs
- Maintenance is error-prone

## Scope and Boundaries

Mapper files apply to:
- Data transformation
- DTO mapping
- API response mapping
- Domain model mapping

Mapper files do not apply to:
- Business logic
- UI rendering
- Data fetching
- State management

## When to Apply

- Transforming data between formats
- Mapping DTOs to domain models
- Converting API responses
- Building data adapters

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every transformation needs separate file
- **Not for logic**: Mapper files should not contain business logic
- **Not for UI**: Mapper files should not render UI
- **Not for data**: Mapper files should not fetch data

## Implementation Guidance

1. **Create mappers**: Create mapper functions
2. **Accept input**: Accept source data
3. **Return output**: Return transformed data
4. **Test mapping**: Test transformation logic
5. **Reuse mappers**: Reuse mappers across codebase

## Verification

- [ ] Mappers are created
- [ ] Input is accepted
- [ ] Output is returned
- [ ] Mapping is tested
- [ ] Mappers are reused

## Common Misuses

- **Putting logic in mapper**: Putting business logic in mapper files
- **Not testing**: Not testing mapping logic
- **Not reusing**: Not reusing mappers
- **Not separating**: Not separating transformation from business logic

## Related Concepts

- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Project File Conventions/data-file-convention]] â€” *.data.ts File Convention
- [[Project File Conventions/hook-file-convention]] â€” *.hook.ts File Convention

## Project Observations

The project follows mapper file convention through:
- *.mapper.ts files for data transformation
- *.data.ts files for data fetching
- *.logic.ts files for business logic
- Clear separation of concerns

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Mapper File Convention Note**
