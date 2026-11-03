---
slug: composition-root
tags:
  - application-design   - architecture-patterns   - core-concepts

  - architecture   - application-design   - patterns
---

# Composition Root

> **Purpose:** Configure apps with Composition Root.
> **Last Updated:** 2026-11-03

## concept_id
`composition-root`

## title
Composition Root

## aliases
- Composition Root
- Dependency Injection Container
- DI Container
- IoC Container

## category
application-architecture

## concept_type
architecture-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Dependency injection
- Container configuration
- Object creation
- Application startup

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- seemann-dd
- martinfowler-patterns

## related_concept_ids
- composition-root
- dependency-injection-container
- di-container
- ioc-container

## Definition

Composition Root is a designated location in an application where dependency injection containers are configured and objects are composed together.

## Problem Addressed

Without Composition Root:
- Dependencies are scattered
- Configuration is unclear
- Object creation is inconsistent
- Testing is difficult

## Scope of Boundaries

Composition Root applies to:
- Dependency injection
- Container configuration
- Object creation
- Application startup

Composition Root does not apply to:
- Business logic
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing DI
- Wanting configuration
- Managing dependencies

## Tradeoffs and When to Avoid

- **Complexity**: Composition Root adds complexity
- **Not for simple apps**: Simple apps don't need Composition Root
- **Not for internal**: Internal apps may not need Composition Root
- **Not for all**: Not all apps need Composition Root

## Implementation Guidance

1. **Choose container**: Choose DI container
2. **Define registrations**: Define dependency registrations
3. **Configure**: Configure container
4. **Resolve**: Resolve dependencies
5. **Test**: Test composition

## Verification

- [ ] Container chosen
- [ ] Registrations defined
- [ ] Container configured
- [ ] Dependencies resolved
- [ ] Composition tested

## Common Misuses

- **Not choosing**: Not choosing a container
- **Not defining**: Not defining registrations
- **Not configuring**: Not configuring container
- **Not resolving**: Not resolving dependencies

## Related Concepts

- [[Application Architecture/composition-root]] â€” Composition Root
- [[Architecture/dependency-injection]] â€” Dependency Injection Container
- [[Architecture/dependency-injection]] â€” DI Container
- [[Architecture/dependency-injection]] â€” IoC Container

## Project Observations

The project uses Composition Root through:
- Container selection
- Registration definition
- Container configuration
- Dependency resolution

## Sources

- [[Sources/S019-seemann-dd|Dependency Injection by Mark Seemann]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Composition Root Note**
