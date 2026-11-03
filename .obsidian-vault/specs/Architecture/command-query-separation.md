# Command-Query Separation

> **Purpose:** Methods should either do something or return something, not both.
> **Last Updated:** 2026-11-03

---

## concept_id
`arch-command-query-separation`

## title
Command-Query Separation

## aliases
- CQS
- Command-Query Separation
- Command-Query Separation Principle

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
- arch-pure-functions
- arch-immutability
- arch-explicit-error-modeling
- arch-fail-fast
- arch-single-responsibility

---

## Definition

Command-Query Separation states that methods should either change state (command) or return information (query), but not both. This makes code more predictable and easier to understand.

## Problem Addressed

Without CQS:
- Methods have unexpected side effects
- Code is harder to reason about
- Testing is more difficult
- Debugging is harder

## Scope and Boundaries

CQS applies to:
- Method design
- API design
- Service design
- Domain modeling

CQS does not apply to:
- Methods that need to return status and change state
- Logging methods
- Caching methods

## When to Apply

- Designing methods
- Creating APIs
- Refactoring methods with side effects
- Building services

## Tradeoffs and When to Avoid

- **Methods that need both**: Some methods need to return status and change state
- **Logging methods**: Logging methods often return status
- **Caching methods**: Caching methods often return cached value
- **Over-restriction**: Not all methods should follow CQS

## Implementation Guidance

1. **Separate commands and queries**: Methods should do one or the other
2. **Use void for commands**: Commands should return void
3. **Use return values for queries**: Queries should return values
4. **Document exceptions**: Document when a method breaks CQS
5. **Test separately**: Test commands and queries separately

## Verification

- [ ] Commands return void
- [ ] Queries have no side effects
- [ ] Methods do one or the other
- [ ] Exceptions are documented

## Common Misuses

- **Ignoring CQS**: Methods that both change state and return values
- **Over-restriction**: Not all methods should follow CQS
- **Not documenting**: Not documenting when a method breaks CQS
- **Ignoring logging**: Logging methods often return status

## Related Concepts

- [[Coding Type Systems/pure-functions]] — Pure Functions
- [[Coding Type Systems/immutability]] — Immutability
- [[Coding Type Systems/explicit-error-modeling]] — Explicit Error Modeling

## Project Observations

The project follows CQS through:
- Clear separation of commands and queries
- Void return types for commands
- Return values for queries
- Pure functions for queries

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of Command-Query Separation Note**
