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
# Design by Contract

## Definition

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Design by Contract (DbC) is the principle that **classes and methods define formal, precise, and verifiable interface contracts** â€” preconditions (what must be true before), postconditions (what must be true after), and invariants (what must always be true).

> "Design by Contract is a software engineering approach that defines formal, precise, and verifiable interface contracts for software components." â€” Bertrand Meyer (1986)

## Problem Addressed

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without contracts:
- **Unexpected behavior**: Methods fail with unclear errors
- **Debugging difficulty**: Hard to find where invariants are violated
- **Testing difficulty**: Tests must cover all edge cases manually
- **Documentation gap**: Interfaces are unclear

## Scope and Boundaries

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- DbC is about **formal specifications**, not just documentation
- Preconditions = caller's responsibility
- Postconditions = callee's responsibility
- Invariants = always true

## When to Apply

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When designing public APIs
- When critical invariants must be maintained
- When building libraries used by others
- When debugging complex state transitions

## Tradeoffs and When to Avoid

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

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
| **Boilerplate** â€” Contracts add code |
| **Performance** â€” Runtime checks add overhead |
| **Maintenance** â€” Contracts must be updated with code |

## Common Misuses

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Over-specification**: Contracting every method
- **False contracts**: Writing contracts that aren't enforced
- **Confusing with validation**: DbC is about interfaces, validation is about data

## Related Concepts

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Input Validation** â€” DbC is a formal version of input validation
- **Type Systems** â€” TypeScript types are a form of contract
- **Fail Fast** â€” DbC enables fail-fast behavior

## Project Observations

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- TypeScript's type system provides compile-time contracts
- Zod schemas (`*.schema.ts`) provide runtime contracts
- File naming conventions support DbC:
  - `*.schema.ts` â€” Define contracts
  - `*.policy.ts` â€” Define business rules (invariants)
- No evidence of DbC violations in existing code

## Sources

## concept_id
a082-design-by-contract

## title
Design by Contract

## aliases
- A082-design-by-contract

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]



