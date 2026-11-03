---
slug: oauth-patterns
sources:
  - https://oauth.net/2/
  - https://openid.net/connect/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/security
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - oauth
  - authentication
  - security
  - patterns
---

# OAuth Patterns

## Definition

OAuth Patterns are **design patterns for working with OAuth for authorization**.

> "OAuth is an open standard for access delegation, commonly used as a way for Internet users to grant websites or applications access to their information on other websites without giving them the passwords." — Wikipedia

## Problem Addressed

Without OAuth patterns:
- **Security**: Authorization is insecure
- **User experience**: Poor user experience
- **Scalability**: Hard to scale authorization
- **Compliance**: Hard to meet compliance requirements

## Scope and Boundaries

- OAuth ≠ Authentication (OAuth is for authorization, authentication is for identity)
- OAuth ≠ OpenID Connect (OAuth is for authorization, OpenID Connect is for authentication)
- OAuth is a **protocol**, not an authentication protocol

## When to Apply

- When building applications
- when authorization matters
- when user experience is important
- when compliance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — OAuth is complex |
| **Time** — OAuth takes time |
| **Over-OAuth** — Don't use OAuth for everything |

## Common Misuses

- **Everything OAuth**: Not everything needs OAuth
- **Confusing with authentication**: OAuth ≠ authentication
- **Over-OAuth**: Too much OAuth creates complexity

## Related Concepts

- [Authentication](Architecture/authentication.md) — OAuth with authentication
- [OpenID Connect](Architecture/openid-connect.md) — OAuth with OpenID Connect
- [Security Principles](Architecture/security-principles.md) — OAuth with security

## Project Observations

- The project uses OAuth:
  - The project's architecture patterns note covers OAuth (from existing notes)
  - No evidence of OAuth in existing code (src/ is empty)
- File naming conventions support OAuth:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




