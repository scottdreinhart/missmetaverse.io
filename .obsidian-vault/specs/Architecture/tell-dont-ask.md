---
slug: tell-dont-ask
sources:
  - https://en.wikipedia.org/wiki/Principle_of_Least_Knowledge
  - https://www.artima.com/intv/bloch13.html
date: 2026-11-02
tags:
  - tell-dont-ask
  - principles
  - oop
  - demeter
---

# Tell, Don't Ask

## Definition

Tell, Don't Ask is the principle that **you should tell objects what to do, not ask them for their data and make decisions based on it**.

> "Tell, don't ask. Don't ask an object for its state and then make a decision based on that state. Tell the object what you want done, and let it decide how to do it." — Martin Fowler

## Problem Addressed

Asking leads to:
- **Logic leakage**: Business logic spread across multiple objects
- **Fragile code**: Decisions break when internal state changes
- **Violation of encapsulation**: External code depends on internal state
- **Testing difficulty**: Tests must understand internal state

## Scope and Boundaries

- Tell, Don't Ask is about **delegating behavior**, not just data access
- It's a practical application of the Law of Demeter
- It's not about never reading data — it's about not making decisions based on it

## When to Apply

- When writing code that checks an object's state and acts on it
- When designing object interfaces
- When refactoring logic that lives outside the relevant object
- When reviewing code for encapsulation violations

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Anemic domain model** — Putting all logic in the object can make it bloated |
| **Over-delegation** — Not all decisions belong in the object |
| **Testing difficulty** — Harder to test internal decision logic |

## Common Misuses

- **Anemic domain model**: Objects that only hold data, with all logic outside
- **God objects**: Putting too much logic in one object
- **Confusing with encapsulation**: Tell, Don't Ask is about behavior, encapsulation is about state

## Related Concepts

- **Law of Demeter** — Tell, Don't Ask is a practical application
- **Single Responsibility Principle** — Each object handles its own decisions
- **Encapsulation** — Tell, Don't Ask respects encapsulation

## Project Observations

- TypeScript's type system supports Tell, Don't Ask through explicit interfaces
- DDD patterns (entities, value objects) naturally support Tell, Don't Ask
- File naming conventions (`*.entity.ts`, `*.policy.ts`) encourage putting logic in the right place

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]
