---
slug: policy-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
# *.policy.ts

## Definition

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
`*.policy.ts` is **a file naming convention for TypeScript files that contain business policies, rules, and constraints**.

> "The *.policy.ts convention identifies TypeScript files that contain business policies and rules." â€” TypeScript Docs

## Problem Addressed

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
Without `*.policy.ts` convention:
- **Confusion**: Don't know which files contain business policies
- **Mixing concerns**: Policies are mixed with business logic
- **Testing**: Hard to test policies separately
- **Maintenance**: Hard to maintain policies

## Scope and Boundaries

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- `*.policy.ts` â‰  `*.logic.ts` (`*.policy.ts` is for policies, `*.logic.ts` is for general business logic)
- `*.policy.ts` = Policies (`*.policy.ts` is for business policies)
- `*.policy.ts` is a **file naming convention**, not a pattern

## When to Apply

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- When building applications with business policies
- when policy pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
| Cost | Description |
|------|-------------|
| **Complexity** â€” File conventions add naming complexity |
| **Time** â€” Following conventions takes time |
| **Over-convention**: Not every policy needs a separate file |

## Common Misuses

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- **Everything a policy**: Not every rule needs a policy file
- **Mixing concerns**: Policy files should not contain business logic
- **Confusing with logic**: Policy files contain policies, logic files contain business logic

## Related Concepts

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [Domain Invariant](DDD/domain-invariant.md) â€” Domain invariants are policies
- [Specification Pattern](Architecture/specification-pattern.md) â€” Specification pattern implements policies
- [Logic File Convention](Project File Conventions/logic-file-convention.md) â€” Logic file convention separates business logic

## Project Observations

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- The project uses `*.policy.ts`:
  - TypeScript supports `*.policy.ts` through module system
  - React supports `*.policy.ts` through policy definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.policy.ts` in existing code (src/ is empty)
- File naming conventions support `*.policy.ts`:
  - `*.policy.ts` â€” Policy files
  - `*.logic.ts` â€” Logic files

## Sources

## concept_id
e14-policy-file-convention

## title
*.policy.ts

## aliases
- E14-Policy-File-Convention

## category
conventions

## concept_type
file-structure

## research_status
verified

## project_adoption
required
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]



