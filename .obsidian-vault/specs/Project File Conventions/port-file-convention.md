---
slug: port-file-convention
tags:
  - conventions   - file-structure   - organization
---

# Port File Convention

> **Purpose:** Define interfaces for external concerns.
> **Last Updated:** 2026-11-03

## concept_id
`project-port-file`

## title
*.port.ts File Convention

## aliases
- Port File Convention
- *.port.ts
- Port Interface

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
- Dependency inversion
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
- project-adapter-file
- project-view-file
- project-logic-file
- project-data-file
- arch-hexagonal-architecture

## Definition

The *.port.ts file convention designates files that define port interfaces â€” abstractions that the domain layer depends on for external concerns (databases, APIs, services).

## Problem Addressed

Without file conventions:
- Interfaces are scattered
- Dependencies are unclear
- Testing is difficult
- Architecture is inconsistent

## Scope and Boundaries

Port files apply to:
- Interface definitions
- Port definitions
- Dependency inversion
- Hexagonal architecture

Port files do not apply to:
- Implementation code
- Business logic
- UI rendering
- Data fetching

## When to Apply

- Defining port interfaces
- Implementing hexagonal architecture
- Inverting dependencies
- Building testable code

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every interface needs separate file
- **Not for implementation**: Port files should not contain implementation
- **Not for logic**: Port files should not contain business logic
- **Not for UI**: Port files should not render UI

## Implementation Guidance

1. **Define interfaces**: Define port interfaces
2. **Keep ports simple**: Keep interfaces simple
3. **Group related ports**: Group related ports together
4. **Document ports**: Document port purpose
5. **Implement ports**: Create adapter implementations

## Verification

- [ ] Interfaces are defined
- [ ] Interfaces are simple
- [ ] Related ports are grouped
- [ ] Ports are documented
- [ ] Implementations exist

## Common Misuses

- **Not defining interfaces**: Not defining port interfaces
- **Not keeping simple**: Not keeping interfaces simple
- **Not grouping**: Not grouping related ports
- **Not documenting**: Not documenting ports

## Related Concepts

- [[Project File Conventions/adapter-file-convention]] â€” *.adapter.ts File Convention
- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Application Architecture/hexagonal-architecture]] â€” Hexagonal Architecture

## Project Observations

The project follows port file convention through:
- *.port.ts files for interface definitions
- *.adapter.ts files for implementations
- Dependency injection
- Hexagonal architecture

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Port File Convention Note**
