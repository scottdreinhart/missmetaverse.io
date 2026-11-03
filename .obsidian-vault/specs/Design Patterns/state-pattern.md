---
slug: state-pattern
---

# State Pattern

> **Purpose:** Manage state transitions with State Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`state-pattern`

## title
State Pattern

## aliases
- State
- Finite State Machine
- State Machine Pattern
- State Design Pattern

## category
design-patterns

## concept_type
behavioral-pattern

## research_status
verified

## project_adoption
declared

## applicability
- State management
- State transitions
- Behavior variation
- Workflow management

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- state-pattern
- state-machines
- fsm-pattern
- workflow-pattern

## Definition

State Pattern allows an object to alter its behavior when its internal state changes, appearing to change its class.

## Problem Addressed

Without State:
- State logic is scattered
- Transitions are error-prone
- Behavior is coupled to state
- Code is complex

## Scope of Boundaries

State applies to:
- State management
- State transitions
- Behavior variation
- Workflow management

State does not apply to:
- Object creation
- Object structure
- Data access
- Event handling

## When to Apply

- Needing state management
- Wanting clean transitions
- Needing behavior variation
- Managing workflows

## Tradeoffs and When to Avoid

- **Complexity**: State adds complexity
- **Not for simple apps**: Simple apps don't need State
- **Not for fixed behavior**: Fixed behavior doesn't need State
- **Not for performance**: State may add overhead

## Implementation Guidance

1. **Define state interface**: Define state interface
2. **Implement states**: Implement concrete states
3. **Create context**: Create context class
4. **Transition states**: Transition between states
5. **Validate transitions**: Validate state transitions

## Verification

- [ ] State interface defined
- [ ] States implemented
- [ ] Context created
- [ ] Transitions working
- [ ] Transitions validated

## Common Misuses

- **Over-engineering**: Using State for simple cases
- **Not validating**: Not validating transitions
- **Not testing**: Not testing state behavior
- **Too many states**: Creating too many state classes

## Related Concepts

- [[Design Patterns/state-pattern]] â€” State Pattern
- [[Architecture/state-machines]] â€” State Machines
- [[Architecture/state-machines]] â€” FSM Pattern
- [[Design Patterns/workflow-pattern]] â€” Workflow Pattern

## Project Observations

The project uses State Pattern through:
- State interfaces for behavior
- Concrete state implementations
- Context classes managing state
- Validated state transitions

## Sources

- [[Sources/gof-design-patterns|GoF Design Patterns]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of State Pattern Note**
