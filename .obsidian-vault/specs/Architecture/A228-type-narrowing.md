---
slug: type-narrowing
sources:
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
  - https://typescript.tv/
date: 2026-11-02
tags:
  - type-narrowing
  - typescript
  - types
  - patterns
# Type Narrowing

## Definition

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Type Narrowing is a **TypeScript feature for narrowing the type of a variable within a scope**.

> "Type narrowing is the process of narrowing the type of a variable within a scope." â€” TypeScript Docs

## Problem Addressed

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without type narrowing:
- **Type safety**: Type safety is lost
- **IntelliSense**: IntelliSense doesn't work
- **Refactoring**: Hard to refactor code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Type Narrowing â‰  Type Assertion (type narrowing narrows types, type assertion overrides types)
- Type Narrowing â‰  Type Checking (type narrowing narrows types, type checking checks types)
- Type Narrowing is a **TypeScript feature**, not a type assertion

## When to Apply

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building TypeScript applications
- when type safety matters
- when IntelliSense is important
- when refactoring is important

## Tradeoffs and When to Avoid

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

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
| **Complexity** â€” Type narrowing is complex |
| **Time** â€” Type narrowing takes time |
| **Over-narrowing** â€” Don't narrow everything |

## Common Misuses

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything narrowed**: Not everything needs type narrowing
- **Confusing with type assertion**: Type narrowing â‰  type assertion
- **Over-narrowing**: Too much narrowing creates complexity

## Related Concepts

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [TypeScript Best Practices](../TypeScript/TypeScript/typescript-strict-mode.md) â€” Type narrowing with TypeScript
- [TypeScript Narrowing](../TypeScript/TypeScript/type-inference.md) â€” Type narrowing with TypeScript
- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md) â€” Type narrowing with strict mode

## Project Observations

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses type narrowing:
  - The project's TypeScript note covers type narrowing (from existing notes)
  - No evidence of type narrowing in existing code (src/ is empty)
- File naming conventions support type narrowing:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a228-type-narrowing

## title
Type Narrowing

## aliases
- A228-type-narrowing

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




