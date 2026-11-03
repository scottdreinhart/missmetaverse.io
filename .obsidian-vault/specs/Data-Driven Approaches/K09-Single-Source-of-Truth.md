---
slug: k09-single-source-of-truth
sources:
  - https://en.wikipedia.org/wiki/Single_source_of_truth
  - https://martinfowler.com/bliki/SingleSourceOfTruth.html
date: 2026-11-02
tags:
  - single-source-of-truth
  - data-modeling
  - consistency
  - architecture
# Single Source of Truth

## Definition

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
Single Source of Truth is **an architecture principle that states that every piece of knowledge must have a single, unambiguous, authoritative representation within a system**.

> "A single source of truth is a unique, authoritative source of data for a given data domain." â€” Martin Fowler

## Problem Addressed

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
Without single source of truth:
- **Inconsistency**: Same data stored in multiple places with different values
- **Confusion**: Don't know which data is correct
- **Updates**: Updating one copy but not others
- **Trust**: Can't trust any data

## Scope and Boundaries

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- Single Source of Truth â‰  Database (single source of truth is a principle, database is a tool)
- Single Source of Truth = Consistency (single source of truth ensures consistency)
- Single Source of Truth is an **architecture principle**, not a pattern

## When to Apply

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- When building systems with multiple data sources
- when data consistency is critical
- when multiple components access the same data
- when data conflicts occur

## Tradeoffs and When to Avoid

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Single source of truth requires careful design |
| **Time** â€” Establishing single source of truth takes time |
| **Bottleneck** â€” Single source can become a bottleneck |

## Common Misuses

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- **Everything single source**: Not every piece of data needs a single source
- **Ignoring caching**: Caching is not a separate source of truth
- **Confusing with database**: Single source of truth is a principle, database is a tool

## Related Concepts

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- [Data-Driven Design](Data-Driven Approaches/data-driven-design.md) â€” Data-driven design relies on single source of truth
- [Immutable Data](Architecture/immutable-data.md) â€” Immutable data supports single source of truth
- [Caching Strategies](Data Databases/caching-strategies.md) â€” Caching strategies must respect single source of truth

## Project Observations

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- The project uses single source of truth:
  - TypeScript supports single source of truth through type system
  - The project's architecture patterns note covers architecture principles
  - No evidence of single source of truth in existing code (src/ is empty)
- File naming conventions support single source of truth:
  - `*.data.ts` â€” Data files
  - `*.types.ts` â€” Type files

## Sources

## concept_id
k09-single-source-of-truth

## title
Single Source of Truth

## aliases
- K09-Single-Source-of-Truth

## category
architecture

## concept_type
design-approach

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]



