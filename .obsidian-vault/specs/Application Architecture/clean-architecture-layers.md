---
slug: clean-architecture-layers
---

# Clean Architecture Layers

> **Purpose:** Structure apps with Clean Architecture layers.
> **Last Updated:** 2026-11-03

## concept_id
`clean-architecture-layers`

## title
Clean Architecture Layers

## aliases
- Clean Architecture Layers
- Robert Martin Layers
- Dependency Rule
- Entities Use Cases

## category
application-architecture

## concept_type
architectural-concept

## research_status
verified

## project_adoption
declared

## applicability
- Layer separation
- Dependency rule
- Framework independence
- Testability

## tags
- type/concept
- domain/architecture
- status/verified
- priority/high

## source_ids
- clean-architecture-martin
- martinfowler-patterns

## related_concept_ids
- clean-architecture-layers
- dependency-rule
- entities-use-cases
- interfaces-adapters

## Definition

Clean Architecture Layers structure applications into concentric circles with dependencies pointing inward, ensuring business rules are independent of frameworks and UI.

## Problem Addressed

Without Clean Layers:
- Frameworks control architecture
- Business rules depend on UI
- Testing is difficult
- Changes are risky

## Scope of Boundaries

Clean Layers apply to:
- Layer separation
- Dependency rule
- Framework independence
- Testability

Clean Layers do not apply to:
- Database design
- Infrastructure
- Deployment
- CI/CD

## When to Apply

- Building complex apps
- Needing framework independence
- Wanting testability
- Protecting business rules

## Tradeoffs and When to Avoid

- **Complexity**: Clean Layers add complexity
- **Not for simple apps**: Simple apps don't need Clean Layers
- **Not for quick projects**: Quick projects don't need Clean Layers
- **Not for small teams**: Small teams may not need Clean Layers

## Implementation Guidance

1. **Define layers**: Define Clean Architecture layers
2. **Implement entities**: Implement business entities
3. **Implement use cases**: Implement use cases
4. **Implement interfaces**: Implement interface adapters
5. **Frameworks layer**: Implement frameworks layer

## Verification

- [ ] Layers defined
- [ ] Entities implemented
- [ ] Use cases implemented
- [ ] Interfaces implemented
- [ ] Frameworks layer implemented

## Common Misuses

- **Breaking dependency rule**: Dependencies pointing outward
- **Business in adapters**: Putting business logic in adapters
- **Not testing**: Not testing layers independently
- **Over-engineering**: Using Clean Layers for simple apps

## Related Concepts

- [[Application Architecture/clean-architecture-layers-layers]] â€” Clean Architecture Layers
- [[Application Architecture/dependency-rule]] â€” Dependency Rule
- [[Application Architecture/clean-architecture-layers]] â€” Entities Use Cases
- [[Application Architecture/clean-architecture-layers]] â€” Interfaces Adapters

## Project Observations

The project uses Clean Architecture Layers through:
- Entities layer (business rules)
- Use cases layer (application logic)
- Interface adapters layer (controllers, presenters)
- Frameworks layer (UI, databases, external systems)

## Sources

- [[Sources/clean-architecture-martin|Clean Architecture â€” Robert Martin]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Clean Architecture Layers Note**
