---
slug: table-driven-logic
sources:
  - https://go.dev/blog/table-driven-tests
  - https://en.wikipedia.org/wiki/Table-driven_testing
date: 2026-11-02
tags:
  - table-driven
  - testing
  - logic
  - data-driven
  - --
# Table-Driven Logic

## Definition

Table-Driven Logic is **a design approach where business logic is implemented by looking up values or behaviors in a table rather than using conditional statements**.

> "Table-driven logic replaces conditional statements with table lookups, making code more maintainable and testable." â€” Wikipedia

## Problem Addressed

Without table-driven logic:
- **Complex conditionals**: Complex if/else or switch statements
- **Duplication**: Same logic repeated in multiple places
- **Testing difficulty**: Hard to test all branches
- **Maintenance**: Adding new cases requires modifying code

## Scope and Boundaries

- Table-Driven Logic â‰  Configuration (table-driven logic is code-based, configuration is external)
- Table-Driven Logic = Simplicity (table-driven logic simplifies complex conditionals)
- Table-Driven Logic is a **coding technique**, not a pattern

## When to Apply

- When implementing complex conditional logic
- when testing all branches is important
- when adding new cases frequently
- when logic is data-driven

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Tables add indirection |
| **Time** â€” Setting up tables takes time |
| **Over-table** â€” Simple conditionals don't need tables |

## Common Misuses

- **Everything table-driven**: Not every conditional needs a table
- **Over-engineering**: Simple if/else doesn't need a table
- **Confusing with configuration**: Table-driven logic is code-based, configuration is external

## Related Concepts

- [Data-Driven Design](Data-Driven Approaches/data-driven-design.md) â€” Data-driven design is related to table-driven logic
- [Schema-Driven Development](Data-Driven Approaches/schema-driven-development.md) â€” Schema-driven development can use table-driven logic
- [Declarative Programming](Data-Driven Approaches/declarative-programming.md) â€” Declarative programming is related to table-driven logic

## Project Observations

- The project uses table-driven logic:
  - TypeScript supports table-driven logic through objects and arrays
  - The project's architecture patterns note covers coding techniques
  - No evidence of table-driven logic in existing code (src/ is empty)
- File naming conventions support table-driven logic:
  - `*.logic.ts` â€” Logic files
  - `*.data.ts` â€” Data files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]



