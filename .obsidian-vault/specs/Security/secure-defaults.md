---
slug: secure-defaults
tags:
  - security-authentication-authorization

  - security-authentication-best-practices
---

# Secure Defaults

> **Purpose:** Configure securely with Secure Defaults.
> **Last Updated:** 2026-11-03

## concept_id
`secure-defaults`

## title
Secure Defaults

## aliases
- Secure Defaults
- Default Security
- Safe Defaults
- Out-of-the-Box Security

## category
security

## concept_type
security-principle

## research_status
verified

## project_adoption
declared

## applicability
- Default configuration
- Out-of-the-box security
- Safe defaults
- User-friendly security

## tags
- type/principle
- domain/security
- status/verified
- priority/high

## source_ids
- security-principles
- martinfowler-patterns

## related_concept_ids
- secure-defaults
- default-security
- safe-defaults
- out-of-the-box-security

## Definition

Secure Defaults is the principle that systems should be secure by default, requiring no additional configuration to be safe.

## Problem Addressed

Without Secure Defaults:
- Systems are insecure by default
- Users must configure security
- Misconfiguration is common
- Breaches occur

## Scope of Boundaries

Secure Defaults applies to:
- Default configuration
- Out-of-the-box security
- Safe defaults
- User-friendly security

Secure Defaults does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing secure defaults
- Configuring systems
- User-friendly security

## Tradeoffs and When to Avoid

- **Complexity**: Secure Defaults adds complexity
- **Not for simple apps**: Simple apps may not need Secure Defaults
- **Not for internal**: Internal apps may not need Secure Defaults
- **Not for all**: Not all apps need Secure Defaults

## Implementation Guidance

1. **Define defaults**: Define secure defaults
2. **Configure**: Configure systems securely
3. **Document**: Document defaults
4. **Test**: Test defaults
5. **Validate**: Validate security

## Verification

- [ ] Defaults defined
- [ ] Systems configured
- [ ] Defaults documented
- [ ] Defaults tested
- [ ] Security validated

## Common Misuses

- **Not defining**: Not defining defaults
- **Not configuring**: Not configuring securely
- **Not documenting**: Not documenting defaults
- **Not testing**: Not testing defaults

## Related Concepts

- [[Security/secure-defaults]] â€” Secure Defaults
- [[Security/secure-by-design]] â€” Default Security
- [[Security/secure-by-design]] â€” Safe Defaults
- [[Security/secure-by-design]] â€” Out-of-the-Box Security

## Project Observations

The project uses Secure Defaults through:
- Default definition
- Secure configuration
- Default documentation
- Default testing

## Sources

- [[Sources/S063-security-principles|Security Principles]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Secure Defaults Note**
