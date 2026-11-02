---
slug: data-minimization
sources:
  - https://owasp.org/
  - https://gdpr.eu/
date: 2026-11-02
tags:
  - data-minimization
  - security
  - privacy
  - gdpr
---

# Data Minimization

## Definition

Data Minimization is **a privacy principle that only collect, process, and retain the minimum amount of personal data necessary for the stated purpose**.

> "Data minimization means that personal data shall be adequate, relevant, and limited to what is necessary for the purposes for which they are processed." — GDPR

## Problem Addressed

Without data minimization:
- **Privacy violations**: More data than necessary is collected
- **Compliance issues**: Regulations require data minimization
- **Security risk**: More data means more risk
- **Storage costs**: More data costs more to store

## Scope and Boundaries

- Data Minimization ≠ Retention Policies (data minimization limits collection, retention policies limit how long data is kept)
- Data Minimization = Privacy (data minimization protects privacy)
- Data Minimization is a **privacy principle**, not a pattern

## When to Apply

- When building systems that handle personal data
- when privacy regulations apply (GDPR, CCPA, etc.)
- when security is important
- when storage costs are a concern

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Functionality**: Less data may limit functionality |
| **Complexity**: Determining minimum data adds complexity |
| **Time**: Implementing data minimization takes time |

## Common Misuses

- **Everything minimized**: Not every data point needs to be minimized
- **Ignoring retention**: Data minimization applies to collection and retention
- **Confusing with encryption**: Data minimization limits collection, encryption protects data

## Related Concepts

- [Retention Policies](Data Databases/retention-policies.md) — Retention policies complement data minimization
- [Data Encryption](Security/data-encryption.md) — Data encryption protects data
- [Secrets Management](Security/secrets-management.md) — Secrets management protects sensitive data

## Project Observations

- The project uses data minimization:
  - TypeScript can enforce data minimization through type system
  - Zod can validate data minimization through schemas
  - The project's architecture patterns note covers security concepts
  - No evidence of data minimization in existing code (src/ is empty)
- File naming conventions support data minimization:
  - `*.schema.ts` — Schema files
  - `*.types.ts` — Type files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

