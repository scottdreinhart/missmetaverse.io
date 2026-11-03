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
---

# Authentication

## Definition

Authentication is a **security mechanism that verifies the identity of a user, system, or service**.

> "Authentication is the process of verifying the identity of a user, system, or service." — OAuth.net

## Problem Addressed

Without authentication:
- **Unauthorized access**: Anyone can access the system
- **Data breaches**: Sensitive data is exposed
- **Compliance**: Software doesn't meet compliance requirements
- **Trust**: Users don't trust the system

## Scope and Boundaries

- Authentication ≠ Authorization (authentication verifies identity, authorization verifies permissions)
- Authentication ≠ Security (authentication is specific, security is broader)
- Authentication is a **security mechanism**, not a specific technique

## When to Apply

- When building software
- When security matters
- When compliance is important
- When building for users

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Authentication is complex |
| **Time** — Authentication takes time |
| **User experience** — Authentication can be frustrating |

## Common Misuses

- **Everything authenticated**: Not everything needs authentication
- **Confusing with authorization**: Authentication ≠ authorization
- **Over-authentication**: Too much authentication creates complexity

## Related Concepts

- [Security Principles](Architecture/security-principles.md) — Authentication with security
- [OAuth](Architecture/oauth.md) — Authentication with OAuth
- [OpenID Connect](Architecture/openid-connect.md) — Authentication with OpenID Connect

## Project Observations

- The project uses authentication:
  - The project's security note covers authentication (from existing notes)
  - No evidence of authentication in existing code (src/ is empty)
- File naming conventions support authentication:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




