---
slug: tell-dont-ask
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# Tell, Don't Ask

> **Purpose:** Tell objects what to do, don't ask them for data and decide.
> **Last Updated:** 2026-11-03

## concept_id
`arch-tell-dont-ask`

## title
Tell, Don't Ask

## aliases
- Tell, Don't Ask
- Information Expert
- Delegate Behavior

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Object design
- Domain modeling
- API design
- Service design

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/medium

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-law-of-demeter
- arch-encapsulation
- arch-pure-functions
- arch-single-responsibility
- arch-high-cohesion

## Definition

Tell, Don't Ask is a principle where you tell an object what to do rather than asking it for data and making decisions based on that data. This keeps behavior with the data.

## Problem Addressed

Without Tell, Don't Ask:
- Behavior is scattered across multiple objects
- Domain logic is in the wrong place
- Objects are passive data containers
- Code is hard to understand

## Scope and Boundaries

Tell, Don't Ask applies to:
- Object design
- Domain modeling
- API design
- Service design

Tell, Don't Ask does not apply to:
- Query methods (asking for data is OK)
- DTOs (data transfer objects)
- Configuration objects

## When to Apply

- Designing domain objects
- Creating APIs
- Refactoring scattered behavior
- Building services

## Tradeoffs and When to Avoid

- **Anemic domain model**: Objects with only data
- **God objects**: Objects that do too much
- **Not for DTOs**: Data transfer objects should be passive
- **Not for configuration**: Configuration objects should be passive

## Implementation Guidance

1. **Put behavior with data**: Methods should be on the object that owns the data
2. **Tell, don't ask**: Tell objects what to do, don't ask for data
3. **Avoid getters**: Minimize getter methods
4. **Use delegates**: Delegate behavior to the right object
5. **Keep objects active**: Objects should have behavior

## Verification

- [ ] Behavior is with the data
- [ ] Objects are told what to do
- [ ] Getters are minimized
- [ ] Objects have behavior

## Common Misuses

- **Anemic domain model**: Objects with only data
- **God objects**: Objects that do too much
- **Not for DTOs**: Data transfer objects should be passive
- **Ignoring queries**: Asking for data is OK for queries

## Related Concepts

- [[Architecture/law-of-demeter]] â€” Law of Demeter
- [[Architecture/encapsulation]] â€” Encapsulation
- [[Coding Type Systems/pure-functions]] â€” Pure Functions
- [[Architecture/single-responsibility-principle]] â€” Single Responsibility Principle

## Project Observations

The project follows Tell, Don't Ask through:
- Domain objects with behavior
- Service methods that tell objects what to do
- Minimized getters
- Active domain models

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Tell, Don't Ask Note**
