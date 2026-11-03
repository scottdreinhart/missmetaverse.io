---
slug: vertical-slice-architecture
tags:
  - application-design   - architecture-patterns   - core-concepts

  - architecture   - application-design   - patterns
---

# Vertical Slice Architecture

> **Purpose:** Structure apps with Vertical Slice Architecture.
> **Last Updated:** 2026-11-03

## concept_id
`vertical-slice-architecture`

## title
Vertical Slice Architecture

## aliases
- Vertical Slice Architecture
- Vertical Slices
- Feature-Based Architecture

## category
application-architecture

## concept_type
architecture-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Feature-based organization
- Cross-cutting concerns
- Independent deployment
- Team autonomy

## tags
- type/pattern
- domain/architecture
- status/verified
- priority/high

## source_ids
- bogard-vertical-slice
- martinfowler-patterns

## related_concept_ids
- vertical-slice-architecture
- Application Architecture/modular-monolith-architecture
- feature-based-architecture
- cross-cutting-concerns

## Definition

Vertical Slice Architecture structures an application as a collection of vertical slices, where each slice contains all the layers needed to implement a specific feature or capability.

## Problem Addressed

Without Vertical Slice Architecture:
- Features span multiple layers
- Changes require touching many files
- Teams work on same files
- Coupling is high

## Scope of Boundaries

Vertical Slice Architecture applies to:
- Feature-based organization
- Cross-cutting concerns
- Independent deployment
- Team autonomy

Vertical Slice Architecture does not apply to:
- Shared infrastructure
- Domain models
- Business rules
- Data access

## When to Apply

- Building apps
- Needing feature isolation
- Wanting independent deployment
- Multiple teams

## Tradeoffs and When to Avoid

- **Duplication**: Vertical slices may duplicate code
- **Not for simple apps**: Simple apps don't need Vertical Slice Architecture
- **Not for internal**: Internal apps may not need Vertical Slice Architecture
- **Not for all**: Not all apps need Vertical Slice Architecture

## Implementation Guidance

1. **Identify features**: Identify application features
2. **Create slices**: Create vertical slices for each feature
3. **Organize layers**: Organize layers within slices
4. **Share code**: Share common code
5. **Test**: Test slices

## Verification

- [ ] Features identified
- [ ] Slices created
- [ ] Layers organized
- [ ] Code shared
- [ ] Slices tested

## Common Misuses

- **Not identifying**: Not identifying features
- **Not creating**: Not creating slices
- **Not organizing**: Not organizing layers
- **Not sharing**: Not sharing common code

## Related Concepts

- [[Application Architecture/vertical-slice-architecture]] â€” Vertical Slice Architecture
- [[Application Architecture/modular-monolith-architecture]] â€” Modular Monolith
- [[Application Architecture/Application Architecture/modular-monolith-architecture-architecture-architecture]] â€” Feature-Based Architecture
- [[Application Architecture/cross-cutting-concerns]] â€” Cross-Cutting Concerns

## Project Observations

The project uses Vertical Slice Architecture through:
- Feature identification
- Slice creation
- Layer organization
- Code sharing

## Sources

- [[Sources/bogard-vertical-slice|Vertical Slice Architecture by Scott Bogard]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Vertical Slice Architecture Note**
