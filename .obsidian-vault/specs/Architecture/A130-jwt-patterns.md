---
slug: jwt-patterns
sources:
  - https://jwt.io/
  - https://en.wikipedia.org/wiki/JSON_Web_Token
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
  - jwt
  - authentication
  - security
  - patterns
---

# JWT Patterns

## Definition

JWT Patterns are **design patterns for working with JSON Web Tokens for authentication and authorization**.

> "JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object." — JWT.io

## Problem Addressed

Without JWT patterns:
- **Security**: Authentication is insecure
- **User experience**: Poor user experience
- **Scalability**: Hard to scale authentication
- **Compliance**: Hard to meet compliance requirements

## Scope and Boundaries

- JWT ≠ OAuth (JWT is a token format, OAuth is an authorization protocol)
- JWT ≠ Authentication (JWT is a token format, authentication is a concept)
- JWT is a **token format**, not an authentication protocol

## When to Apply

- When building applications
- when authentication matters
- when user experience is important
- when compliance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — JWT is complex |
| **Time** — JWT takes time |
| **Over-JWT** — Don't use JWT for everything |

## Common Misuses

- **Everything JWT**: Not everything needs JWT
- **Confusing with OAuth**: JWT ≠ OAuth
- **Over-JWT**: Too much JWT creates complexity

## Related Concepts

- [OAuth Patterns](Architecture/oauth-patterns.md) — JWT with OAuth
- [OpenID Connect](Architecture/openid-connect.md) — JWT with OpenID Connect
- [Authentication](Architecture/authentication.md) — JWT with authentication

## Project Observations

- The project uses JWT:
  - The project's architecture patterns note covers JWT (from existing notes)
  - No evidence of JWT in existing code (src/ is empty)
- File naming conventions support JWT:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




