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
---

# DRY (Don't Repeat Yourself)

## Definition

DRY states that **every piece of knowledge must have a single, unambiguous, authoritative representation within a system**. Duplication of knowledge, not duplication of code, is the target.

> "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system." — Kevin Sullivan (coined the term)

## Problem Addressed

Duplicated knowledge leads to:
- **Inconsistency**: Changes in one location are missed in others
- **Maintenance burden**: Fixing a bug requires finding all copies
- **Confusion**: Multiple implementations create uncertainty about which is correct

## Scope and Boundaries

- DRY targets **duplicated knowledge** (business rules, validation logic, formatting), not every repeated-looking expression
- Two code blocks that happen to look similar but express different knowledge are **not** a DRY violation
- DRY is about **abstraction**, not **minimization of characters**

## When to Apply

- When the same logic appears in multiple places
- When changing one copy requires changing others
- When business rules are expressed in multiple locations

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Over-abstraction** | Creating abstractions for one-off code adds complexity |
| **Coupling** | Shared code couples the places that use it |
| **Debugging difficulty** | Deep abstractions make tracing harder |

> **Rule of thumb**: Apply DRY when you have **three or more** instances. Two instances may be coincidental.

## Common Misuses

- **Thou Shalt Not Duplicate Code (TSNDC)**: Treating DRY as an absolute rule rather than a guideline
- **Premature abstraction**: Creating abstractions before duplication is proven
- **Confusing appearance with knowledge**: Two functions that look similar but serve different purposes are not DRY violations

## Related Concepts

- **Single Source of Truth** — Data-level DRY
- **Separation of Concerns** — Structural DRY
- **High Cohesion** — DRY within modules

## Project Observations

- The project uses TypeScript, which supports DRY through generics, utility types, and shared interfaces
- File naming conventions (`*.logic.ts`, `*.schema.ts`) support DRY by centralizing knowledge
- No evidence of DRY violations in existing code (src/ is empty)

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]
- [[Sources/martin-srp-2014|martin-srp-2014]]
