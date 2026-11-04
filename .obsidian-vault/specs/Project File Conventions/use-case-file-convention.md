---
slug: use-case-file-convention
tags:
  - core-concepts

  - conventions-file-structure-organization
---

# Use Case File Convention

> **Purpose:** Encapsulate application use cases.
> **Last Updated:** 2026-11-03

## concept_id
`project-use-case-file`

## title
*.use-case.ts File Convention

## aliases
- Use Case File Convention
- *.use-case.ts
- Use Case Module

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- Application services
- Use case implementation
- Domain-driven design
- Project organization

## tags
- type/convention
- domain/ddd
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
- ddd-application-service

## Definition

The *.use-case.ts file convention designates files that encapsulate application use cases â€” coordinated sequences of operations that achieve a specific business goal.

## Problem Addressed

Without file conventions:
- Use cases are scattered
- Coordination is inconsistent
- Testing is difficult
- Architecture is inconsistent

## Scope and Boundaries

Use case files apply to:
- Application services
- Use case coordination
- Business workflow orchestration
- Application logic

Use case files do not apply to:
- Domain logic
- UI rendering
- Data access
- State management

## When to Apply

- Implementing use cases
- Coordinating business workflows
- Building application services
- Separating concerns

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every operation needs use case file
- **Not for domain**: Use case files should not contain domain logic
- **Not for UI**: Use case files should not render UI
- **Not for data**: Use case files should not access data directly

## Implementation Guidance

1. **Define use cases**: Define use case classes or functions
2. **Coordinate operations**: Coordinate domain and infrastructure operations
3. **Handle flow**: Handle business workflow
4. **Return results**: Return results to caller
5. **Test use cases**: Test use case coordination

## Verification

- [ ] Use cases are defined
- [ ] Operations are coordinated
- [ ] Workflow is handled
- [ ] Results are returned
- [ ] Use cases are tested

## Common Misuses

- **Not defining use cases**: Not defining use case files
- **Not coordinating**: Not coordinating operations
- **Not handling flow**: Not handling workflow
- **Not testing**: Not testing use cases

## Related Concepts

- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Project File Conventions/data-file-convention]] â€” *.data.ts File Convention
- [[DDD/application-service]] â€” Application Service

## Project Observations

The project follows use case file convention through:
- *.use-case.ts files for application services
- *.logic.ts files for business logic
- *.data.ts files for data access
- Clear separation of concerns

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Use Case File Convention Note**
