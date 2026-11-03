---
slug: parse-dont-validate
sources:
  - https://hynek.me/articles/validate-before-parsing/
  - https://gleb-tarasov.com/blog/parse-dont-validate/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - type/concept
  - domain/optimization
  - type/guide
  - domain/frontend
  - domain/accessibility
  - status/complete
  - type/reference
  - domain/architecture
  - parsing
  - validation
  - typescript
  - type-systems
---

# Parse, Don't Merely Validate

## Definition

Parse, Don't Validate is the principle that **input should be parsed into typed values rather than validated as raw strings**. Parsing enforces invariants at the boundary, while validation only checks.

> "Parse don't validate: convert raw input into typed values at the boundary, so the rest of your code works with guaranteed valid data." — Gleb T.

## Problem Addressed

Validation-only leads to:
- **Repeated checks**: Every function must validate again
- **Inconsistent rules**: Different places validate differently
- **Runtime errors**: Invalid data propagates through the system

## Scope and Boundaries

- Parsing ≠ Validation (parsing creates, validation checks)
- Parsing is a **boundary concern**, validation is a **domain concern**
- TypeScript types don't validate runtime input (need parsing at boundaries)

## When to Apply

- At API boundaries (HTTP, CLI, file imports)
- When receiving external input
- When creating domain objects from raw data

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Parsing complexity** — Parsing logic can be complex |
| **Error messages** — Parse errors may be less user-friendly |
| **Performance** — Parsing adds overhead |

## Common Misuses

- **Parsing everything**: Not everything needs parsing
- **Confusing with validation**: Parsing creates valid values, validation checks
- **Over-engineering**: Simple validation may be sufficient

## Related Concepts

- [Boundary Validation](Architecture/coding-practices.md) — Parse at boundaries
- [Make Invalid States Unrepresentable](Architecture/coding-practices.md) — Parsing enforces invariants
- [Strict Typing](Architecture/coding-practices.md) — Parsed values are strongly typed

## Project Observations

- The project uses Zod schemas (`*.schema.ts`) for parsing at boundaries
- Value objects (Money, Email, Address) parse and validate at construction
- TypeScript types alone don't validate runtime input

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



