# Hexagonal Architecture Adapters

> **Purpose:** Implement adapters in Hexagonal Architecture.
> **Last Updated:** 2026-11-03

---

## concept_id
`hexagonal-architecture-adapters`

## title
Hexagonal Architecture Adapters

## aliases
- Adapters
- Driving Adapters
- Driven Adapters
- Primary Adapters
- Secondary Adapters

## category
application-architecture

## concept_type
architectural-concept

## research_status
verified

## project_adoption
declared

## applicability
- Adapter implementation
- External system integration
- Framework integration
- Test doubles

## tags
- type/concept
- domain/architecture
- status/verified
- priority/high

## source_ids
- hexagonal-architecture-perez
- martinfowler-patterns

## related_concept_ids
- hexagonal-architecture-adapters
- hexagonal-architecture-ports
- adapter-pattern
- test-doubles

---

## Definition

Hexagonal Architecture Adapters are implementations that connect ports to external systems, translating between external interfaces and port interfaces.

## Problem Addressed

Without Adapters:
- External systems are coupled
- Frameworks are hardcoded
- Testing is difficult
- Translation is manual

## Scope of Boundaries

Adapters apply to:
- Adapter implementation
- External system integration
- Framework integration
- Test doubles

Adapters do not apply to:
- Business logic
- Port definition
- Domain modeling
- Database design

## When to Apply

- Integrating external systems
- Using frameworks
- Creating test doubles
- Translating interfaces

## Tradeoffs and When to Avoid

- **Complexity**: Adapters add complexity
- **Not for simple apps**: Simple apps don't need adapters
- **Not for direct integration**: Direct integration doesn't need adapters
- **Not for testing**: Testing doesn't need production adapters

## Implementation Guidance

1. **Identify external**: Identify external systems
2. **Implement adapter**: Implement adapter for port
3. **Translate data**: Translate data between external and port
4. **Handle errors**: Handle external errors
5. **Test adapter**: Test adapter behavior

## Verification

- [ ] External systems identified
- [ ] Adapter implemented
- [ ] Data translated
- [ ] Errors handled
- [ ] Adapter tested

## Common Misuses

- **Business logic**: Putting business logic in adapters
- **Not testing**: Not testing adapters
- **Leaking details**: Leaking external details
- **Not translating**: Not translating data properly

## Related Concepts

- [[Application Architecture/hexagonal-architecture-adapters]] — Hexagonal Architecture Adapters
- [[Application Architecture/hexagonal-architecture-ports]] — Hexagonal Architecture Ports
- [[Design Patterns/adapter-pattern]] — Adapter Pattern
- [[Testing/test-doubles]] — Test Doubles

## Project Observations

The project uses Hexagonal Architecture Adapters through:
- REST API adapters (driving)
- Database repository adapters (driven)
- External service adapters
- Test double adapters

## Sources

- [[Sources/hexagonal-architecture-perez|Hexagonal Architecture — Alberto Perez]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Hexagonal Architecture Adapters Note**
