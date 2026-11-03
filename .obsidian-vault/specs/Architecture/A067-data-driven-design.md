---
slug: data-driven-design
sources:
  - https://en.wikipedia.org/wiki/Data-driven_design
  - https://en.wikipedia.org/wiki/Configuration-driven_development
date: 2026-11-02
tags:











  - data-driven
  - configuration-driven
  - design
  - patterns
---

# Data-Driven Design

## Definition

Data-Driven Design is an **approach where the structure and behavior of a system are determined by data rather than hardcoded logic**.

> "Data-driven design separates data from logic, allowing the same logic to work with different data." — Software engineering principle

## Problem Addressed

Hardcoded logic leads to:
- **Inflexibility**: Changing behavior requires code changes
- **Duplication**: Similar logic repeated for different data
- **Testing difficulty**: Hard to test all variations
- **Maintenance**: More code to maintain

## Scope and Boundaries

- Data-Driven ≠ Configuration-Driven (data-driven is about data structure, config-driven is about configuration)
- Data-Driven ≠ Schema-Driven (data-driven is broader, schema-driven is about validation)
- Data-Driven is an **approach**, not a specific pattern

## When to Apply

- When building forms or UIs from data
- When building reporting systems
- When behavior varies by data
- When flexibility is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Data structures can be complex |
| **Performance** — Data-driven may be slower |
| **Type safety** — Hard to type data-driven code |

## Common Misuses

- **Everything data-driven**: Not everything should be data-driven
- **Confusing with config-driven**: Data-driven ≠ configuration-driven
- **Over-engineering**: Simple cases don't need data-driven

## Related Concepts

- [Configuration-Driven Development](Architecture/configuration-driven-development.md) — Complementary approach
- [Schema-Driven Development](Architecture/schema-driven-development.md) — Data validation
- [Declarative Programming](Architecture/declarative-programming.md) — Data-driven is declarative

## Project Observations

- The project uses data-driven patterns:
  - React components render from props (data)
  - Tailwind config drives styling (data-driven)
  - Zod schemas validate data (schema-driven)
- No evidence of hardcoded logic in existing configuration

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



