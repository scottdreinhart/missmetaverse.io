---
slug: design-by-contract
sources:
  - https://en.wikipedia.org/wiki/Design_by_contract
  - https://en.wikipedia.org/wiki/Contract_(software_development)
date: 2026-11-02
tags:












  - dbc
  - principles
  - design
  - preconditions
  - postconditions
  - invariants
---

# Design by Contract

## Definition

Design by Contract (DbC) is the principle that **classes and methods define formal, precise, and verifiable interface contracts** — preconditions (what must be true before), postconditions (what must be true after), and invariants (what must always be true).

> "Design by Contract is a software engineering approach that defines formal, precise, and verifiable interface contracts for software components." — Bertrand Meyer (1986)

## Problem Addressed

Without contracts:
- **Unexpected behavior**: Methods fail with unclear errors
- **Debugging difficulty**: Hard to find where invariants are violated
- **Testing difficulty**: Tests must cover all edge cases manually
- **Documentation gap**: Interfaces are unclear

## Scope and Boundaries

- DbC is about **formal specifications**, not just documentation
- Preconditions = caller's responsibility
- Postconditions = callee's responsibility
- Invariants = always true

## When to Apply

- When designing public APIs
- When critical invariants must be maintained
- When building libraries used by others
- When debugging complex state transitions

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Boilerplate** — Contracts add code |
| **Performance** — Runtime checks add overhead |
| **Maintenance** — Contracts must be updated with code |

## Common Misuses

- **Over-specification**: Contracting every method
- **False contracts**: Writing contracts that aren't enforced
- **Confusing with validation**: DbC is about interfaces, validation is about data

## Related Concepts

- **Input Validation** — DbC is a formal version of input validation
- **Type Systems** — TypeScript types are a form of contract
- **Fail Fast** — DbC enables fail-fast behavior

## Project Observations

- TypeScript's type system provides compile-time contracts
- Zod schemas (`*.schema.ts`) provide runtime contracts
- File naming conventions support DbC:
  - `*.schema.ts` — Define contracts
  - `*.policy.ts` — Define business rules (invariants)
- No evidence of DbC violations in existing code

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]



