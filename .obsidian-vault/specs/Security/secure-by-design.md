---
slug: secure-by-design
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - secure-by-design
  - security
  - design
  - principles
---

# Secure by Design

## Definition

Secure by Design is **a security principle that security is built into the system from the beginning, not added as an afterthought**.

> "Secure by design means that security is built into the system from the beginning, not added as an afterthought." — OWASP

## Problem Addressed

Without secure by design:
- **Security holes**: Security holes are introduced during development
- **Rework**: Security requires significant rework
- **Cost**: Security fixes are expensive
- **Risk**: System is insecure until security is added

## Scope and Boundaries

- Secure by Design ≠ Security Testing (secure by design prevents security issues, security testing finds them)
- Secure by Design = Prevention (secure by design prevents security issues)
- Secure by Design is a **security principle**, not a pattern

## When to Apply

- When building secure systems
- when security is critical
- when security issues are expensive to fix
- when compliance requires secure by design

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Secure by design takes more time upfront |
| **Complexity** — Secure by design adds complexity |
| **Expertise**: Requires security expertise |

## Common Misuses

- **Ignoring testing**: Secure by design doesn't eliminate the need for security testing
- **One-time effort**: Secure by design is continuous, not one-time
- **Confusing with security testing**: Secure by design prevents security issues, security testing finds them

## Related Concepts

- [Security Principles](Security/security-principles.md) — Security principles include secure by design
- [Threat Modeling](Security/threat-modeling.md) — Threat modeling supports secure by design
- [Input Validation](Security/input-validation.md) — Input validation is part of secure by design

## Project Observations

- The project uses secure by design:
  - TypeScript supports secure by design through type system
  - Zod supports secure by design through validation
  - The project's architecture patterns note covers security concepts
  - No evidence of secure by design in existing code (src/ is empty)
- File naming conventions support secure by design:
  - `*.schema.ts` — Schema files
  - `*.guard.ts` — Guard files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

