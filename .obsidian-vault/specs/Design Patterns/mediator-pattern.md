---
slug: mediator-pattern
tags:
  - design-patterns   - patterns   - reusable-solutions
---

# Mediator Pattern

> **Purpose:** Reduce coupling with Mediator Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`mediator-pattern`

## title
Mediator Pattern

## aliases
- Mediator
- Controller Pattern
- Mediator Design Pattern
- Collaboration Manager

## category
design-patterns

## concept_type
behavioral-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Component communication
- Coupling reduction
- Workflow management
- UI coordination

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- mediator-pattern
- event-emitter
- pub-sub-pattern
- command-pattern

## Definition

Mediator Pattern defines an object that encapsulates how a set of objects interact, promoting loose coupling by preventing objects from referring to each other explicitly.

## Problem Addressed

Without Mediator:
- Objects are tightly coupled
- Communication is complex
- Changes affect many objects
- Systems are rigid

## Scope of Boundaries

Mediator applies to:
- Component communication
- Coupling reduction
- Workflow management
- UI coordination

Mediator does not apply to:
- Object creation
- Object structure
- Data access
- Algorithm selection

## When to Apply

- Needing component communication
- Wanting to reduce coupling
- Managing workflows
- Coordinating UI components

## Tradeoffs and When to Avoid

- **God object**: Mediator can become god object
- **Not for simple apps**: Simple apps don't need Mediator
- **Not for performance**: Mediator may add overhead
- **Not for direct communication**: Direct communication doesn't need Mediator

## Implementation Guidance

1. **Define mediator**: Define mediator interface
2. **Implement mediator**: Implement concrete mediator
3. **Register components**: Register components with mediator
4. **Coordinate communication**: Coordinate through mediator
5. **Test interactions**: Test component interactions

## Verification

- [ ] Mediator interface defined
- [ ] Mediator implemented
- [ ] Components registered
- [ ] Communication coordinated
- [ ] Interactions tested

## Common Misuses

- **God object**: Creating god object mediator
- **Not testing**: Not testing interactions
- **Not documenting**: Not documenting communication
- **Too complex**: Making mediator too complex

## Related Concepts

- [[Design Patterns/mediator-pattern]] â€” Mediator Pattern
- [[Design Patterns/observer-pattern]] â€” Event Emitter
- [[Design Patterns/message-queue-pattern]] â€” Pub-Sub Pattern
- [[Design Patterns/command-pattern]] â€” Command Pattern

## Project Observations

The project uses Mediator Pattern through:
- Component communication coordination
- Coupling reduction between components
- Workflow management
- UI component coordination

## Sources

- [[Sources/gof-design-patterns|GoF Design Patterns]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Mediator Pattern Note**
