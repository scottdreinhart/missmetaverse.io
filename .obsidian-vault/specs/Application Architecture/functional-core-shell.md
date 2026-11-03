---
slug: functional-core-shell
tags:
  - application-design   - architecture-patterns   - core-concepts

  - architecture   - application-design   - patterns
---

# Functional Core Imperative Shell

> **Purpose:** Structure apps with Functional Core, Imperative Shell.
> **Last Updated:** 2026-11-03

## concept_id
`functional-core-shell`

## title
Functional Core, Imperative Shell

## aliases
- Functional Core, Imperative Shell
- Functional Core
- Imperative Shell
- FCS Pattern

## category
application-architecture

## concept_type
architecture-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Functional programming
- Business logic isolation
- Side effect management
- Testability

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- fowler-patterns
- martinfowler-patterns

## related_concept_ids
- functional-core-shell
- functional-core
- imperative-shell
- fcs-pattern

## Definition

Functional Core, Imperative Shell is an architectural pattern that separates pure business logic (functional core) from side effects and I/O (imperative shell).

## Problem Addressed

Without Functional Core, Imperative Shell:
- Logic is mixed with side effects
- Testing is difficult
- Business rules are unclear
- Code is hard to reason about

## Scope of Boundaries

Functional Core, Imperative Shell applies to:
- Functional programming
- Business logic isolation
- Side effect management
- Testability

Functional Core, Imperative Shell does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing pure logic
- Wanting testability
- Managing side effects

## Tradeoffs and When to Avoid

- **Complexity**: Functional Core, Imperative Shell adds complexity
- **Not for simple apps**: Simple apps don't need Functional Core, Imperative Shell
- **Not for internal**: Internal apps may not need Functional Core, Imperative Shell
- **Not for all**: Not all apps need Functional Core, Imperative Shell

## Implementation Guidance

1. **Identify logic**: Identify pure business logic
2. **Create core**: Create functional core
3. **Create shell**: Create imperative shell
4. **Connect**: Connect core and shell
5. **Test**: Test core

## Verification

- [ ] Logic identified
- [ ] Core created
- [ ] Shell created
- [ ] Core connected
- [ ] Core tested

## Common Misuses

- **Not identifying**: Not identifying pure logic
- **Not creating**: Not creating core
- **Not creating**: Not creating shell
- **Not connecting**: Not connecting core and shell

## Related Concepts

- [[Application Architecture/functional-core-shell]] â€” Functional Core, Imperative Shell
- [[Application Architecture/functional-core-shell]] â€” Functional Core
- [[Application Architecture/functional-core-shell]] â€” Imperative Shell
- [[Application Architecture/functional-core-shell]] â€” FCS Pattern

## Project Observations

The project uses Functional Core, Imperative Shell through:
- Pure logic identification
- Core creation
- Shell creation
- Core-shell connection

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Functional Core, Imperative Shell Note**
