---
slug: openid-connect
sources:
  - https://openid.net/connect/
  - https://oauth.net/2/
date: 2026-11-02
tags:
  - openid-connect
  - authentication
  - security
  - patterns
# OpenID Connect

## Definition

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
OpenID Connect is an **authentication protocol built on top of OAuth 2.0**.

> "OpenID Connect (OIDC) is an authentication protocol that is often used in combination with OAuth 2.0." â€” OpenID Foundation

## Problem Addressed

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without OpenID Connect:
- **Authentication**: Authentication is insecure
- **User experience**: Poor user experience
- **Scalability**: Hard to scale authentication
- **Compliance**: Hard to meet compliance requirements

## Scope and Boundaries

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- OpenID Connect â‰  OAuth (OpenID Connect is for authentication, OAuth is for authorization)
- OpenID Connect â‰  Authentication (OpenID Connect is a protocol, authentication is a concept)
- OpenID Connect is a **protocol**, not an authorization protocol

## When to Apply

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building applications
- when authentication matters
- when user experience is important
- when compliance is important

## Tradeoffs and When to Avoid

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” OpenID Connect is complex |
| **Time** â€” OpenID Connect takes time |
| **Over-OpenID-Connect** â€” Don't use OpenID Connect for everything |

## Common Misuses

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything OpenID Connect**: Not everything needs OpenID Connect
- **Confusing with OAuth**: OpenID Connect â‰  OAuth
- **Over-OpenID-Connect**: Too much OpenID Connect creates complexity

## Related Concepts

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [OAuth Patterns](Architecture/oauth-patterns.md) â€” OpenID Connect with OAuth
- [Authentication](Architecture/authentication.md) â€” OpenID Connect with authentication
- [Security Principles](Architecture/security-principles.md) â€” OpenID Connect with security

## Project Observations

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses OpenID Connect:
  - The project's architecture patterns note covers OpenID Connect (from existing notes)
  - No evidence of OpenID Connect in existing code (src/ is empty)
- File naming conventions support OpenID Connect:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a160-openid-connect

## title
OpenID Connect

## aliases
- A160-openid-connect

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




