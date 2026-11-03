---
slug: encapsulation
---

# Encapsulation

> **Purpose:** Hide internal state and require interaction through methods.
> **Last Updated:** 2026-11-03

## concept_id
`arch-encapsulation`

## title
Encapsulation

## aliases
- Encapsulation
- Information Hiding
- Data Hiding

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Class design
- Module design
- API design
- Component design

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-solid-principles
- arch-information-hiding
- arch-single-responsibility
- arch-invariant-protection
- arch-pure-functions

## Definition

Encapsulation is the bundling of data and methods that operate on that data within a single unit, while hiding internal implementation details. Access is controlled through well-defined interfaces.

## Problem Addressed

Without encapsulation:
- Internal state can be modified unexpectedly
- Implementation changes break clients
- Invariants cannot be enforced
- Code is hard to maintain

## Scope and Boundaries

Encapsulation applies to:
- Class design
- Module design
- API design
- Component design

Encapsulation does not address:
- Access control (that's security)
- Data validation (that's business logic)
- Error handling (that's resilience)

## When to Apply

- Designing classes and modules
- Creating APIs
- Building components
- Refactoring exposed state

## Tradeoffs and When to Avoid

- **Over-encapsulation**: Too much hiding makes code hard to use
- **Performance overhead**: Accessors can add overhead
- **Not for data bags**: Simple data structures don't need encapsulation
- **Not for prototypes**: Prototypes don't need encapsulation

## Implementation Guidance

1. **Hide state**: Make fields private or readonly
2. **Provide accessors**: Create methods for controlled access
3. **Enforce invariants**: Validate state changes
4. **Expose interfaces**: Define clear interfaces
5. **Document behavior**: Document what methods do, not how

## Verification

- [ ] Internal state is hidden
- [ ] Access is controlled through methods
- [ ] Invariants are enforced
- [ ] Interfaces are well-defined

## Common Misuses

- **Over-encapsulation**: Too much hiding makes code hard to use
- **Public getters**: Exposing state through getters
- **Ignoring invariants**: Not validating state changes
- **Not documenting**: Not documenting behavior

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/information-hiding]] â€” Information Hiding
- [[Architecture/single-responsibility-principle]] â€” Single Responsibility Principle

## Project Observations

The project follows encapsulation through:
- Private fields in TypeScript classes
- Getter and setter methods
- Interface-based access
- Readonly properties

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Encapsulation Note**
