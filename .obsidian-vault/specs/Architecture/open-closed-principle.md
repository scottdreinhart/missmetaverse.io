---
slug: open-closed-principle
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# Open/Closed Principle

> **Purpose:** Software should be open for extension, closed for modification.
> **Last Updated:** 2026-11-03

## concept_id
`arch-open-closed`

## title
Open/Closed Principle

## aliases
- OCP
- Open/Closed Principle
- Extension over Modification

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Class design
- Interface design
- Plugin architectures
- Extension points

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
- arch-composition-over-inheritance
- arch-dependency-injection
- arch-strategy
- arch-facade

## Definition

The Open/Closed Principle states that software entities should be open for extension but closed for modification. New behavior should be added by creating new code, not by modifying existing code.

## Problem Addressed

Without OCP:
- Modifying existing code introduces bugs
- Existing tests may break
- New features require changing tested code
- Code becomes fragile

## Scope and Boundaries

OCP applies to:
- Class design
- Interface design
- Plugin architectures
- Extension points

OCP does not apply to:
- Bug fixes
- Performance improvements
- Documentation updates

## When to Apply

- Designing for extensibility
- Creating plugin architectures
- Building frameworks and libraries
- When new features are expected

## Tradeoffs and When to Avoid

- **Over-engineering**: Creating extension points too early
- **Complexity**: More abstractions mean more complexity
- **Not for simple cases**: Simple code doesn't need OCP
- **YAGNI**: Don't extend for hypothetical features

## Implementation Guidance

1. **Use abstraction**: Create interfaces or abstract classes
2. **Prefer composition**: Use composition over inheritance
3. **Add new code**: Extend by adding new classes
4. **Don't modify**: Avoid changing existing tested code
5. **Use strategies**: Strategy pattern for interchangeable behavior

## Verification

- [ ] New behavior is added by creating new code
- [ ] Existing code is not modified
- [ ] Abstractions are used for extension points
- [ ] Existing tests still pass

## Common Misuses

- **Modifying existing code**: Changing tested code introduces bugs
- **Over-engineering**: Creating extension points too early
- **Ignoring composition**: Using inheritance instead of composition
- **Hypothetical features**: Extending for features that may never exist

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/composition-over-inheritance]] â€” Composition over Inheritance
- [[Architecture/dependency-injection]] â€” Dependency Injection
- [[Design Patterns/strategy-pattern]] â€” Strategy Pattern

## Project Observations

The project uses TypeScript, which supports OCP through:
- Interfaces for extension points
- Strategy pattern for interchangeable behavior
- Composition over inheritance
- Plugin architectures

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994.md|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Open/Closed Principle Note**
