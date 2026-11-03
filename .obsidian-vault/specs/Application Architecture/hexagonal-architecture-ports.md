---
slug: hexagonal-architecture-ports
---

# Hexagonal Architecture Ports

> **Purpose:** Define ports in Hexagonal Architecture.
> **Last Updated:** 2026-11-03

## concept_id
`hexagonal-architecture-ports`

## title
Hexagonal Architecture Ports

## aliases
- Ports
- Driving Ports
- Driven Ports
- Primary Ports
- Secondary Ports

## category
application-architecture

## concept_type
architectural-concept

## research_status
verified

## project_adoption
declared

## applicability
- Port definition
- Interface design
- Dependency inversion
- Testability

## tags
- type/concept
- domain/architecture
- status/verified
- priority/high

## source_ids
- hexagonal-architecture-perez
- martinfowler-patterns

## related_concept_ids
- hexagonal-architecture-ports
- hexagonal-architecture-adapters
- dependency-inversion
- port-pattern

## Definition

Hexagonal Architecture Ports are interfaces that define how the application interacts with external systems, divided into driving ports (incoming) and driven ports (outgoing).

## Problem Addressed

Without Ports:
- Dependencies are coupled
- Testing is difficult
- External systems are hardcoded
- Architecture is unclear

## Scope of Boundaries

Ports apply to:
- Port definition
- Interface design
- Dependency inversion
- Testability

Ports do not apply to:
- Business logic
- Data modeling
- UI rendering
- Database design

## When to Apply

- Defining application boundaries
- Designing interfaces
- Inverting dependencies
- Enabling testing

## Tradeoffs and When to Avoid

- **Complexity**: Ports add complexity
- **Not for simple apps**: Simple apps don't need ports
- **Not for monoliths**: Monoliths may not need ports
- **Not for quick projects**: Quick projects don't need ports

## Implementation Guidance

1. **Define driving ports**: Define driving port interfaces
2. **Define driven ports**: Define driven port interfaces
3. **Implement adapters**: Implement adapters for ports
4. **Wire ports**: Wire ports in composition root
5. **Test ports**: Test port implementations

## Verification

- [ ] Driving ports defined
- [ ] Driven ports defined
- [ ] Adapters implemented
- [ ] Ports wired
- [ ] Ports tested

## Common Misuses

- **Leaking details**: Leaking external details into ports
- **Not testing**: Not testing port implementations
- **Tight coupling**: Creating tightly coupled ports
- **God ports**: Creating god port interfaces

## Related Concepts

- [[Application Architecture/hexagonal-architecture-ports]] â€” Hexagonal Architecture Ports
- [[Application Architecture/hexagonal-architecture-adapters]] â€” Hexagonal Architecture Adapters
- [[Architecture/dependency-inversion]] â€” Dependency Inversion
- [[Design Patterns/port-pattern]] â€” Port Pattern

## Project Observations

The project uses Hexagonal Architecture Ports through:
- Driving port interfaces (APIs, CLI)
- Driven port interfaces (Repositories, Services)
- Adapter implementations
- Port wiring in composition root

## Sources

- [[Sources/hexagonal-architecture-perez|Hexagonal Architecture â€” Alberto Perez]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Hexagonal Architecture Ports Note**
