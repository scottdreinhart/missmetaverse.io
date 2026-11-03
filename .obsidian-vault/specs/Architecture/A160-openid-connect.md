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
---

# OpenID Connect

## Definition

OpenID Connect is an **authentication protocol built on top of OAuth 2.0**.

> "OpenID Connect (OIDC) is an authentication protocol that is often used in combination with OAuth 2.0." — OpenID Foundation

## Problem Addressed

Without OpenID Connect:
- **Authentication**: Authentication is insecure
- **User experience**: Poor user experience
- **Scalability**: Hard to scale authentication
- **Compliance**: Hard to meet compliance requirements

## Scope and Boundaries

- OpenID Connect ≠ OAuth (OpenID Connect is for authentication, OAuth is for authorization)
- OpenID Connect ≠ Authentication (OpenID Connect is a protocol, authentication is a concept)
- OpenID Connect is a **protocol**, not an authorization protocol

## When to Apply

- When building applications
- when authentication matters
- when user experience is important
- when compliance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — OpenID Connect is complex |
| **Time** — OpenID Connect takes time |
| **Over-OpenID-Connect** — Don't use OpenID Connect for everything |

## Common Misuses

- **Everything OpenID Connect**: Not everything needs OpenID Connect
- **Confusing with OAuth**: OpenID Connect ≠ OAuth
- **Over-OpenID-Connect**: Too much OpenID Connect creates complexity

## Related Concepts

- [OAuth Patterns](Architecture/oauth-patterns.md) — OpenID Connect with OAuth
- [Authentication](Architecture/authentication.md) — OpenID Connect with authentication
- [Security Principles](Architecture/security-principles.md) — OpenID Connect with security

## Project Observations

- The project uses OpenID Connect:
  - The project's architecture patterns note covers OpenID Connect (from existing notes)
  - No evidence of OpenID Connect in existing code (src/ is empty)
- File naming conventions support OpenID Connect:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




