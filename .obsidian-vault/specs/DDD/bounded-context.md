---
slug: bounded-context
---

# Bounded Context

> **Purpose:** Define clear boundaries for domain models.
> **Last Updated:** 2026-11-03

## concept_id
`ddd-bounded-context`

## title
Bounded Context

## aliases
- Bounded Context
- Context Boundary
- DDD Context

## category
domain-modeling

## concept_type
strategic-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Complex domains with multiple perspectives
- Systems with different teams
- Enterprise applications
- Microservices architecture

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
- ddd-ubiquitous-language
- ddd-context-map
- ddd-anti-corruption-layer
- arch-domain-driven-design
- arch-microservices

## Definition

A Bounded Context is a explicit boundary within which a domain model is valid and a ubiquitous language applies. Within this boundary, the model is consistent and unambiguous.

## Problem Addressed

Without bounded contexts:
- The same term has different meanings in different parts of the system
- Models become overly complex trying to cover all perspectives
- Teams work at cross-purposes
- The domain model becomes inconsistent

## Scope and Boundaries

Bounded contexts apply to:
- Domain model boundaries
- Team boundaries
- Service boundaries (in microservices)
- Database boundaries (in some cases)

Bounded contexts do not address:
- UI boundaries
- Technical layer boundaries
- Deployment boundaries

## When to Apply

- The same concept has different meanings in different parts of the system
- Multiple teams are working on the same domain
- The domain is complex and needs clear boundaries
- Microservices architecture is being adopted

## Tradeoffs and When to Avoid

- **Over-splitting**: Creating too many bounded contexts increases complexity
- **Integration overhead**: Contexts need to communicate
- **Not for simple domains**: Simple projects don't need bounded contexts

## Implementation Guidance

1. **Identify contexts**: Find natural boundaries in the domain
2. **Define boundaries**: Clearly document what each context owns
3. **Establish relationships**: Define how contexts communicate
4. **Enforce boundaries**: Prevent cross-context contamination
5. **Maintain independence**: Keep contexts loosely coupled

## Verification

- [ ] Each context has a clear responsibility
- [ ] Models are consistent within each context
- [ ] Context boundaries are enforced
- [ ] Context relationships are documented

## Common Misuses

- **Confusing with microservices**: Bounded contexts are logical boundaries, not necessarily physical
- **Over-splitting**: Creating too many contexts increases complexity
- **Ignoring relationships**: Not documenting how contexts communicate
- **Violating boundaries**: Allowing cross-context dependencies

## Related Concepts

- [[DDD/ubiquitous-language]] â€” Ubiquitous Language
- [[DDD/context-map]] â€” Context Map
- [[DDD/anti-corruption-layer]] â€” Anti-Corruption Layer
- [[Architecture/microservices]] â€” Microservices

## Project Observations

The project uses TypeScript, which supports bounded contexts through:
- Module boundaries
- Package separation
- Type isolation
- Clear API contracts

## Sources

- [[Sources/evans-ddd-2003|Eric Evans â€” Domain-Driven Design: Tackling Complexity in the Heart of Software]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Bounded Context Note**
