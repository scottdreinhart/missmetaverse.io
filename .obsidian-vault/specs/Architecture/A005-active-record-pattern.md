---
slug: active-record-pattern
sources:
  - https://martinfowler.com/eaaDev/activeRecord.html
  - https://en.wikipedia.org/wiki/Active_record_pattern
date: 2026-11-02
tags:
  - active-record-pattern
  - enterprise-patterns
  - patterns
  - architecture
# Active Record Pattern

## Definition

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Active Record Pattern is a **design pattern that encapsulates database access and business logic in a single object**.

> "The Active Record pattern encapsulates database access and business logic in a single object." â€” Martin Fowler

## Problem Addressed

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without active record pattern:
- **Complexity**: Database access is complex
- **Coupling**: Database access is coupled to business logic
- **Testing**: Hard to test database access
- **Maintenance**: Hard to maintain database access

## Scope and Boundaries

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Active Record Pattern â‰  ORM (active record pattern is a pattern, ORM is a tool)
- Active Record Pattern â‰  Data Mapper (active record pattern combines database access and business logic, data mapper separates them)
- Active Record Pattern is a **design pattern**, not a database pattern

## When to Apply

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when database access matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

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
| **Complexity** â€” Active record pattern is complex |
| **Time** â€” Active record pattern takes time |
| **Over-active-record** â€” Don't use active record for everything |

## Common Misuses

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything active record**: Not everything needs active record pattern
- **Confusing with ORM**: Active record pattern â‰  ORM
- **Over-active-record**: Too many active records create complexity

## Related Concepts

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Active record pattern with DDD
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) â€” Active record pattern with data mapper
- [Repository Pattern](Architecture/repository-pattern-ddd.md) â€” Active record pattern with repository

## Project Observations

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses active record pattern:
  - The project's architecture patterns note covers active record pattern (from existing notes)
  - No evidence of active record pattern in existing code (src/ is empty)
- File naming conventions support active record pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a005-active-record-pattern

## title
Active Record Pattern

## aliases
- A005-active-record-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




