---
slug: principle-of-least-privilege
tags:
  - security   - authentication   - authorization

  - security   - authentication   - best-practices
---

# Principle of Least Privilege

> **Purpose:** Grant minimum access necessary to perform tasks.
> **Last Updated:** 2026-11-03

## concept_id
`security-polk`

## title
Principle of Least Privilege

## aliases
- POLP
- Least Privilege
- Minimum Privilege

## category
security

## concept_type
security-principle

## research_status
verified

## project_adoption
declared

## applicability
- User access control
- Service accounts
- Database permissions
- API keys and tokens

## tags
- type/principle
- domain/security
- status/verified
- priority/high

## source_ids
- gdpr-eu
- owasp-top-10

## related_concept_ids
- security-deny-by-default
- security-defense-in-depth
- security-rbac
- security-zero-trust
- security-data-minimization

## Definition

The Principle of Least Privilege states that every module, user, and process should operate using the minimum set of permissions necessary to complete its task.

## Problem Addressed

Without least privilege:
- Compromised accounts have excessive access
- Accidental damage is more severe
- Lateral movement is easier for attackers
- Compliance requirements are harder to meet

## Scope and Boundaries

Least privilege applies to:
- User accounts and roles
- Service accounts and APIs
- Database permissions
- File system access
- Network access

Least privilege does not address:
- Authentication (who you are)
- Authorization is about what you can do

## When to Apply

- Designing access control systems
- Creating service accounts
- Configuring database permissions
- Implementing API scopes

## Tradeoffs and When to Avoid

- **Complexity**: Managing many small permissions is complex
- **Performance**: Checking many permissions can be slow
- **Not for admin accounts**: Admin accounts need broad access

## Implementation Guidance

1. **Identify needs**: Determine minimum permissions for each role
2. **Grant minimally**: Give only what is needed
3. **Review regularly**: Audit permissions periodically
4. **Use roles**: Group permissions into roles
5. **Automate**: Use infrastructure as code for permissions

## Verification

- [ ] Each account has minimum necessary permissions
- [ ] Permissions are reviewed regularly
- [ ] Roles are defined and used
- [ ] Access is revoked when no longer needed

## Common Misuses

- **Admin accounts**: Giving admin access to everyone
- **Static permissions**: Not revoking access when roles change
- **Overly complex**: Too many permissions to manage
- **Ignoring services**: Forgetting service accounts and APIs

## Related Concepts

- [[Security/deny-by-default]] â€” Deny by Default
- [[Security/defense-in-depth]] â€” Defense in Depth
- [[Security/rbac]] â€” Role-Based Access Control
- [[Security/zero-trust]] â€” Zero Trust
- [[Security/data-minimization]] â€” Data Minimization

## Project Observations

The project uses TypeScript with authentication middleware, which supports least privilege through:
- Role-based access control
- API scopes and permissions
- Database row-level security
- Service account isolation

## Sources

- [[Sources/S004-gdpr-eu|EU â€” General Data Protection Regulation]]
- [[Sources/S014-owasp-top-ten-2021|OWASP â€” Top 10 Web Application Security Risks]]

**End of Principle of Least Privilege Note**
