# Policy File Convention

> **Purpose:** Define business rules and policies.
> **Last Updated:** 2026-11-03

---

## concept_id
`project-policy-file`

## title
*.policy.ts File Convention

## aliases
- Policy File Convention
- *.policy.ts
- Policy Module

## category
project-file-conventions

## concept_type
convention

## research_status
verified

## project_adoption
declared

## applicability
- Business rules
- Policy enforcement
- Domain logic
- Project organization

## tags
- type/convention
- domain/ddd
- status/verified
- priority/medium

## source_ids
- martinfowler-patterns
- goF-1994

## related_concept_ids
- project-view-file
- project-logic-file
- project-data-file
- project-hook-file
- ddd-domain-invariant

---

## Definition

The *.policy.ts file convention designates files that define business policies — rules and constraints that govern domain behavior.

## Problem Addressed

Without file conventions:
- Policies are scattered
- Business rules are inconsistent
- Enforcement is difficult
- Architecture is inconsistent

## Scope and Boundaries

Policy files apply to:
- Business rules
- Policy enforcement
- Domain constraints
- Business logic

Policy files do not apply to:
- UI rendering
- Data fetching
- State management
- User interaction

## When to Apply

- Defining business rules
- Implementing policies
- Enforcing constraints
- Building domain logic

## Tradeoffs and When to Avoid

- **Over-splitting**: Not every rule needs policy file
- **Not for UI**: Policy files should not render UI
- **Not for data**: Policy files should not fetch data
- **Not for state**: Policy files should not manage state

## Implementation Guidance

1. **Define policies**: Define policy classes or functions
2. **Enforce rules**: Enforce business rules
3. **Validate**: Validate against policies
4. **Test policies**: Test policy enforcement
5. **Document policies**: Document policy rationale

## Verification

- [ ] Policies are defined
- [ ] Rules are enforced
- [ ] Validation is done
- [ ] Policies are tested
- [ ] Policies are documented

## Common Misuses

- **Not defining policies**: Not defining policy files
- **Not enforcing**: Not enforcing rules
- **Not validating**: Not validating against policies
- **Not testing**: Not testing policies

## Related Concepts

- [[Project File Conventions/view-file-convention]] — *.view.tsx File Convention
- [[Project File Conventions/logic-file-convention]] — *.logic.ts File Convention
- [[Project File Conventions/data-file-convention]] — *.data.ts File Convention
- [[DDD/domain-invariant]] — Domain Invariant

## Project Observations

The project follows policy file convention through:
- *.policy.ts files for business rules
- *.logic.ts files for business logic
- Domain-driven design
- Clear policy boundaries

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of Policy File Convention Note**
