---
slug: type-guards
sources:
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html#using-type-guards
  - https://typescript.tv/
date: 2026-11-02
tags:
  - type-guards
  - typescript
  - types
  - patterns
# Type Guards

## Definition

## concept_id
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Type Guards are a **TypeScript feature for narrowing the type of a variable within a scope**.

> "Type guards are expressions which perform a runtime check that guarantees the type in some scope." â€” TypeScript Docs

## Problem Addressed

## concept_id
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without type guards:
- **Type safety**: Type safety is lost
- **IntelliSense**: IntelliSense doesn't work
- **Refactoring**: Hard to refactor code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

## concept_id
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Type Guards â‰  Type Narrowing (type guards are a feature, type narrowing is a feature)
- Type Guards â‰  Type Assertion (type guards narrow types, type assertion overrides types)
- Type Guards is a **TypeScript feature**, not a type assertion

## When to Apply

## concept_id
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

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
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

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
| **Complexity** â€” Type guards are complex |
| **Time** â€” Type guards take time |
| **Over-type-guards** â€” Don't use type guards for everything |

## Common Misuses

## concept_id
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything type guarded**: Not everything needs type guards
- **Confusing with type narrowing**: Type guards â‰  type narrowing
- **Over-type-guards**: Too many type guards create complexity

## Related Concepts

## concept_id
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [TypeScript Best Practices](../TypeScript/TypeScript/typescript-strict-mode.md) â€” Type guards with TypeScript
- [Type Narrowing](Architecture/type-narrowing.md) â€” Type guards with type narrowing
- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md) â€” Type guards with strict mode

## Project Observations

## concept_id
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses type guards:
  - The project's TypeScript note covers type guards (from existing notes)
  - No evidence of type guards in existing code (src/ is empty)
- File naming conventions support type guards:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a227-type-guards

## title
Type Guards

## aliases
- A227-type-guards

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




