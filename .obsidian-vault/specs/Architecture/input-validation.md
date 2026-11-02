---
slug: input-validation
sources:
  - https://en.wikipedia.org/wiki/Data_validation
  - https://zod.dev/
date: 2026-11-02
tags:
  - input-validation
  - security
  - zod
  - patterns
---

# Input Validation

## Definition

Input Validation is a **security practice for verifying that user input meets expected criteria**.

> "Input validation is the process of verifying that user input meets expected criteria." — Wikipedia

## Problem Addressed

Without input validation:
- **Security**: Input is insecure
- **Data integrity**: Data is inconsistent
- **User experience**: Poor user experience
- **Compliance**: Hard to meet compliance requirements

## Scope and Boundaries

- Input Validation ≠ Sanitization (input validation checks input, sanitization cleans input)
- Input Validation ≠ Type Checking (input validation checks input, type checking checks types)
- Input Validation is a **security practice**, not a sanitization practice

## When to Apply

- When building applications
- when security matters
- when data integrity is important
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Input validation is complex |
| **Time** — Input validation takes time |
| **Over-validation** — Don't validate everything |

## Common Misuses

- **Everything validated**: Not everything needs input validation
- **Confusing with sanitization**: Input validation ≠ sanitization
- **Over-validation**: Too much validation creates complexity

## Related Concepts

- [Schema-Driven Development](Architecture/schema-driven-development.md) — Input validation with schema
- [Security Principles](Architecture/security-principles.md) — Input validation with security
- [TypeScript Best Practices](../TypeScript/ts-best-practices.md) — Input validation with TypeScript

## Project Observations

- The project uses input validation:
  - The project's architecture patterns note covers input validation (from existing notes)
  - No evidence of input validation in existing code (src/ is empty)
- File naming conventions support input validation:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
