---
slug: zod-patterns
sources:
  - https://zod.dev/
  - https://en.wikipedia.org/wiki/Data_validation
date: 2026-11-02
tags:
  - zod
  - validation
  - typescript
  - patterns
---

# Zod Patterns

## Definition

Zod Patterns are **design patterns for working with Zod for runtime type validation**.

> "Zod is a TypeScript-first schema validation library." — Zod Docs

## Problem Addressed

Without Zod patterns:
- **Type safety**: Type safety is lost
- **Validation**: Validation is inconsistent
- **IntelliSense**: IntelliSense doesn't work
- **Refactoring**: Hard to refactor code

## Scope and Boundaries

- Zod ≠ TypeScript (Zod is a validation library, TypeScript is a language)
- Zod ≠ Validation (Zod is a library, validation is a practice)
- Zod is a **library**, not a language

## When to Apply

- When building TypeScript applications
- when type safety matters
- when validation is important
- when refactoring is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Zod is complex |
| **Time** — Zod takes time |
| **Over-Zod** — Don't use Zod for everything |

## Common Misuses

- **Everything Zod**: Not everything needs Zod
- **Confusing with TypeScript**: Zod ≠ TypeScript
- **Over-Zod**: Too much Zod creates complexity

## Related Concepts

- [TypeScript Best Practices](../TypeScript/ts-best-practices.md) — Zod with TypeScript
- [Schema-Driven Development](Architecture/schema-driven-development.md) — Zod with schema
- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md) — Zod with strict mode

## Project Observations

- The project uses Zod:
  - The project's TypeScript note covers Zod (from existing notes)
  - No evidence of Zod in existing code (src/ is empty)
- File naming conventions support Zod:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

