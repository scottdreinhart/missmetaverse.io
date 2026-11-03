---
slug: data-oriented-design
tags:
  - core-concepts

  - data-driven   - declarative   - architecture
---

# Data-Oriented Design

> **Purpose:** Optimize for data access patterns.
> **Last Updated:** 2026-11-03

## concept_id
`data-driven-data-oriented`

## title
Data-Oriented Design

## aliases
- Data-Oriented Design
- Data-Oriented Architecture
- Data-First Architecture

## category
data-driven-approaches

## concept_type
design-approach

## research_status
verified

## project_adoption
declared

## applicability
- Performance-critical systems
- Game development
- Data processing
- High-throughput systems

## tags
- type/approach
- domain/architecture
- status/verified
- priority/medium

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- data-driven-design
- data-driven-declarative
- data-driven-table-driven
- coding-small-cohesive-modules
- arch-high-cohesion

## Definition

Data-Oriented Design is an approach where software is designed around data structures and access patterns rather than around actions or objects. It optimizes for cache efficiency and data locality.

## Problem Addressed

Without data-oriented design:
- Cache misses are frequent
- Performance is poor
- Data access is scattered
- Systems don't scale

## Scope and Boundaries

Data-oriented design applies to:
- Performance-critical systems
- Game development
- Data processing
- High-throughput systems

Data-oriented design does not apply to:
- UI applications
- Business logic
- CRUD applications
- Web applications

## When to Apply

- Building performance-critical systems
- Developing games
- Processing large datasets
- Building high-throughput systems

## Tradeoffs and When to Avoid

- **Complexity**: Data-oriented design adds complexity
- **Not for UI**: UI applications don't need data-oriented design
- **Not for business logic**: Business logic doesn't need data-oriented design
- **Not for CRUD**: CRUD applications don't need data-oriented design

## Implementation Guidance

1. **Analyze access patterns**: Analyze how data is accessed
2. **Design data structures**: Design data structures for access patterns
3. **Optimize for cache**: Optimize for cache efficiency
4. **Minimize indirection**: Minimize pointer chasing
5. **Test performance**: Test performance with real data

## Verification

- [ ] Access patterns are analyzed
- [ ] Data structures are designed
- [ ] Cache efficiency is optimized
- [ ] Indirection is minimized
- [ ] Performance is tested

## Common Misuses

- **Not analyzing**: Not analyzing access patterns
- **Not designing**: Not designing data structures
- **Not optimizing**: Not optimizing for cache
- **Not testing**: Not testing performance

## Related Concepts

- [[Data-Driven Approaches/data-driven-design]] â€” Data-Driven Design
- [[Data-Driven Approaches/declarative-programming]] â€” Declarative Programming
- [[Data-Driven Approaches/table-driven-logic]] â€” Table-Driven Logic
- [[Coding Type Systems/small-cohesive-modules]] â€” Small Cohesive Modules

## Project Observations

The project follows data-oriented design through:
- Efficient data structures
- Cache-friendly access patterns
- Minimal indirection
- Performance testing

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Data-Oriented Design Note**
