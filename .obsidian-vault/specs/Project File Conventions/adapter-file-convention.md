---
slug: adapter-file-convention
tags:
  - core-concepts

  - conventions-file-structure-organization
---

# Adapter File Convention

> **Purpose:** Implement port interfaces for external concerns.
> **Last Updated:** 2026-11-03

## concept_id
`project-adapter-file`

## title
*.adapter.ts File Convention

## aliases
- Adapter File Convention
- *.adapter.ts
- Adapter Implementation

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- Hexagonal architecture
- Port and adapter pattern
- External integration
- Project organization

## tags
- type/convention
- domain/architecture
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- goF-1994

## related_concept_ids
- project-port-file
- project-view-file
- project-logic-file
- project-data-file
- arch-hexagonal-architecture

## Definition

The *.adapter.ts file convention designates files that implement port interfaces â€” concrete implementations that connect the domain layer to external concerns (databases, APIs, services).

## Problem Addressed

Without file conventions:
- Implementations are scattered
- Adapters are inconsistent
- Testing is difficult
- Architecture is inconsistent

## Scope and Boundaries

Adapter files apply to:
- Port implementations
- External integration
- Database access
- API clients

Adapter files do not apply to:
- Business logic
- UI rendering
- Domain logic
- State management

## When to Apply

- Implementing port interfaces
- Integrating with external systems
- Building database access
- Creating API clients

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every implementation needs separate file
- **Not for logic**: Adapter files should not contain business logic
- **Not for UI**: Adapter files should not render UI
- **Not for domain**: Adapter files should not contain domain logic

## Implementation Guidance

1. **Implement ports**: Implement port interfaces
2. **Handle external**: Handle external concerns
3. **Transform data**: Transform data between external and internal formats
4. **Handle errors**: Handle errors from external systems
5. **Test adapters**: Test adapter implementations

## Verification

- [ ] Ports are implemented
- [ ] External concerns are handled
- [ ] Data is transformed
- [ ] Errors are handled
- [ ] Adapters are tested

## Common Misuses

- **Not implementing ports**: Not implementing port interfaces
- **Not transforming**: Not transforming data
- **Not handling errors**: Not handling errors
- **Not testing**: Not testing adapters

## Related Concepts

- [[Project File Conventions/port-file-convention]] â€” *.port.ts File Convention
- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Application Architecture/hexagonal-architecture]] â€” Hexagonal Architecture

## Project Observations

The project follows adapter file convention through:
- *.adapter.ts files for implementations
- *.port.ts files for interfaces
- Dependency injection
- Hexagonal architecture

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Adapter File Convention Note**
