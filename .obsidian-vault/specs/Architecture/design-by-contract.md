---
slug: design-by-contract
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# Design by Contract

> **Purpose:** Define formal contracts for method interactions.
> **Last Updated:** 2026-11-03

## concept_id
`arch-design-by-contract`

## title
Design by Contract

## aliases
- DbC
- Design by Contract
- Contract Programming

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Method design
- API design
- Service design
- Domain modeling

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/medium

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-fail-fast
- arch-explicit-error-modeling
- arch-input-validation
- arch-boundary-validation
- arch-pure-functions

## Definition

Design by Contract is a principle where methods define formal contracts with preconditions (what must be true before calling), postconditions (what will be true after calling), and invariants (what must always be true).

## Problem Addressed

Without Design by Contract:
- Method requirements are unclear
- Errors are discovered late
- Documentation is incomplete
- Testing is difficult

## Scope and Boundaries

DbC applies to:
- Method design
- API design
- Service design
- Domain modeling

DbC does not apply to:
- UI implementation
- Infrastructure code
- Configuration
- Logging

## When to Apply

- Designing public APIs
- Creating service interfaces
- Building domain models
- Critical business logic

## Tradeoffs and When to Avoid

- **Overhead**: Checking contracts adds overhead
- **Complexity**: Contracts can be complex to define
- **Not for internal code**: Internal code may not need contracts
- **Not for prototypes**: Prototypes don't need contracts

## Implementation Guidance

1. **Define preconditions**: Specify what must be true before calling
2. **Define postconditions**: Specify what will be true after calling
3. **Define invariants**: Specify what must always be true
4. **Check contracts**: Validate contracts at runtime
5. **Document contracts**: Document contracts clearly

## Verification

- [ ] Preconditions are defined
- [ ] Postconditions are defined
- [ ] Invariants are defined
- [ ] Contracts are checked
- [ ] Contracts are documented

## Common Misuses

- **Over-constraining**: Too many contracts make code rigid
- **Ignoring postconditions**: Not checking what methods return
- **Not documenting**: Not documenting contracts
- **Not checking**: Not validating contracts at runtime

## Related Concepts

- [[Architecture/fail-fast]] â€” Fail Fast
- [[Coding Type Systems/explicit-error-modeling]] â€” Explicit Error Modeling
- [[Security/input-validation]] â€” Input Validation
- [[Coding Type Systems/boundary-validation]] â€” Boundary Validation

## Project Observations

The project follows Design by Contract through:
- TypeScript type system
- Zod schema validation
- Runtime type checking
- Clear API documentation

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Design by Contract Note**
