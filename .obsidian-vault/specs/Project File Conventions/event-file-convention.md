---
slug: event-file-convention
tags:
  - core-concepts

  - conventions   - file-structure   - organization
---

# Event File Convention

> **Purpose:** Define domain events in dedicated files.
> **Last Updated:** 2026-11-03

## concept_id
`project-event-file`

## title
*.event.ts File Convention

## aliases
- Event File Convention
- *.event.ts
- Domain Event

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- Domain-driven design
- Event-driven architecture
- Domain events
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
- ddd-domain-event

## Definition

The *.event.ts file convention designates files that define domain events â€” objects that capture something that happened in the domain.

## Problem Addressed

Without file conventions:
- Events are scattered
- Event definitions are inconsistent
- Handling is difficult
- Architecture is inconsistent

## Scope and Boundaries

Event files apply to:
- Domain event definitions
- Event data structures
- Event metadata
- Event handling

Event files do not apply to:
- UI events
- System events
- Infrastructure events
- Log entries

## When to Apply

- Defining domain events
- Modeling state changes
- Implementing event-driven architecture
- Building domain events

## Tradeoffs and When to Avoid

- **Over-eventing**: Not every state change needs an event
- **Not for UI**: Event files should not handle UI events
- **Not for system**: Event files should not handle system events
- **Not for infrastructure**: Event files should not handle infrastructure events

## Implementation Guidance

1. **Define events**: Define event classes
2. **Add data**: Add relevant event data
3. **Add metadata**: Add event metadata (timestamp, aggregate ID)
4. **Test events**: Test event structure
5. **Document events**: Document event purpose

## Verification

- [ ] Events are defined
- [ ] Data is added
- [ ] Metadata is added
- [ ] Events are tested
- [ ] Events are documented

## Common Misuses

- **Not defining events**: Not defining event files
- **Not adding data**: Not adding event data
- **Not adding metadata**: Not adding event metadata
- **Not testing**: Not testing events

## Related Concepts

- [[Project File Conventions/view-file-convention]] â€” *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] â€” *.logic.ts File Convention
- [[Project File Conventions/data-file-convention]] â€” *.data.ts File Convention
- [[DDD/domain-event]] â€” Domain Event

## Project Observations

The project follows event file convention through:
- *.event.ts files for domain events
- *.logic.ts files for event handling
- Domain-driven design
- Clear event boundaries

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994.md|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Event File Convention Note**
