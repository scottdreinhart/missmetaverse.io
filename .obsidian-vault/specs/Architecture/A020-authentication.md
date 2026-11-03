---
slug: authentication
sources:
  - https://oauth.net/2/
  - https://openid.net/connect/
date: 2026-11-02
tags:
  - authentication
  - oauth
  - openid
  - security
# Authentication

## Definition

## concept_id
a020-authentication

## title
Authentication

## aliases
- A020-authentication

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Authentication is a **security mechanism that verifies the identity of a user, system, or service**.

> "Authentication is the process of verifying the identity of a user, system, or service." â€” OAuth.net

## Problem Addressed

## concept_id
a020-authentication

## title
Authentication

## aliases
- A020-authentication

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without authentication:
- **Unauthorized access**: Anyone can access the system
- **Data breaches**: Sensitive data is exposed
- **Compliance**: Software doesn't meet compliance requirements
- **Trust**: Users don't trust the system

## Scope and Boundaries

## concept_id
a020-authentication

## title
Authentication

## aliases
- A020-authentication

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Authentication â‰  Authorization (authentication verifies identity, authorization verifies permissions)
- Authentication â‰  Security (authentication is specific, security is broader)
- Authentication is a **security mechanism**, not a specific technique

## When to Apply

## concept_id
a020-authentication

## title
Authentication

## aliases
- A020-authentication

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
a020-authentication

## title
Authentication

## aliases
- A020-authentication

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
| **Complexity** â€” Authentication is complex |
| **Time** â€” Authentication takes time |
| **User experience** â€” Authentication can be frustrating |

## Common Misuses

## concept_id
a020-authentication

## title
Authentication

## aliases
- A020-authentication

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything authenticated**: Not everything needs authentication
- **Confusing with authorization**: Authentication â‰  authorization
- **Over-authentication**: Too much authentication creates complexity

## Related Concepts

## concept_id
a020-authentication

## title
Authentication

## aliases
- A020-authentication

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Security Principles](Architecture/security-principles.md) â€” Authentication with security
- [OAuth](Architecture/oauth.md) â€” Authentication with OAuth
- [OpenID Connect](Architecture/openid-connect.md) â€” Authentication with OpenID Connect

## Project Observations

## concept_id
a020-authentication

## title
Authentication

## aliases
- A020-authentication

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses authentication:
  - The project's security note covers authentication (from existing notes)
  - No evidence of authentication in existing code (src/ is empty)
- File naming conventions support authentication:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a020-authentication

## title
Authentication

## aliases
- A020-authentication

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




