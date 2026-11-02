---
slug: use-case-ddd
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/UseCase.html
date: 2026-11-02
tags:
  - ddd
  - use-case
  - domain-modeling
  - requirements
---

# Use Case

## Definition

Use Case is **a description of how a user interacts with a system to achieve a goal, capturing the system's behavior from the user's perspective**.

> "A use case describes a sequence of interactions between an actor and a system that produces a result of value to the actor." — Alistair Cockburn

## Problem Addressed

Without use cases:
- **Unclear requirements**: System behavior is not well defined
- **Missing scenarios**: Edge cases are not considered
- **Testing issues**: Hard to test system behavior
- **Communication**: Developers and stakeholders don't share understanding

## Scope and Boundaries

- Use Case ≠ User Story (use case is detailed and formal, user story is informal and brief)
- Use Case = Requirements (use cases capture system requirements)
- Use Case is a **requirements artifact**, not a code pattern

## When to Apply

- When gathering requirements
- when system behavior needs to be documented
- when testing scenarios need to be defined
- when communication between stakeholders and developers is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Effort** — Writing use cases takes effort |
| **Time** — Detailed use cases take time to create |
| **Over-documentation** — Don't write use cases for simple systems |

## Common Misuses

- **Every feature a use case**: Not every feature needs a detailed use case
- **Ignoring edge cases**: Use cases should cover edge cases, not happy paths
- **Confusing with user story**: Use cases are detailed, user stories are brief

## Related Concepts

- [Application Service](DDD/application-service.md) — Application services often implement use cases
- [Domain Service](DDD/domain-service.md) — Domain services support use cases
- [Event Sourcing](Data Databases/event-sourcing.md) — Use cases can be implemented with event sourcing

## Project Observations

- The project uses use cases:
  - TypeScript files can serve as use case implementations
  - The project's architecture patterns note covers DDD concepts
  - No evidence of use cases in existing code (src/ is empty)
- File naming conventions support use cases:
  - `*.use-case.ts` — Use case files
  - `*.logic.ts` — Logic files

## Sources

- [[Sources/evans-ddd-ddd-2003|evans-ddd-ddd-2003]]
- [[Sources/fowler-ddd-ddd-2003|fowler-ddd-ddd-2003]]
