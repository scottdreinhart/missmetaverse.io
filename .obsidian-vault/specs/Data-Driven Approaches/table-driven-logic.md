---
slug: table-driven-logic
tags:
  - data-driven   - declarative   - architecture
---

# Table-Driven Logic

> **Purpose:** Use tables to drive behavior instead of conditionals.
> **Last Updated:** 2026-11-03

## concept_id
`data-driven-table-driven`

## title
Table-Driven Logic

## aliases
- Table-Driven Logic
- Table-Driven Testing
- Data-Driven Logic

## category
data-driven-approaches

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- Test cases
- Configuration
- Rule engines
- State machines

## tags
- type/practice
- domain/coding
- status/verified
- priority/medium

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- data-driven-design
- data-driven-declarative
- data-driven-configuration-driven
- coding-pure-functions
- coding-table-driven-logic

## Definition

Table-Driven Logic is a practice where behavior is driven by data tables rather than conditional statements. This makes code more maintainable and testable.

## Problem Addressed

Without table-driven logic:
- Code has many conditionals
- Adding cases requires code changes
- Testing is difficult
- Code is hard to maintain

## Scope and Boundaries

Table-driven logic applies to:
- Test cases
- Configuration
- Rule engines
- State machines

Table-driven logic does not apply to:
- Complex algorithms
- Performance-critical code
- Real-time systems
- UI implementation

## When to Apply

- Writing test cases
- Implementing rule engines
- Configuring behavior
- Implementing state machines

## Tradeoffs and When to Avoid

- **Not for complex logic**: Complex logic may not fit in tables
- **Performance**: Table lookups can be slower
- **Not for performance**: Performance-critical code should not use tables
- **Not for real-time**: Real-time systems should not use tables

## Implementation Guidance

1. **Define table**: Define data table
2. **Drive behavior**: Let table drive behavior
3. **Test table**: Test with different table data
4. **Document table**: Document table structure
5. **Maintain table**: Keep table up to date

## Verification

- [ ] Table is defined
- [ ] Behavior is driven by table
- [ ] Table is tested
- [ ] Table is documented
- [ ] Table is maintained

## Common Misuses

- **Not defining table**: Not defining data tables
- **Not testing**: Not testing with different data
- **Not documenting**: Not documenting table structure
- **Not maintaining**: Not keeping table up to date

## Related Concepts

- [[Data-Driven Approaches/data-driven-design]] â€” Data-Driven Design
- [[Data-Driven Approaches/declarative-programming]] â€” Declarative Programming
- [[Data-Driven Approaches/configuration-driven-development]] â€” Configuration-Driven Development
- [[Coding Type Systems/pure-functions]] â€” Pure Functions

## Project Observations

The project follows table-driven logic through:
- Test case tables
- Configuration tables
- Rule tables
- State tables

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Table-Driven Logic Note**
