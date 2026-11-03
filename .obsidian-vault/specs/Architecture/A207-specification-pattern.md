---
slug: a207-specification-pattern
sources:
  - https://martinfowler.com/bliki/SpecificationPattern.html
  - https://en.wikipedia.org/wiki/Specification_pattern
date: 2026-11-02
tags:
  - specification-pattern
  - ddd
  - domain-modeling
  - patterns
# Specification Pattern

## Definition

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Specification Pattern is a **design pattern that encapsulates business rules and combines them to form complex queries**.

> "A specification is a boolean expression that evaluates to true or false for a given input." â€” Martin Fowler

## Problem Addressed

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without specification pattern:
- **Complexity**: Business rules are complex
- **Inconsistency**: Business rules are inconsistent
- **Testing**: Hard to test business rules
- **Maintenance**: Hard to maintain business rules

## Scope and Boundaries

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Specification Pattern â‰  Business Rule (specification pattern is a pattern, business rule is a concept)
- Specification Pattern â‰  Validation (specification pattern is for business rules, validation is for data)
- Specification Pattern is a **design pattern**, not a business rule pattern

## When to Apply

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when business rules matter
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

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
| **Complexity** â€” Specification pattern is complex |
| **Time** â€” Specification pattern takes time |
| **Over-specification** â€” Don't specify everything |

## Common Misuses

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything specified**: Not everything needs specification pattern
- **Confusing with business rule**: Specification pattern â‰  business rule
- **Over-specification**: Too many specifications create complexity

## Related Concepts

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [DDD Patterns](Architecture/Application Architecture/domain-driven-design.md) â€” Specification pattern with DDD
- [Business Rules](Architecture/business-rules.md) â€” Specification pattern with business rules
- [Validation](Architecture/validation.md) â€” Specification pattern with validation

## Project Observations

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses specification pattern:
  - The project's architecture patterns note covers specification pattern (from existing notes)
  - No evidence of specification pattern in existing code (src/ is empty)
- File naming conventions support specification pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a207-specification-pattern

## title
Specification Pattern

## aliases
- A207-specification-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




