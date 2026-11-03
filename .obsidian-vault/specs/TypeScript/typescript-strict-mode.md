---
slug: typescript-strict-mode
tags:
  - typescript   - javascript   - type-system

  - typescript   - type-system   - coding
---

# TypeScript Strict Mode

> **Purpose:** Enable strict TypeScript compiler options.
> **Last Updated:** 2026-11-03

## concept_id
`typescript-strict-mode`

## title
TypeScript Strict Mode

## aliases
- TypeScript Strict Mode
- strict: true
- TypeScript Strict

## category
typescript

## concept_type
configuration

## research_status
verified

## project_adoption
declared

## applicability
- TypeScript projects
- Type safety
- Error prevention
- Code quality

## tags
- type/configuration
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- goF-1994

## related_concept_ids
- coding-strict-typing
- coding-compile-time-checks
- coding-type-inference
- coding-generics
- coding-no-explicit-any

## Definition

TypeScript Strict Mode enables all strict compiler options to catch errors early and enforce type safety. It includes options like strictNullChecks, noImplicitAny, strictFunctionTypes, etc.

## Problem Addressed

Without strict mode:
- Type errors occur at runtime
- null/undefined errors are common
- Type inference is unreliable
- Code quality is lower

## Scope and Boundaries

Strict mode applies to:
- TypeScript compilation
- Type checking
- Error prevention
- Code quality

Strict mode does not apply to:
- JavaScript projects
- Runtime behavior
- Performance
- Bundle size

## When to Apply

- Starting new TypeScript projects
- Migrating JavaScript to TypeScript
- Improving code quality
- Enforcing type safety

## Tradeoffs and When to Avoid

- **Learning curve**: Strict mode has learning curve
- **Migration effort**: Migrating existing code takes effort
- **Not for JavaScript**: Strict mode only applies to TypeScript
- **Not for runtime**: Strict mode doesn't affect runtime

## Implementation Guidance

1. **Enable strict**: Set "strict": true in tsconfig.json
2. **Fix errors**: Fix all strict mode errors
3. **Avoid any**: Avoid using `any` type
4. **Use unknown**: Use `unknown` for runtime data
5. **Test**: Test after enabling strict mode

## Verification

- [ ] Strict mode is enabled
- [ ] All strict errors are fixed
- [ ] `any` type is avoided
- [ ] `unknown` is used for runtime data
- [ ] Code is tested

## Common Misuses

- **Not enabling**: Not enabling strict mode
- **Using any**: Using `any` type to avoid errors
- **Not fixing**: Not fixing strict mode errors
- **Not testing**: Not testing after enabling

## Related Concepts

- [[Coding Type Systems/strict-typing]] â€” Strict Typing
- [[TypeScript/compile-time-checks]] â€” Compile-Time Checks
- [[TypeScript/type-inference]] â€” Type Inference
- [[TypeScript/generics]] â€” Generics

## Project Observations

The project uses TypeScript with strict mode enabled through:
- "strict": true in tsconfig.json
- Type safety enforcement
- Error prevention
- Code quality improvement

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of TypeScript Strict Mode Note**
