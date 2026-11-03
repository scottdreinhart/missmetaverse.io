---
slug: state-machines
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# State Machines

> **Purpose:** Model state transitions explicitly to prevent invalid states.
> **Last Updated:** 2026-11-03

## concept_id
`arch-state-machines`

## title
State Machines

## aliases
- State Machine
- Finite State Machine
- FSM
- Statechart

## category
frontend-ui-composition

## concept_type
design-pattern

## research_status
verified

## project_adoption
declared

## applicability
- UI state management
- Workflow modeling
- Protocol implementation
- Game development

## tags
- type/pattern
- domain/architecture
- domain/frontend
- status/verified
- priority/medium

## source_ids
- harel-statecharts
- martin-fowler-patterns

## related_concept_ids
- arch-statecharts
- arch-unidirectional-data-flow
- arch-jotai
- arch-make-invalid-states-unrepresentable

## Definition

A State Machine is a computational model where a system can be in exactly one state at any time, and transitions between states are triggered by events. It explicitly defines valid states, transitions, and actions.

## Problem Addressed

Without state machines:
- State is represented by booleans or strings
- Invalid states are possible
- Transitions are scattered across code
- State logic is hard to understand

## Scope and Boundaries

State machines apply to:
- UI state management
- Workflow modeling
- Protocol implementation
- Game development

State machines do not apply to:
- Simple flags
- Continuous values
- Complex data structures

## When to Apply

- System has discrete states
- Transitions between states are well-defined
- Invalid states must be prevented
- State logic is complex

## Tradeoffs and When to Avoid

- **Complexity**: State machines add boilerplate
- **Not for simple cases**: Simple flags don't need state machines
- **Learning curve**: State machine libraries have learning curves
- **Over-engineering**: Not every state needs a machine

## Implementation Guidance

1. **Identify states**: List all possible states
2. **Define transitions**: Specify valid transitions
3. **Define actions**: Specify actions on transitions
4. **Prevent invalid states**: Use type system
5. **Visualize**: Create state diagram

## Verification

- [ ] All states are defined
- [ ] All valid transitions are defined
- [ ] Invalid states are impossible
- [ ] State transitions are explicit
- [ ] State diagram is maintained

## Common Misuses

- **Using booleans**: Multiple booleans instead of state machine
- **Ignoring invalid states**: Not preventing invalid transitions
- **Over-engineering**: Using state machines for simple cases
- **Not visualizing**: Not creating state diagrams

## Related Concepts

- [[Architecture/state-machines]] â€” Statecharts
- [[Architecture/unidirectional-data-flow]] â€” Unidirectional Data Flow
- [[State Management/jotai-state-management]] â€” Jotai State Management
- [[Coding Type Systems/make-invalid-states-unrepresentable]] â€” Make Invalid States Unrepresentable

## Project Observations

The project uses Jotai for state management, which supports state machines through:
- Atom-based state
- Derived atoms for computed state
- Atomic updates
- React integration

## Sources

- [[Sources/harel-statecharts.md|David Harel â€” Statecharts: A Visual Formalism for Complex Systems]]
- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of State Machines Note**
