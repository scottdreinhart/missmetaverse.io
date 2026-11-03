---
slug: authorization
sources:
  - https://oauth.net/2/
  - https://openid.net/connect/
date: 2026-11-02
tags:
  - authorization
  - oauth
  - openid
  - security
# Authorization

## Definition

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Authorization is a **security mechanism that verifies what resources a user, system, or service can access**.

> "Authorization is the process of verifying what resources a user, system, or service can access." â€” OAuth.net

## Problem Addressed

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without authorization:
- **Unauthorized access**: Users can access resources they shouldn't
- **Data breaches**: Sensitive data is exposed
- **Compliance**: Software doesn't meet compliance requirements
- **Trust**: Users don't trust the system

## Scope and Boundaries

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Authorization â‰  Authentication (authorization verifies permissions, authentication verifies identity)
- Authorization â‰  Security (authorization is specific, security is broader)
- Authorization is a **security mechanism**, not a specific technique

## When to Apply

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building software
- When security matters
- When compliance is important
- When building for users

## Tradeoffs and When to Avoid

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

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
| **Complexity** â€” Authorization is complex |
| **Time** â€” Authorization takes time |
| **User experience** â€” Authorization can be frustrating |

## Common Misuses

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything authorized**: Not everything needs authorization
- **Confusing with authentication**: Authorization â‰  authentication
- **Over-authorization**: Too much authorization creates complexity

## Related Concepts

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Security Principles](Architecture/security-principles.md) â€” Authorization with security
- [OAuth](Architecture/oauth.md) â€” Authorization with OAuth
- [OpenID Connect](Architecture/openid-connect.md) â€” Authorization with OpenID Connect

## Project Observations

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses authorization:
  - The project's security note covers authorization (from existing notes)
  - No evidence of authorization in existing code (src/ is empty)
- File naming conventions support authorization:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a021-authorization

## title
Authorization

## aliases
- A021-authorization

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




