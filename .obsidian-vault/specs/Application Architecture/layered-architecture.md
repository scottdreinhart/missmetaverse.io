---
slug: layered-architecture
tags:
  - application-design   - architecture-patterns   - core-concepts

  - architecture   - application-design   - patterns
---

# Layered Architecture

> **Purpose:** Structure apps with Layered Architecture.
> **Last Updated:** 2026-11-03

## concept_id
`layered-architecture`

## title
Layered Architecture

## aliases
- N-Tier Architecture
- Layered Design
- Presentation-Business-Data
- Tiered Architecture

## category
application-architecture

## concept_type
architectural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Traditional apps
- Clear separation
- Team organization
- Maintenance

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- enterprise-architecture

## related_concept_ids
- layered-architecture
- hexagonal-architecture
- clean-architecture
- Application Architecture/modular-monolith-architecture

## Definition

Layered Architecture structures applications into logical layers (presentation, business, data) with dependencies flowing in one direction.

## Problem Addressed

Without Layered Architecture:
- Code is unstructured
- Responsibilities are mixed
- Testing is difficult
- Maintenance is hard

## Scope of Boundaries

Layered Architecture applies to:
- Traditional apps
- Clear separation
- Team organization
- Maintenance

Layered Architecture does not apply to:
- Complex domains
- Hexagonal requirements
- Clean architecture needs
- Microservices

## When to Apply

- Building traditional apps
- Needing clear separation
- Organizing teams
- Simplifying maintenance

## Tradeoffs and When to Avoid

- **Anemic domain**: Layers can create anemic domain
- **Not for complex**: Complex domains need hexagonal
- **Testing difficulty**: Layers make testing harder
- **Not for modern**: Modern apps need hexagonal

## Implementation Guidance

1. **Define layers**: Define application layers
2. **Enforce dependencies**: Enforce one-way dependencies
3. **Implement layers**: Implement each layer
4. **Add interfaces**: Add layer interfaces
5. **Test layers**: Test layer boundaries

## Verification

- [ ] Layers defined
- [ ] Dependencies enforced
- [ ] Layers implemented
- [ ] Interfaces added
- [ ] Layers tested

## Common Misuses

- **Anemic domain**: Creating anemic domain layer
- **Tight coupling**: Creating tightly coupled layers
- **Not testing**: Not testing layer boundaries
- **God layer**: Creating god layer

## Related Concepts

- [[Application Architecture/layered-architecture]] â€” Layered Architecture
- [[Application Architecture/hexagonal-architecture]] â€” Hexagonal Architecture
- [[Application Architecture/clean-architecture-layers]] â€” Clean Architecture
- [[Application Architecture/Application Architecture/modular-monolith-architecture-architecture]] â€” Modular Monolith

## Project Observations

The project uses Layered Architecture through:
- Presentation layer (UI)
- Business layer (logic)
- Data layer (persistence)
- One-way dependencies

## Sources

- [[Sources/martinfowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/enterprise-architecture|Enterprise Architecture â€” TOGAF]]

**End of Layered Architecture Note**
