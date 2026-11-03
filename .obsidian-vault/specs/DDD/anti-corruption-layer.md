# Anti-Corruption Layer

> **Purpose:** Protect domain model from external system limitations.
> **Last Updated:** 2026-11-03

---

## concept_id
`ddd-anti-corruption-layer`

## title
Anti-Corruption Layer

## aliases
- ACL
- Anti-Corruption Layer
- Corruption Prevention Layer

## category
domain-modeling

## concept_type
strategic-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Integrating external systems
- Legacy system integration
- Microservices architecture
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
- ddd-context-map
- arch-hexagonal-architecture
- arch-adapter
- arch-port-file-convention

---

## Definition

The Anti-Corruption Layer is a strategic DDD pattern that protects a domain model from the limitations and quirks of external systems. It translates between external and internal models.

## Problem Addressed

Without ACL:
- External system limitations corrupt the domain model
- External model changes affect the domain model
- Integration code is scattered throughout the codebase
- Domain model becomes polluted

## Scope and Boundaries

ACL applies to:
- External system integration
- Legacy system integration
- Microservices architecture
- Domain isolation

ACL does not apply to:
- Internal system design
- UI implementation
- Database schema design
- Performance optimization

## When to Apply

- Integrating external systems
- Integrating legacy systems
- Microservices architecture
- Domain isolation is needed

## Tradeoffs and When to Avoid

- **Over-engineering**: Not all integrations need ACL
- **Translation overhead**: Translating models adds complexity
- **Not for simple integrations**: Simple integrations don't need ACL
- **Not for internal systems**: Internal systems don't need ACL

## Implementation Guidance

1. **Identify external model**: Understand the external model
2. **Define internal model**: Define the internal model
3. **Create translator**: Create translation layer
4. **Isolate domain**: Keep domain model clean
5. **Test translation**: Test translation logic

## Verification

- [ ] External model is understood
- [ ] Internal model is defined
- [ ] Translation layer exists
- [ ] Domain model is clean
- [ ] Translation is tested

## Common Misuses

- **Not isolating**: Not keeping domain model clean
- **Over-translating**: Translating everything
- **Not testing**: Not testing translation logic
- **Over-engineering**: Not needed for simple integrations

## Related Concepts

- [[DDD/bounded-context]] — Bounded Context
- [[DDD/context-map]] — Context Map
- [[Architecture/hexagonal-architecture]] — Hexagonal Architecture
- [[Architecture/adapter]] — Adapter Pattern

## Project Observations

The project uses TypeScript, which supports ACL through:
- Adapter pattern
- Port interfaces
- Translation functions
- Type definitions

## Sources

- [[Sources/evans-ddd-2003|Eric Evans — Domain-Driven Design: Tackling Complexity in the Heart of Software]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Anti-Corruption Layer Note**
