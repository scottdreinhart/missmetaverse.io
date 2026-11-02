---
slug: secure-defaults
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - secure-defaults
  - security
  - design
  - principles
---

# Secure Defaults

## Definition

Secure Defaults is **a security principle that systems should ship with the most secure configuration by default, requiring explicit action to reduce security**.

> "Secure defaults means that systems should ship with the most secure configuration by default." — OWASP

## Problem Addressed

Without secure defaults:
- **Insecure configurations**: Systems ship with insecure configurations
- **User error**: Users don't change insecure defaults
- **Security holes**: Security holes are introduced by default configurations
- **Compliance**: Regulations require secure defaults

## Scope and Boundaries

- Secure Defaults ≠ Security Testing (secure defaults prevent security issues through configuration, security testing finds them)
- Secure Defaults = Configuration (secure defaults are about configuration)
- Secure Defaults is a **security principle**, not a pattern

## When to Apply

- When building systems that ship with configurations
- when security is critical
- when users may not change configurations
- when compliance requires secure defaults

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Usability** — Secure defaults may reduce usability |
| **Complexity** — Secure defaults add configuration complexity |
| **Time** — Designing secure defaults takes time |

## Common Misuses

- **Everything secure by default**: Not every configuration needs secure defaults
- **Ignoring usability**: Secure defaults should not severely impact usability
- **Confusing with secure by design**: Secure defaults is about configuration, secure by design is about design

## Related Concepts

- [Security Principles](Security/security-principles.md) — Security principles include secure defaults
- [Secure by Design](Security/secure-by-design.md) — Secure by design includes secure defaults
- [Deny by Default](Security/deny-by-default.md) — Deny by default is related to secure defaults

## Project Observations

- The project uses secure defaults:
  - TypeScript supports secure defaults through strict mode
  - Vite supports secure defaults through secure configuration
  - The project's architecture patterns note covers security concepts
  - No evidence of secure defaults in existing code (src/ is empty)
- File naming conventions support secure defaults:
  - `*.config.ts` — Config files
  - `*.env.ts` — Environment files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

