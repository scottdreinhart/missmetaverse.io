---
slug: a162-parse-dont-validate
sources:
  - https://hynek.me/articles/validate-before-parsing/
  - https://gleb-tarasov.com/blog/parse-dont-validate/
date: 2026-11-02
tags:
  - parsing
  - validation
  - typescript
  - type-systems
# Parse, Don't Merely Validate

## Definition

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Parse, Don't Validate is the principle that **input should be parsed into typed values rather than validated as raw strings**. Parsing enforces invariants at the boundary, while validation only checks.

> "Parse don't validate: convert raw input into typed values at the boundary, so the rest of your code works with guaranteed valid data." â€” Gleb T.

## Problem Addressed

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Validation-only leads to:
- **Repeated checks**: Every function must validate again
- **Inconsistent rules**: Different places validate differently
- **Runtime errors**: Invalid data propagates through the system

## Scope and Boundaries

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Parsing â‰  Validation (parsing creates, validation checks)
- Parsing is a **boundary concern**, validation is a **domain concern**
- TypeScript types don't validate runtime input (need parsing at boundaries)

## When to Apply

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- At API boundaries (HTTP, CLI, file imports)
- When receiving external input
- When creating domain objects from raw data

## Tradeoffs and When to Avoid

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

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
| **Parsing complexity** â€” Parsing logic can be complex |
| **Error messages** â€” Parse errors may be less user-friendly |
| **Performance** â€” Parsing adds overhead |

## Common Misuses

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Parsing everything**: Not everything needs parsing
- **Confusing with validation**: Parsing creates valid values, validation checks
- **Over-engineering**: Simple validation may be sufficient

## Related Concepts

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Boundary Validation](Architecture/Architecture/clean-architecture.md) â€” Parse at boundaries
- [Make Invalid States Unrepresentable](Architecture/Architecture/clean-architecture.md) â€” Parsing enforces invariants
- [Strict Typing](Architecture/Architecture/clean-architecture.md) â€” Parsed values are strongly typed

## Project Observations

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses Zod schemas (`*.schema.ts`) for parsing at boundaries
- Value objects (Money, Email, Address) parse and validate at construction
- TypeScript types alone don't validate runtime input

## Sources

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



