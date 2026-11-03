---
slug: use-case
---

# Use Case

> **Purpose:** Model use cases with Use Case.
> **Last Updated:** 2026-11-03

## concept_id
`use-case`

## title
Use Case

## aliases
- Use Case
- Application Use Case
- User Goal
- System Interaction

## category
ddd

## concept_type
ddd-concept

## research_status
verified

## project_adoption
declared

## applicability
- Use case modeling
- User goals
- System interactions
- Application requirements

## tags
- type/concept
- domain/ddd
- status/verified
- priority/high

## source_ids
- evans-ddd
- martinfowler-patterns

## related_concept_ids
- use-case
- application-use-case
- user-goal
- system-interaction

## Definition

Use Case is a DDD concept that describes a specific interaction between a user (or external system) and the application to achieve a specific goal.

## Problem Addressed

Without Use Cases:
- Requirements are unclear
- Interactions are undefined
- Goals are unknown
- Design is ambiguous

## Scope of Boundaries

Use Case applies to:
- Use case modeling
- User goals
- System interactions
- Application requirements

Use Case does not apply to:
- Domain logic
- Infrastructure
- UI implementation
- Database

## When to Apply

- Designing systems
- Needing requirements
- Modeling interactions
- Defining goals

## Tradeoffs and When to Avoid

- **Complexity**: Use Cases add complexity
- **Not for simple apps**: Simple apps don't need Use Cases
- **Not for internal**: Internal apps may not need Use Cases
- **Not for all**: Not all apps need Use Cases

## Implementation Guidance

1. **Identify actors**: Identify actors
2. **Define goals**: Define user goals
3. **Describe flows**: Describe interaction flows
4. **Document**: Document use cases
5. **Validate**: Validate with users

## Verification

- [ ] Actors identified
- [ ] Goals defined
- [ ] Flows described
- [ ] Use cases documented
- [ ] Use cases validated

## Common Misuses

- **Not identifying**: Not identifying actors
- **Not defining**: Not defining goals
- **Not describing**: Not describing flows
- **Not documenting**: Not documenting use cases

## Related Concepts

- [[DDD/use-case]] â€” Use Case
- [[DDD/use-case]] â€” Application Use Case
- [[DDD/use-case]] â€” User Goal
- [[DDD/use-case]] â€” System Interaction

## Project Observations

The project uses Use Cases through:
- Actor identification
- Goal definition
- Flow description
- Use case documentation

## Sources

- [[Sources/evans-ddd|Domain-Driven Design by Eric Evans]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Use Case Note**
