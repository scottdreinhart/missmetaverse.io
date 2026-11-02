---
slug: command-query-separation
sources:
  - https://en.wikipedia.org/wiki/Command%E2%80%93query_separation
  - https://en.wikipedia.org/wiki/CQRS
date: 2026-11-02
tags:
  - cqs
  - cqrs
  - principles
  - design
---

# Command-Query Separation (CQS)

## Definition

Command-Query Separation is the principle that **methods should either do something (command) or return something (query), not both**. A method should not have side effects when it is a query, and a command should not return meaningful data.

> "Every method should either do something or answer something, but not both." — Bertrand Meyer (1988)

## Problem Addressed

Violating CQS leads to:
- **Unpredictable code**: Calling a method for its return value may have hidden side effects
- **Testing difficulty**: Hard to test without triggering side effects
- **Caching problems**: Can't cache query results if they have side effects
- **Reasoning difficulty**: Hard to understand what a method does

## Scope and Boundaries

- CQS is about **method behavior**, not about architecture
- CQS ≠ CQRS (CQRS is an architectural pattern that extends CQS)
- CQS is a guideline, not an absolute rule (some methods need both)

## When to Apply

- When designing method interfaces
- When refactoring methods with side effects and return values
- When designing APIs
- When reviewing code for hidden side effects

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **More methods** — Separating commands and queries increases method count |
| **Boilerplate** — Extra methods for what could be one |
| **Performance** — Separate calls may be less efficient |

## Common Misuses

- **Confusing with CQRS**: CQS is a method-level principle, CQRS is an architectural pattern
- **Over-applying**: Not all methods need strict CQS
- **Ignoring return values**: Commands can return status codes

## Related Concepts

- **CQRS** — Architectural extension of CQS
- **Pure Functions** — Functions that only query (no side effects)
- **Side Effects** — CQS prevents hidden side effects

## Project Observations

- TypeScript's type system supports CQS through explicit return types
- File naming conventions support CQS:
  - `*.logic.ts` — Business logic (commands)
  - `*.data.ts` — Data access (queries)
- No evidence of CQS violations in existing code

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]
