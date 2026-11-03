# Command Pattern

> **Purpose:** Encapsulate requests with Command Pattern.
> **Last Updated:** 2026-11-03

---

## concept_id
`command-pattern`

## title
Command Pattern

## aliases
- Command
- Action Pattern
- Transaction Pattern
- Command Design Pattern

## category
design-patterns

## concept_type
behavioral-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Request encapsulation
- Undo/redo
- Queueing requests
- Logging actions

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- command-pattern
- cqs-pattern
- event-sourcing
- mediator-pattern

---

## Definition

Command Pattern encapsulates a request as an object, allowing parameterization, queuing, logging, and undo/redo of operations.

## Problem Addressed

Without Command:
- Requests are coupled to receivers
- Undo/redo is difficult
- Request queuing is complex
- Action logging is manual

## Scope of Boundaries

Command applies to:
- Request encapsulation
- Undo/redo
- Queueing requests
- Logging actions

Command does not apply to:
- Object creation
- Object structure
- Data access
- Event handling

## When to Apply

- Needing request encapsulation
- Wanting undo/redo
- Needing request queuing
- Wanting action logging

## Tradeoffs and When to Avoid

- **Complexity**: Command adds complexity
- **Not for simple apps**: Simple apps don't need Command
- **Not for simple calls**: Simple calls don't need Command
- **Not for performance**: Command may add overhead

## Implementation Guidance

1. **Define command**: Define command interface
2. **Implement commands**: Implement concrete commands
3. **Create invoker**: Create invoker class
4. **Execute commands**: Execute commands through invoker
5. **Add undo**: Add undo functionality

## Verification

- [ ] Command interface defined
- [ ] Commands implemented
- [ ] Invoker created
- [ ] Commands executed
- [ ] Undo added

## Common Misuses

- **Over-engineering**: Using Command for simple calls
- **Not implementing undo**: Not implementing undo when needed
- **Not testing**: Not testing command behavior
- **Too many commands**: Creating too many command classes

## Related Concepts

- [[Design Patterns/command-pattern]] — Command Pattern
- [[Architecture/cqs-pattern]] — Command-Query Separation
- [[Data Databases/event-sourcing]] — Event Sourcing
- [[Design Patterns/mediator-pattern]] — Mediator Pattern

## Project Observations

The project uses Command Pattern through:
- Encapsulated request objects
- Undo/redo functionality
- Request queuing systems
- Action logging mechanisms

## Sources

- [[Sources/gof-design-patterns|GoF Design Patterns]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Command Pattern Note**
