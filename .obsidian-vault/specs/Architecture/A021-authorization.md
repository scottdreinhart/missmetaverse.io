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
---

# Authorization

## Definition

Authorization is a **security mechanism that verifies what resources a user, system, or service can access**.

> "Authorization is the process of verifying what resources a user, system, or service can access." — OAuth.net

## Problem Addressed

Without authorization:
- **Unauthorized access**: Users can access resources they shouldn't
- **Data breaches**: Sensitive data is exposed
- **Compliance**: Software doesn't meet compliance requirements
- **Trust**: Users don't trust the system

## Scope and Boundaries

- Authorization ≠ Authentication (authorization verifies permissions, authentication verifies identity)
- Authorization ≠ Security (authorization is specific, security is broader)
- Authorization is a **security mechanism**, not a specific technique

## When to Apply

- When building software
- When security matters
- When compliance is important
- When building for users

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Authorization is complex |
| **Time** — Authorization takes time |
| **User experience** — Authorization can be frustrating |

## Common Misuses

- **Everything authorized**: Not everything needs authorization
- **Confusing with authentication**: Authorization ≠ authentication
- **Over-authorization**: Too much authorization creates complexity

## Related Concepts

- [Security Principles](Architecture/security-principles.md) — Authorization with security
- [OAuth](Architecture/oauth.md) — Authorization with OAuth
- [OpenID Connect](Architecture/openid-connect.md) — Authorization with OpenID Connect

## Project Observations

- The project uses authorization:
  - The project's security note covers authorization (from existing notes)
  - No evidence of authorization in existing code (src/ is empty)
- File naming conventions support authorization:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




