---
slug: cors-patterns
sources:
  - https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
  - https://en.wikipedia.org/wiki/Cross-origin_resource_sharing
date: 2026-11-02
tags:
  - cors
  - security
  - web
  - patterns
---

# CORS Patterns

## Definition

CORS Patterns are **design patterns for working with Cross-Origin Resource Sharing for web security**.

> "Cross-Origin Resource Sharing (CORS) is an HTTP-header based mechanism that allows a server to indicate any origins (domain, scheme, or port) other than its own from which a browser should permit loading resources." — MDN

## Problem Addressed

Without CORS patterns:
- **Security**: Cross-origin requests are insecure
- **Browser blocking**: Browsers block cross-origin requests
- **API access**: APIs are inaccessible from browsers
- **User experience**: Poor user experience

## Scope and Boundaries

- CORS ≠ Security (CORS is a browser security feature, security is broader)
- CORS ≠ API (CORS is a browser feature, API is a boundary)
- CORS is a **browser feature**, not a security feature

## When to Apply

- When building web applications
- when cross-origin requests matter
- when security is important
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — CORS is complex |
| **Time** — CORS takes time |
| **Over-CORS** — Don't use CORS for everything |

## Common Misuses

- **Everything CORS**: Not everything needs CORS
- **Confusing with security**: CORS ≠ security
- **Over-CORS**: Too much CORS creates complexity

## Related Concepts

- [Security Principles](Architecture/security-principles.md) — CORS with security
- [API Design](Architecture/rest-api-design.md) — CORS with API design
- [Authentication](Architecture/authentication.md) — CORS with authentication

## Project Observations

- The project uses CORS:
  - The project's architecture patterns note covers CORS (from existing notes)
  - No evidence of CORS in existing code (src/ is empty)
- File naming conventions support CORS:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

