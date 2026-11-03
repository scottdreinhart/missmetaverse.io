---
slug: complete-mediation
---

# Complete Mediation

> **Purpose:** Mediate access with Complete Mediation.
> **Last Updated:** 2026-11-03

## concept_id
`complete-mediation`

## title
Complete Mediation

## aliases
- Complete Mediation
- Every Access Check
- Always Verify
- Mediate Every Request

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
- Permission checking
- Security verification
- Authorization

## tags
- type/principle
- domain/security
- status/verified
- priority/high

## source_ids
- security-principles
- martinfowler-patterns

## related_concept_ids
- complete-mediation
- every-access-check
- always-verify
- mediate-every-request

## Definition

Complete Mediation is the principle that every access to every object must be checked for authority, never caching permissions.

## Problem Addressed

Without Complete Mediation:
- Access is cached
- Permissions change unnoticed
- Security is bypassed
- Authorization is incomplete

## Scope of Boundaries

Complete Mediation applies to:
- Access control
- Permission checking
- Security verification
- Authorization

Complete Mediation does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building secure apps
- Needing access control
- Checking permissions
- Authorizing access

## Tradeoffs and When to Avoid

- **Complexity**: Complete Mediation adds complexity
- **Performance**: Every check adds overhead
- **Not for simple apps**: Simple apps may not need Complete Mediation
- **Not for all**: Not all apps need Complete Mediation

## Implementation Guidance

1. **Define checks**: Define access checks
2. **Implement**: Implement mediation
3. **Never cache**: Never cache permissions
4. **Test**: Test access
5. **Monitor**: Monitor access

## Verification

- [ ] Checks defined
- [ ] Mediation implemented
- [ ] Permissions not cached
- [ ] Access tested
- [ ] Access monitored

## Common Misuses

- **Not defining**: Not defining checks
- **Not implementing**: Not implementing mediation
- **Caching**: Caching permissions
- **Not testing**: Not testing access

## Related Concepts

- [[Security/complete-mediation]] â€” Complete Mediation
- [[Security/complete-mediation]] â€” Every Access Check
- [[Security/complete-mediation]] â€” Always Verify
- [[Security/complete-mediation]] â€” Mediate Every Request

## Project Observations

The project uses Complete Mediation through:
- Check definition
- Mediation implementation
- Permission caching avoidance
- Access testing

## Sources

- [[Sources/security-principles|Security Principles]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Complete Mediation Note**
