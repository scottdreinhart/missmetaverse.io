---
slug: complete-mediation
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - complete-mediation
  - security
  - authentication
  - authorization
---

# Complete Mediation

## Definition

Complete Mediation is **a security principle that every access to every object must be checked for authorization**.

> "Complete mediation means that every access to every object must be checked for authorization." — OWASP

## Problem Addressed

Without complete mediation:
- **Bypassed checks**: Access checks are bypassed
- **Caching issues**: Cached authorization decisions are stale
- **Race conditions**: Race conditions allow unauthorized access
- **Security holes**: Security holes are introduced

## Scope and Boundaries

- Complete Mediation ≠ Caching (complete mediation checks every access, caching stores authorization decisions)
- Complete Mediation = Security (complete mediation ensures security)
- Complete Mediation is a **security principle**, not a pattern

## When to Apply

- When building secure systems
- when authorization is critical
- when security holes must be prevented
- when caching authorization decisions is considered

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Performance** — Checking every access adds overhead |
| **Complexity** — Complete mediation adds complexity |
| **Time** — Implementing complete mediation takes time |

## Common Misuses

- **Ignoring caching**: Caching authorization decisions can be safe if done correctly
- **One-time checks**: One-time checks at login are not complete mediation
- **Confusing with authentication**: Authentication verifies identity, authorization verifies access

## Related Concepts

- [Authentication](Security/authentication.md) — Authentication verifies identity
- [Authorization](Security/authorization.md) — Authorization verifies access
- [Security Principles](Security/security-principles.md) — Security principles include complete mediation

## Project Observations

- The project uses complete mediation:
  - TypeScript can enforce complete mediation through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of complete mediation in existing code (src/ is empty)
- File naming conventions support complete mediation:
  - `*.middleware.ts` — Middleware files
  - `*.guard.ts` — Guard files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
