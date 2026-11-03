---
slug: separation-of-duties
tags:
  - security   - authentication   - authorization

  - security   - authentication   - best-practices
---

# Separation of Duties

> **Purpose:** Separate duties with Separation of Duties.
> **Last Updated:** 2026-11-03

## concept_id
`separation-of-duties`

## title
Separation of Duties

## aliases
- Separation of Duties
- SoD
- Segregation of Duties
- Dual Control

## category
security

## concept_type
security-principle

## research_status
verified

## project_adoption
declared

## applicability
- Access control
- Fraud prevention
- Compliance
- Risk mitigation

## tags
- type/principle
- domain/security
- status/verified
- priority/high

## source_ids
- security-principles
- martinfowler-patterns

## related_concept_ids
- separation-of-duties
- sod
- segregation-of-duties
- dual-control

## Definition

Separation of Duties is a security principle where critical tasks are divided among multiple people to prevent fraud and errors.

## Problem Addressed

Without Separation of Duties:
- Fraud is easier
- Errors go undetected
- Compliance is at risk
- Risk is concentrated

## Scope of Boundaries

Separation of Duties applies to:
- Access control
- Fraud prevention
- Compliance
- Risk mitigation

Separation of Duties does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building secure apps
- Needing fraud prevention
- Managing compliance
- Mitigating risk

## Tradeoffs and When to Avoid

- **Complexity**: Separation of Duties adds complexity
- **Not for simple apps**: Simple apps may not need Separation of Duties
- **Not for internal**: Internal apps may not need Separation of Duties
- **Not for all**: Not all apps need Separation of Duties

## Implementation Guidance

1. **Identify tasks**: Identify critical tasks
2. **Divide duties**: Divide among people
3. **Define roles**: Define roles
4. **Enforce**: Enforce separation
5. **Audit**: Audit compliance

## Verification

- [ ] Tasks identified
- [ ] Duties divided
- [ ] Roles defined
- [ ] Separation enforced
- [ ] Compliance audited

## Common Misuses

- **Not identifying**: Not identifying tasks
- **Not dividing**: Not dividing duties
- **Not defining**: Not defining roles
- **Not enforcing**: Not enforcing separation

## Related Concepts

- [[Security/separation-of-duties]] â€” Separation of Duties
- [[Security/separation-of-duties]] â€” SoD
- [[Security/separation-of-duties]] â€” Segregation of Duties
- [[Security/separation-of-duties]] â€” Dual Control

## Project Observations

The project uses Separation of Duties through:
- Task identification
- Duty division
- Role definition
- Separation enforcement

## Sources

- [[Sources/S063-security-principles|Security Principles]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Separation of Duties Note**
