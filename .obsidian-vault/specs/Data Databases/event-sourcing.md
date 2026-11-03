---
slug: event-sourcing
tags:
  - core-concepts

  - database   - data   - backend
---

# Event Sourcing

> **Purpose:** Implement event sourcing with Event Sourcing.
> **Last Updated:** 2026-11-03

## concept_id
`event-sourcing`

## title
Event Sourcing

## aliases
- Event Sourcing
- Event Store
- Event Log
- CQRS

## category
data-databases

## concept_type
data-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Event sourcing
- Event store
- Event log
- CQRS

## tags
- type/pattern
- domain/data
- status/verified
- priority/high

## source_ids
- event-sourcing-guide
- martinfowler-patterns

## related_concept_ids
- event-sourcing
- event-store
- event-log
- cqrs

## Definition

Event Sourcing is a pattern where state is determined by a sequence of events stored in an event store, rather than storing current state directly.

## Problem Addressed

Without Event Sourcing:
- History is lost
- Auditing is difficult
- Recovery is hard
- Debugging is complex

## Scope of Boundaries

Event Sourcing applies to:
- Event sourcing
- Event store
- Event log
- CQRS

Event Sourcing does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing history
- Wanting auditing
- Recovering state

## Tradeoffs and When to Avoid

- **Complexity**: Event Sourcing adds complexity
- **Not for simple apps**: Simple apps may not need Event Sourcing
- **Not for internal**: Internal apps may not need Event Sourcing
- **Not for all**: Not all apps need Event Sourcing

## Implementation Guidance

1. **Choose store**: Choose event store
2. **Define events**: Define event types
3. **Store events**: Store events
4. **Replay**: Implement replay
5. **Test**: Test event sourcing

## Verification

- [ ] Store chosen
- [ ] Events defined
- [ ] Events stored
- [ ] Replay implemented
- [ ] Event sourcing tested

## Common Misuses

- **Not choosing**: Not choosing a store
- **Not defining**: Not defining events
- **Not storing**: Not storing events
- **Not replaying**: Not implementing replay

## Related Concepts

- [[Data Databases/event-sourcing]] â€” Event Sourcing
- [[Data Databases/event-sourcing]] â€” Event Store
- [[Data Databases/event-sourcing]] â€” Event Log
- [[Application Architecture/cqrs-pattern]] â€” CQRS

## Project Observations

The project uses Event Sourcing through:
- Event store implementation
- Event type definition
- Event storage
- State replay

## Sources

- [[Data Databases/event-sourcing|Event Sourcing Guide]]
- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Event Sourcing Note**
