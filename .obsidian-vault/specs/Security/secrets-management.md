---
slug: secrets-management
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - secrets-management
  - security
  - secrets
  - compliance
---

# Secrets Management

## Definition

Secrets Management is **the practice of securely storing, rotating, and accessing sensitive data such as passwords, API keys, and certificates**.

> "Secrets management is the practice of securely storing, rotating, and accessing sensitive data." — OWASP

## Problem Addressed

Without secrets management:
- **Exposed secrets**: Secrets are exposed in code or configuration
- **Rotation**: Secrets are not rotated regularly
- **Access**: Too many people have access to secrets
- **Compliance**: Regulations require secrets management

## Scope and Boundaries

- Secrets Management ≠ Data Encryption (secrets management manages secrets, data encryption protects data)
- Secrets Management = Protection (secrets management protects secrets)
- Secrets Management is a **security practice**, not a pattern

## When to Apply

- When building systems that handle secrets
- when compliance requires secrets management
- when security is important
- when multiple people access secrets

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Secrets management adds infrastructure complexity |
| **Time** — Implementing secrets management takes time |
| **Overhead**: Secrets management adds overhead |

## Common Misuses

- **Everything a secret**: Not every sensitive data point is a secret
- **Ignoring rotation**: Secrets must be rotated regularly
- **Confusing with encryption**: Secrets management manages secrets, data encryption protects data

## Related Concepts

- [Data Encryption](Security/data-encryption.md) — Data encryption protects secrets
- [Data Minimization](Security/data-minimization.md) — Data minimization limits secrets collection
- [Security Principles](Security/security-principles.md) — Security principles include secrets management

## Project Observations

- The project uses secrets management:
  - Node.js supports secrets management through environment variables
  - TypeScript can enforce secrets management through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of secrets management in existing code (src/ is empty)
- File naming conventions support secrets management:
  - `*.env.ts` — Environment files
  - `*.config.ts` — Config files

## Sources

- [[Sources/owasp-top-ten-2021|owasp-top-ten-2021]]
