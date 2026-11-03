---
slug: policy-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - type/reference
  - domain/accessibility
  - file-conventions
  - react
  - typescript
  - project-structure
---

# *.policy.ts

## Definition

`*.policy.ts` is **a file naming convention for TypeScript files that contain business policies, rules, and constraints**.

> "The *.policy.ts convention identifies TypeScript files that contain business policies and rules." — TypeScript Docs

## Problem Addressed

Without `*.policy.ts` convention:
- **Confusion**: Don't know which files contain business policies
- **Mixing concerns**: Policies are mixed with business logic
- **Testing**: Hard to test policies separately
- **Maintenance**: Hard to maintain policies

## Scope and Boundaries

- `*.policy.ts` ≠ `*.logic.ts` (`*.policy.ts` is for policies, `*.logic.ts` is for general business logic)
- `*.policy.ts` = Policies (`*.policy.ts` is for business policies)
- `*.policy.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building applications with business policies
- when policy pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every policy needs a separate file |

## Common Misuses

- **Everything a policy**: Not every rule needs a policy file
- **Mixing concerns**: Policy files should not contain business logic
- **Confusing with logic**: Policy files contain policies, logic files contain business logic

## Related Concepts

- [Domain Invariant](DDD/domain-invariant.md) — Domain invariants are policies
- [Specification Pattern](Architecture/specification-pattern.md) — Specification pattern implements policies
- [Logic File Convention](Project File Conventions/logic-file-convention.md) — Logic file convention separates business logic

## Project Observations

- The project uses `*.policy.ts`:
  - TypeScript supports `*.policy.ts` through module system
  - React supports `*.policy.ts` through policy definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.policy.ts` in existing code (src/ is empty)
- File naming conventions support `*.policy.ts`:
  - `*.policy.ts` — Policy files
  - `*.logic.ts` — Logic files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]



