---
slug: deny-by-default
tags:
  - security   - authentication   - authorization

  - security   - authentication   - best-practices
---

# Deny by Default

> **Purpose:** Secure apps with Deny by Default.
> **Last Updated:** 2026-11-03

## concept_id
`deny-by-default`

## title
Deny by Default

## aliases
- Deny by Default
- Default Deny
- Implicit Deny
- Deny All

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
- Firewall rules
- Network security
- Permission management

## tags
- type/principle
- domain/security
- status/verified
- priority/high

## source_ids
- security-principles
- martinfowler-patterns

## related_concept_ids
- deny-by-default
- default-deny
- implicit-deny
- deny-all

## Definition

Deny by Default is a security principle where all access is denied unless explicitly permitted, ensuring that only authorized access is allowed.

## Problem Addressed

Without Deny by Default:
- Unauthorized access is possible
- Security is based on exceptions
- New threats are not covered
- Compliance is at risk

## Scope of Boundaries

Deny by Default applies to:
- Access control
- Firewall rules
- Network security
- Permission management

Deny by Default does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building secure apps
- Needing access control
- Configuring firewalls
- Managing permissions

## Tradeoffs and When to Avoid

- **Complexity**: Deny by Default adds complexity
- **Not for simple apps**: Simple apps may not need Deny by Default
- **Not for internal**: Internal apps may not need Deny by Default
- **Not for all**: Not all apps need Deny by Default

## Implementation Guidance

1. **Define policy**: Define deny-by-default policy
2. **Configure access**: Configure explicit access rules
3. **Test**: Test access control
4. **Monitor**: Monitor access
5. **Audit**: Audit permissions

## Verification

- [ ] Policy defined
- [ ] Access configured
- [ ] Access tested
- [ ] Access monitored
- [ ] Permissions audited

## Common Misuses

- **Not defining**: Not defining policy
- **Not configuring**: Not configuring access
- **Not testing**: Not testing access
- **Not monitoring**: Not monitoring access

## Related Concepts

- [[Security/deny-by-default]] â€” Deny by Default
- [[Security/default-deny]] â€” Default Deny
- [[Security/deny-by-default]] â€” Implicit Deny
- [[Security/deny-by-default]] â€” Deny All

## Project Observations

The project uses Deny by Default through:
- Policy definition
- Access configuration
- Access testing
- Access monitoring

## Sources

- [[Sources/security-principles|Security Principles]]
- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Deny by Default Note**
