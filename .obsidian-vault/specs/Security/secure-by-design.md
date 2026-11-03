---
slug: secure-by-design
---

# Secure by Design

> **Purpose:** Build secure with Secure by Design.
> **Last Updated:** 2026-11-03

## concept_id
`secure-by-design`

## title
Secure by Design

## aliases
- Secure by Design
- Security by Design
- Built-in Security
- Security First

## category
security

## concept_type
security-principle

## research_status
verified

## project_adoption
declared

## applicability
- Secure development
- Security integration
- Design security
- Security first

## tags
- type/principle
- domain/security
- status/verified
- priority/high

## source_ids
- security-principles
- martinfowler-patterns

## related_concept_ids
- secure-by-design
- security-by-design
- built-in-security
- security-first

## Definition

Secure by Design is a principle where security is integrated into the design and development process from the beginning, rather than being added later.

## Problem Addressed

Without Secure by Design:
- Security is an afterthought
- Vulnerabilities are discovered late
- Fixes are expensive
- Risk is high

## Scope of Boundaries

Secure by Design applies to:
- Secure development
- Security integration
- Design security
- Security first

Secure by Design does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Designing systems
- Needing security integration
- Building securely
- Security first approach

## Tradeoffs and When to Avoid

- **Complexity**: Secure by Design adds complexity
- **Not for simple apps**: Simple apps may not need Secure by Design
- **Not for internal**: Internal apps may not need Secure by Design
- **Not for all**: Not all apps need Secure by Design

## Implementation Guidance

1. **Define requirements**: Define security requirements
2. **Design securely**: Design with security in mind
3. **Implement**: Implement security controls
4. **Test**: Test security
5. **Review**: Review design

## Verification

- [ ] Requirements defined
- [ ] Design secure
- [ ] Controls implemented
- [ ] Security tested
- [ ] Design reviewed

## Common Misuses

- **Not defining**: Not defining requirements
- **Not designing**: Not designing securely
- **Not implementing**: Not implementing controls
- **Not testing**: Not testing security

## Related Concepts

- [[Security/secure-by-design]] â€” Secure by Design
- [[Security/security-by-design]] â€” Security by Design
- [[Security/built-in-security]] â€” Built-in Security
- [[Security/security-first]] â€” Security First

## Project Observations

The project uses Secure by Design through:
- Requirements definition
- Secure design
- Control implementation
- Security testing

## Sources

- [[Sources/security-principles|Security Principles]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Secure by Design Note**
