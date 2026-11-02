---
slug: use-case-driven-design
sources:
  - https://en.wikipedia.org/wiki/Use_case
  - https://www.oreilly.com/library/view/advanced-on-the/0201633530/
date: 2026-11-02
tags:
  - use-case
  - ddd
  - requirements
  - design
---

# Use Case Driven Design

## Definition

Use Case Driven Design is a **requirements-driven approach where software is designed around user goals and interactions**.

> "Use case driven design is a requirements-driven approach where software is designed around user goals and interactions." — Alistair Cockburn

## Problem Addressed

Without use case driven design:
- **Misalignment**: Software doesn't meet user needs
- **Complexity**: Software is complex and hard to use
- **Testing**: Hard to test software
- **Maintenance**: Hard to maintain software

## Scope and Boundaries

- Use Case Driven Design ≠ DDD (use case driven design is requirements-driven, DDD is domain-driven)
- Use Case Driven Design ≠ User Stories (use case driven design is broader, user stories are specific)
- Use Case Driven Design is a **requirements approach**, not a design pattern

## When to Apply

- When building applications
- When user needs matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Use case driven design is complex |
| **Time** — Use case driven design takes time |
| **Over-use-case** — Don't use case everything |

## Common Misuses

- **Everything use case**: Not everything needs use case driven design
- **Confusing with DDD**: Use case driven design ≠ DDD
- **Over-use-case**: Too many use cases create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Use case driven design with DDD
- [User Stories](Architecture/user-stories.md) — Use case driven design with user stories
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Use case driven design with SoC

## Project Observations

- The project uses use case driven design:
  - The project's architecture patterns note covers use case driven design (from existing notes)
  - No evidence of use case driven design in existing code (src/ is empty)
- File naming conventions support use case driven design:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

