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
# Data-Driven Design

## Definition

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Data-Driven Design is an **approach where the structure and behavior of a system are determined by data rather than hardcoded logic**.

> "Data-driven design separates data from logic, allowing the same logic to work with different data." â€” Software engineering principle

## Problem Addressed

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Hardcoded logic leads to:
- **Inflexibility**: Changing behavior requires code changes
- **Duplication**: Similar logic repeated for different data
- **Testing difficulty**: Hard to test all variations
- **Maintenance**: More code to maintain

## Scope and Boundaries

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Data-Driven â‰  Configuration-Driven (data-driven is about data structure, config-driven is about configuration)
- Data-Driven â‰  Schema-Driven (data-driven is broader, schema-driven is about validation)
- Data-Driven is an **approach**, not a specific pattern

## When to Apply

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building forms or UIs from data
- When building reporting systems
- When behavior varies by data
- When flexibility is important

## Tradeoffs and When to Avoid

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

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
| **Complexity** â€” Data structures can be complex |
| **Performance** â€” Data-driven may be slower |
| **Type safety** â€” Hard to type data-driven code |

## Common Misuses

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything data-driven**: Not everything should be data-driven
- **Confusing with config-driven**: Data-driven â‰  configuration-driven
- **Over-engineering**: Simple cases don't need data-driven

## Related Concepts

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Configuration-Driven Development](Architecture/configuration-driven-development.md) â€” Complementary approach
- [Schema-Driven Development](Architecture/schema-driven-development.md) â€” Data validation
- [Declarative Programming](Architecture/declarative-programming.md) â€” Data-driven is declarative

## Project Observations

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses data-driven patterns:
  - React components render from props (data)
  - Tailwind config drives styling (data-driven)
  - Zod schemas validate data (schema-driven)
- No evidence of hardcoded logic in existing configuration

## Sources

## concept_id
a067-data-driven-design

## title
Data-Driven Design

## aliases
- A067-data-driven-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



