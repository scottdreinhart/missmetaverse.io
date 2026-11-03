---
slug: dry-principle
sources:
  - https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
  - https://www.agilealliance.org/glossary/dry/
date: 2026-11-02
tags:
  - dry
  - principles
  - code-quality
  - maintainability
# DRY (Don't Repeat Yourself)

## Definition

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
DRY states that **every piece of knowledge must have a single, unambiguous, authoritative representation within a system**. Duplication of knowledge, not duplication of code, is the target.

> "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system." â€” Kevin Sullivan (coined the term)

## Problem Addressed

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Duplicated knowledge leads to:
- **Inconsistency**: Changes in one location are missed in others
- **Maintenance burden**: Fixing a bug requires finding all copies
- **Confusion**: Multiple implementations create uncertainty about which is correct

## Scope and Boundaries

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- DRY targets **duplicated knowledge** (business rules, validation logic, formatting), not every repeated-looking expression
- Two code blocks that happen to look similar but express different knowledge are **not** a DRY violation
- DRY is about **abstraction**, not **minimization of characters**

## When to Apply

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When the same logic appears in multiple places
- When changing one copy requires changing others
- When business rules are expressed in multiple locations

## Tradeoffs and When to Avoid

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Over-abstraction** | Creating abstractions for one-off code adds complexity |
| **Coupling** | Shared code couples the places that use it |
| **Debugging difficulty** | Deep abstractions make tracing harder |

> **Rule of thumb**: Apply DRY when you have **three or more** instances. Two instances may be coincidental.

## Common Misuses

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Thou Shalt Not Duplicate Code (TSNDC)**: Treating DRY as an absolute rule rather than a guideline
- **Premature abstraction**: Creating abstractions before duplication is proven
- **Confusing appearance with knowledge**: Two functions that look similar but serve different purposes are not DRY violations

## Related Concepts

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Single Source of Truth** â€” Data-level DRY
- **Separation of Concerns** â€” Structural DRY
- **High Cohesion** â€” DRY within modules

## Project Observations

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses TypeScript, which supports DRY through generics, utility types, and shared interfaces
- File naming conventions (`*.logic.ts`, `*.schema.ts`) support DRY by centralizing knowledge
- No evidence of DRY violations in existing code (src/ is empty)

## Sources

## concept_id
a088-dry-principle

## title
DRY (Don't Repeat Yourself)

## aliases
- A088-dry-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




