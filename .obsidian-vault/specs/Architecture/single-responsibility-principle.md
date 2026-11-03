---
slug: single-responsibility-principle
tags:
  - architecture   - design-patterns   - core-concepts
---

# Single Responsibility Principle

> **Purpose:** Foundation of SOLID â€” each module should have one reason to change.
> **Last Updated:** 2026-11-03

## concept_id
`arch-single-responsibility`

## title
Single Responsibility Principle

## aliases
- SRP
- Single Responsibility
- One Reason to Change

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
- Module design
- Function design
- Package design

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
- arch-dry
- arch-low-coupling

## Definition

The Single Responsibility Principle states that a class or module should have one, and only one, reason to change. A responsibility is defined as a reason for change, and each class should encapsulate that responsibility entirely.

## Problem Addressed

Without SRP:
- Classes become too large and complex
- Multiple responsibilities create coupling between unrelated features
- Changes to one responsibility risk breaking another
- Testing becomes difficult due to mixed concerns
- Code becomes hard to understand and maintain

## Scope and Boundaries

SRP applies to:
- Class design â€” each class should have one job
- Module design â€” each module should serve one purpose
- Function design â€” each function should do one thing

SRP does not mean:
- Classes must be small (size is not the goal)
- Every concept needs its own class
- Functions must be tiny

## When to Apply

- During class design and refactoring
- When a class has multiple reasons to change
- When a class handles multiple abstractions
- When testing a class requires mocking unrelated dependencies

## Tradeoffs and When to Avoid

- **Over-engineering risk**: Creating too many small classes can increase complexity
- **Navigation overhead**: Too many files can make code harder to navigate
- **Simple scripts**: Not every function needs SRP enforcement

## Implementation Guidance

1. Identify all reasons a class might change
2. If multiple reasons exist, extract responsibilities
3. Group related functionality together
4. Ensure each class has one clear purpose
5. Use composition to combine responsibilities

## Verification

- [ ] Each class has one clear purpose
- [ ] Changes to one feature don't affect unrelated features
- [ ] Testing a class doesn't require mocking unrelated dependencies
- [ ] Class name clearly describes its responsibility

## Common Misuses

- **Confusing with small classes**: SRP is about responsibilities, not size
- **Ignoring module-level SRP**: SRP applies to packages and modules too
- **Over-splitting**: Creating too many classes for simple concerns
- **Ignoring cohesion**: Related responsibilities should stay together

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/separation-of-concerns]] â€” Separation of Concerns
- [[Architecture/high-cohesion]] â€” High Cohesion
- [[Architecture/dry]] â€” DRY Principle

## Project Observations

The project uses TypeScript, which supports SRP through:
- Small, focused modules
- Clear separation of concerns in folder structure
- Type definitions in separate files
- Logic separated from presentation

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Single Responsibility Principle Note**
