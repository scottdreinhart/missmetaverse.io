---
slug: dry
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# DRY Principle

> **Purpose:** Eliminate duplicated knowledge, not just duplicated code.
> **Last Updated:** 2026-11-03

## concept_id
`arch-dry`

## title
DRY Principle

## aliases
- DRY
- Don't Repeat Yourself
- Single Abstraction

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Code refactoring
- Documentation
- Configuration
- Test data

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-solid-principles
- arch-separation-of-concerns
- arch-high-cohesion
- arch-single-responsibility
- arch-composition-over-inheritance

## Definition

The DRY principle states that every piece of knowledge must have a single, unambiguous, authoritative representation within a system. The goal is to eliminate duplication of **knowledge**, not just duplication of code.

## Problem Addressed

Without DRY:
- Changes require updating multiple locations
- Inconsistencies arise when some locations are missed
- Maintenance becomes error-prone
- Understanding the system requires knowing all duplicated locations

## Scope and Boundaries

DRY applies to:
- Code logic and algorithms
- Business rules and constraints
- Configuration and settings
- Documentation and comments
- Test data and fixtures

DRY does not mean:
- Every repeated-looking expression must be abstracted
- Code must be maximally reusable
- Duplication is always bad (sometimes it's acceptable for now)

## When to Apply

- When the same logic appears in multiple places
- When changing one instance requires changing others
- When documentation describes the same concept multiple times
- When configuration values are repeated

## Tradeoffs and When to Avoid

- **Over-abstraction**: Creating abstractions too early can increase complexity
- **Hidden coupling**: Abstracting unrelated code can create fragile dependencies
- **Performance overhead**: Indirection can have minor performance costs
- **YAGNI**: Don't abstract until you see the need

## Implementation Guidance

1. Identify duplicated knowledge
2. Extract the knowledge into a single location
3. Ensure all references point to the single location
4. Verify that changes to the single location propagate correctly
5. Avoid abstracting unrelated code

## Verification

- [ ] Same logic appears in only one place
- [ ] Changes to logic require only one update
- [ ] Documentation describes each concept once
- [ ] Configuration values are centralized

## Common Misuses

- **Confusing with code duplication**: DRY targets knowledge, not just code patterns
- **Over-abstraction**: Creating abstractions for unrelated code
- **Ignoring context**: Abstracting code that happens to look similar but has different meaning
- **Premature abstraction**: Abstracting before the need is clear

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/separation-of-concerns]] â€” Separation of Concerns
- [[Architecture/high-cohesion]] â€” High Cohesion
- [[Architecture/single-responsibility-principle]] â€” Single Responsibility Principle

## Project Observations

The project uses TypeScript, which supports DRY through:
- Shared utility functions
- Type definitions in centralized files
- Configuration in single source files
- Reusable components and hooks

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of DRY Principle Note**
