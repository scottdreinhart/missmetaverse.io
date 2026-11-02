---
slug: use-case-driven-design-patterns
sources:
  - https://en.wikipedia.org/wiki/Use_case
  - https://www.oreilly.com/library/view/advanced-on-the/0201633530/
date: 2026-11-02
tags:
  - use-case
  - ddd
  - requirements
  - patterns
---

# Use Case Driven Design Patterns

## Definition

Use Case Driven Design Patterns are **design patterns for working with use case driven design**.

> "Use case driven design is a requirements-driven approach where software is designed around user goals and interactions." — Alistair Cockburn

## Problem Addressed

Without use case driven design patterns:
- **Misalignment**: Software doesn't meet user needs
- **Complexity**: Software is complex and hard to use
- **Testing**: Hard to test software
- **Maintenance**: Hard to maintain software

## Scope and Boundaries

- Use Case Driven Design Patterns ≠ Use Case Driven Design (use case driven design patterns are patterns, use case driven design is a requirements approach)
- Use Case Driven Design Patterns ≠ DDD (use case driven design patterns are patterns, DDD is a design approach)
- Use Case Driven Design Patterns is a **patterns**, not a requirements approach

## When to Apply

- When building applications
- when user needs matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Use case driven design patterns are complex |
| **Time** — Use case driven design patterns take time |
| **Over-use-case-driven-design** — Don't use use case driven design for everything |

## Common Misuses

- **Everything use case driven**: Not everything needs use case driven design patterns
- **Confusing with DDD**: Use case driven design patterns ≠ DDD
- **Over-use-case-driven-design**: Too many use case driven designs create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Use case driven design patterns with DDD
- [User Stories](Architecture/user-stories.md) — Use case driven design patterns with user stories
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Use case driven design patterns with SoC

## Project Observations

- The project uses use case driven design patterns:
  - The project's architecture patterns note covers use case driven design patterns (from existing notes)
  - No evidence of use case driven design patterns in existing code (src/ is empty)
- File naming conventions support use case driven design patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
