# Context Map

> **Purpose:** Document relationships between bounded contexts.
> **Last Updated:** 2026-11-03

---

## concept_id
`ddd-context-map`

## title
Context Map

## aliases
- Context Map
- Bounded Context Map
- DDD Context Map

## category
domain-modeling

## concept_type
strategic-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Multi-context systems
- Microservices architecture
- Enterprise integration
- Domain isolation

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
- ddd-bounded-context
- ddd-ubiquitous-language
- ddd-anti-corruption-layer
- arch-microservices
- api-api-gateway

---

## Definition

A Context Map is a visual representation that documents the relationships between bounded contexts. It shows how contexts communicate and what patterns are used for integration.

## Problem Addressed

Without context map:
- Relationships between contexts are unclear
- Integration patterns are inconsistent
- Dependencies are not managed
- Communication is ad-hoc

## Scope and Boundaries

Context map applies to:
- Multi-context systems
- Microservices architecture
- Enterprise integration
- Domain isolation

Context map does not apply to:
- Single-context systems
- UI implementation
- Database schema design
- Performance optimization

## When to Apply

- Designing multi-context systems
- Integrating microservices
- Managing dependencies
- Documenting relationships

## Tradeoffs and When to Avoid

- **Over-documenting**: Not all relationships need documentation
- **Maintenance**: Context maps need maintenance
- **Not for single-context**: Single-context systems don't need context map
- **Not for UI**: UI implementation doesn't need context map

## Implementation Guidance

1. **Identify contexts**: List all bounded contexts
2. **Document relationships**: Document how contexts communicate
3. **Choose patterns**: Select integration patterns
4. **Visualize**: Create visual representation
5. **Maintain**: Update as system evolves

## Verification

- [ ] All contexts are documented
- [ ] Relationships are documented
- [ ] Integration patterns are selected
- [ ] Visual representation exists
- [ ] Context map is maintained

## Common Misuses

- **Over-documenting**: Documenting all relationships
- **Not maintaining**: Not updating context map
- **Not visualizing**: Not creating visual representation
- **Not choosing patterns**: Not selecting integration patterns

## Related Concepts

- [[DDD/bounded-context]] — Bounded Context
- [[DDD/ubiquitous-language]] — Ubiquitous Language
- [[DDD/anti-corruption-layer]] — Anti-Corruption Layer
- [[Architecture/microservices]] — Microservices

## Project Observations

The project uses TypeScript, which supports context map through:
- Module boundaries
- Package separation
- API contracts
- Event definitions

## Sources

- [[Sources/evans-ddd-2003|Eric Evans — Domain-Driven Design: Tackling Complexity in the Heart of Software]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Context Map Note**
