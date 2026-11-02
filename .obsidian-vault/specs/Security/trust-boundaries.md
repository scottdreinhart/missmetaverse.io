---
slug: trust-boundaries
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - trust-boundaries
  - security
  - architecture
  - design
---

# Trust Boundaries

## Definition

Trust Boundaries is **a security concept that defines the points where data crosses from one trust level to another, requiring validation and authentication**.

> "A trust boundary is a point where data crosses from one trust level to another. At each trust boundary, data must be treated as untrusted." — OWASP

## Problem Addressed

Without trust boundaries:
- **Untrusted data**: Data from untrusted sources is trusted
- **Injection attacks**: Injection attacks succeed
- **Authentication bypass**: Authentication is bypassed
- **Security holes**: Security holes are introduced

## Scope and Boundaries

- Trust Boundaries ≠ Authentication (trust boundaries define where authentication is needed, authentication verifies identity)
- Trust Boundaries = Validation (trust boundaries require validation)
- Trust Boundaries is a **security concept**, not a pattern

## When to Apply

- When building secure systems
- when data crosses trust levels
- when authentication is needed
- when validation is required

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Trust boundaries add validation complexity |
| **Time** — Identifying trust boundaries takes time |
| **Performance**: Validation adds overhead |

## Common Misuses

- **Ignoring boundaries**: Trust boundaries must be identified and enforced
- **One-time checks**: Trust boundaries must be checked at every crossing
- **Confusing with authentication**: Trust boundaries define where authentication is needed, authentication verifies identity

## Related Concepts

- [Authentication](Security/authentication.md) — Authentication is needed at trust boundaries
- [Input Validation](Security/input-validation.md) — Input validation is needed at trust boundaries
- [Security Principles](Security/security-principles.md) — Security principles include trust boundaries

## Project Observations

- The project uses trust boundaries:
  - TypeScript can enforce trust boundaries through type system
  - Zod can validate data at trust boundaries
  - The project's architecture patterns note covers security concepts
  - No evidence of trust boundaries in existing code (src/ is empty)
- File naming conventions support trust boundaries:
  - `*.guard.ts` — Guard files
  - `*.middleware.ts` — Middleware files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
