---
slug: a071-data-modeling
sources:
  - https://en.wikipedia.org/wiki/Data_modeling
  - https://www.postgresql.org/docs/current/ddl.html
date: 2026-11-02
tags:
  - data-modeling
  - database
  - normalization
  - patterns
# Data Modeling

## Definition

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Data Modeling is a **process of creating a data model for an information system**.

> "Data modeling is the process of creating a data model for an information system." â€” Wikipedia

## Problem Addressed

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without data modeling:
- **Data integrity**: Data is inconsistent
- **Performance**: Queries are slow
- **Scalability**: Hard to scale
- **Maintenance**: Hard to maintain

## Scope and Boundaries

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Data Modeling â‰  Database Design (data modeling is a process, database design is a process)
- Data Modeling â‰  SQL (data modeling is a process, SQL is a language)
- Data Modeling is a **process**, not a language

## When to Apply

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when data integrity matters
- when performance is important
- when scalability is important

## Tradeoffs and When to Avoid

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

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
| **Complexity** â€” Data modeling is complex |
| **Time** â€” Data modeling takes time |
| **Over-data-modeling** â€” Don't over-model data |

## Common Misuses

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything data modeled**: Not everything needs data modeling
- **Confusing with database design**: Data modeling â‰  database design
- **Over-data-modeling**: Too much data modeling creates complexity

## Related Concepts

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Database Design](Architecture/database-design.md) â€” Data modeling with database design
- [SQL Fundamentals](Architecture/sql-fundamentals.md) â€” Data modeling with SQL
- [Data Mapper Pattern](Architecture/data-mapper-pattern.md) â€” Data modeling with data mapper

## Project Observations

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses data modeling:
  - The project's architecture patterns note covers data modeling (from existing notes)
  - No evidence of data modeling in existing code (src/ is empty)
- File naming conventions support data modeling:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a071-data-modeling

## title
Data Modeling

## aliases
- A071-data-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




