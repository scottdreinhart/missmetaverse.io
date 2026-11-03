---
slug: onion-architecture
tags:
  - architecture   - application-design   - patterns
---

# Onion Architecture

> **Purpose:** Structure apps with Onion Architecture.
> **Last Updated:** 2026-11-03

## concept_id
`onion-architecture`

## title
Onion Architecture

## aliases
- Onion Architecture
- Hexagonal Alternative
- Dependency Architecture
- Scott Chambers Onion

## category
application-architecture

## concept_type
architectural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Domain-centric design
- Framework independence
- Testability
- Layer separation

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- onion-architecture-chambers
- martinfowler-patterns

## related_concept_ids
- onion-architecture
- hexagonal-architecture
- clean-architecture
- domain-centric

## Definition

Onion Architecture structures applications in concentric layers with the domain model at the center, dependencies pointing inward, and frameworks at the outermost layer.

## Problem Addressed

Without Onion Architecture:
- Frameworks control architecture
- Domain model is polluted
- Testing is difficult
- Changes are risky

## Scope of Boundaries

Onion Architecture applies to:
- Domain-centric design
- Framework independence
- Testability
- Layer separation

Onion Architecture does not apply to:
- Database design
- Infrastructure
- Deployment
- UI rendering

## When to Apply

- Building domain-centric apps
- Needing framework independence
- Wanting testability
- Protecting domain model

## Tradeoffs and When to Avoid

- **Complexity**: Onion Architecture adds complexity
- **Not for simple apps**: Simple apps don't need Onion Architecture
- **Not for quick projects**: Quick projects don't need Onion Architecture
- **Not for small teams**: Small teams may not need Onion Architecture

## Implementation Guidance

1. **Define core**: Define domain model core
2. **Define boundaries**: Define layer boundaries
3. **Implement services**: Implement domain services
4. **Implement interfaces**: Implement interface definitions
5. **Implement frameworks**: Implement framework adapters

## Verification

- [ ] Core defined
- [ ] Boundaries defined
- [ ] Services implemented
- [ ] Interfaces implemented
- [ ] Frameworks implemented

## Common Misuses

- **Breaking dependencies**: Allowing outward dependencies
- **Polluting domain**: Polluting domain with framework code
- **Not testing**: Not testing layers independently
- **Over-engineering**: Using Onion for simple apps

## Related Concepts

- [[Application Architecture/onion-architecture]] â€” Onion Architecture
- [[Application Architecture/hexagonal-architecture]] â€” Hexagonal Architecture
- [[Application Architecture/clean-architecture-layers]] â€” Clean Architecture
- [[Application Architecture/domain-driven-design]] â€” Domain Centric

## Project Observations

The project uses Onion Architecture through:
- Domain model at center
- Layer boundaries enforcement
- Framework adapters at outer layer
- Inward dependency direction

## Sources

- [[Sources/onion-architecture-chambers|Onion Architecture â€” Scott Chambers]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Onion Architecture Note**
