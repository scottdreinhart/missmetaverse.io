# Domain Event

> **Purpose:** Capture something that happened in the domain.
> **Last Updated:** 2026-11-03

---

## concept_id
`ddd-domain-event`

## title
Domain Event

## aliases
- Domain Event
- DDD Event
- Event

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Domain modeling
- Event-driven architecture
- Decoupling components
- Audit trails

## tags
- type/pattern
- domain/ddd
- domain/architecture
- status/verified
- priority/high

## source_ids
- evans-ddd-2003
- martin-fowler-patterns

## related_concept_ids
- ddd-aggregate
- ddd-domain-event
- arch-event-driven-architecture
- api-transactional-outbox
- arch-event-file-convention

---

## Definition

A Domain Event is a pattern where something that happened in the domain is captured as an event object. Events are used to communicate between aggregates and trigger downstream processes.

## Problem Addressed

Without domain events:
- Components are tightly coupled
- State changes are not tracked
- Audit trails are difficult
- Decoupling is hard

## Scope and Boundaries

Domain events apply to:
- Domain modeling
- Event-driven architecture
- Decoupling components
- Audit trails

Domain events do not apply to:
- UI events
- System events
- Infrastructure events
- Log entries

## When to Apply

- Modeling domain state changes
- Decoupling components
- Creating audit trails
- Event-driven architecture

## Tradeoffs and When to Avoid

- **Over-eventing**: Not every state change needs an event
- **Complexity**: Event handling adds complexity
- **Not for UI**: UI events are different
- **Not for infrastructure**: Infrastructure events are different

## Implementation Guidance

1. **Define event**: Create event class with relevant data
2. **Emit event**: Emit event when state changes
3. **Handle event**: Create handlers for events
4. **Store event**: Store events for audit
5. **Test handling**: Test event handling

## Verification

- [ ] Event class is defined
- [ ] Event is emitted on state change
- [ ] Event handlers exist
- [ ] Events are stored
- [ ] Event handling is tested

## Common Misuses

- **Over-eventing**: Not every state change needs an event
- **Confusing with UI events**: UI events are different
- **Not storing**: Not storing events for audit
- **Not testing**: Not testing event handling

## Related Concepts

- [[DDD/aggregate]] — Aggregate
- [[Architecture/event-driven-architecture]] — Event-Driven Architecture
- [[APIs Distributed Systems/transactional-outbox]] — Transactional Outbox

## Project Observations

The project uses TypeScript, which supports domain events through:
- Event classes
- Event emitters
- Event handlers
- Type definitions

## Sources

- [[Sources/evans-ddd-2003|Eric Evans — Domain-Driven Design: Tackling Complexity in the Heart of Software]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Domain Event Note**
