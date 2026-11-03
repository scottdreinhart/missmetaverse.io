---
slug: schema-file-convention
tags:
  - conventions   - file-structure   - organization
---

# Schema File Convention

> **Purpose:** Define data schemas in dedicated files.
> **Last Updated:** 2026-11-03

## concept_id
`project-schema-file`

## title
*.schema.ts File Convention

## aliases
- Schema File Convention
- *.schema.ts
- Schema Module

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- Data validation
- API contracts
- Form validation
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
- project-hook-file
- data-driven-schema-driven

## Definition

The *.schema.ts file convention designates files that define data schemas â€” validation rules, type definitions, and transformation logic using tools like Zod.

## Problem Addressed

Without file conventions:
- Schemas are scattered
- Validation is inconsistent
- Types are duplicated
- Maintenance is error-prone

## Scope and Boundaries

Schema files apply to:
- Data validation
- Type definitions
- Transformation logic
- API contracts

Schema files do not apply to:
- Business logic
- UI rendering
- Data fetching
- State management

## When to Apply

- Defining validation rules
- Creating type definitions
- Building API contracts
- Validating form data

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every type needs separate schema file
- **Not for logic**: Schema files should not contain business logic
- **Not for UI**: Schema files should not render UI
- **Not for data**: Schema files should not fetch data

## Implementation Guidance

1. **Define schemas**: Define schemas for data
2. **Export schemas**: Export schemas for reuse
3. **Validate data**: Use schemas to validate data
4. **Infer types**: Infer TypeScript types from schemas
5. **Test schemas**: Test schema validation

## Verification

- [ ] Schemas are defined
- [ ] Schemas are exported
- [ ] Data is validated
- [ ] Types are inferred
- [ ] Schemas are tested

## Common Misuses

- **Not defining schemas**: Not defining schemas
- **Not exporting**: Not exporting schemas
- **Not validating**: Not validating data
- **Not testing**: Not testing schemas

## Related Concepts

- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Project File Conventions/data-file-convention]] â€” *.data.ts File Convention
- [[Project File Conventions/hook-file-convention]] â€” *.hook.ts File Convention

## Project Observations

The project follows schema file convention through:
- *.schema.ts files for validation
- Zod schemas for runtime validation
- Type inference from schemas
- Clear validation boundaries

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Schema File Convention Note**
