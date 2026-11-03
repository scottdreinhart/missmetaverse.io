---
slug: hexagonal-architecture
---

# Hexagonal Architecture

> **Purpose:** Implement hexagonal architecture with Hexagonal Architecture.
> **Last Updated:** 2026-11-03

## concept_id
`hexagonal-architecture`

## title
Hexagonal Architecture

## aliases
- Hexagonal Architecture
- Ports and Adapters
- Clean Architecture
- Dependency Architecture

## category
application-architecture

## concept_type
architecture-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Hexagonal architecture
- Ports and adapters
- Clean architecture
- Dependency management

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- hexagonal-architecture-guide
- martinfowler-patterns

## related_concept_ids
- hexagonal-architecture
- ports-and-adapters
- clean-architecture
- dependency-architecture

## Definition

Hexagonal Architecture (Ports and Adapters) is an architectural pattern that separates application logic from external systems using ports (interfaces) and adapters (implementations).

## Problem Addressed

Without Hexagonal Architecture:
- Logic is coupled
- Testing is difficult
- Changes are hard
- External systems are embedded

## Scope of Boundaries

Hexagonal Architecture applies to:
- Hexagonal architecture
- Ports and adapters
- Clean architecture
- Dependency management

Hexagonal Architecture does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing separation
- Wanting testability
- Managing dependencies

## Tradeoffs and When to Avoid

- **Complexity**: Hexagonal Architecture adds complexity
- **Not for simple apps**: Simple apps may not need Hexagonal Architecture
- **Not for internal**: Internal apps may not need Hexagonal Architecture
- **Not for all**: Not all apps need Hexagonal Architecture

## Implementation Guidance

1. **Define ports**: Define application ports
2. **Implement adapters**: Implement adapters
3. **Separate logic**: Separate application logic
4. **Test**: Test ports
5. **Verify**: Verify dependencies

## Verification

- [ ] Ports defined
- [ ] Adapters implemented
- [ ] Logic separated
- [ ] Ports tested
- [ ] Dependencies verified

## Common Misuses

- **Not defining**: Not defining ports
- **Not implementing**: Not implementing adapters
- **Not separating**: Not separating logic
- **Not testing**: Not testing ports

## Related Concepts

- [[Application Architecture/hexagonal-architecture]] â€” Hexagonal Architecture
- [[Application Architecture/ports-and-adapters]] â€” Ports and Adapters
- [[Application Architecture/clean-architecture]] â€” Clean Architecture
- [[Application Architecture/dependency-architecture]] â€” Dependency Architecture

## Project Observations

The project uses Hexagonal Architecture through:
- Port definition
- Adapter implementation
- Logic separation
- Port testing

## Sources

- [[Sources/hexagonal-architecture-guide|Hexagonal Architecture Guide]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Hexagonal Architecture Note**
