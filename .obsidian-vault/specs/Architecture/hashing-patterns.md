---
slug: hashing-patterns
sources:
  - https://en.wikipedia.org/wiki/Cryptographic_hash_function
  - https://nodejs.org/api/crypto.html
date: 2026-11-02
tags:
  - hashing
  - security
  - cryptography
  - patterns
---

# Hashing Patterns

## Definition

Hashing Patterns are **design patterns for working with cryptographic hash functions**.

> "A hash function is any function that maps larger inputs to smaller outputs in a deterministic way." — Wikipedia

## Problem Addressed

Without hashing patterns:
- **Security**: Data is insecure
- **Integrity**: Data integrity is hard to verify
- **Storage**: Data storage is inefficient
- **Verification**: Data verification is hard

## Scope and Boundaries

- Hashing ≠ Encryption (hashing is not reversible, encryption is reversible)
- Hashing ≠ Encoding (hashing is for security, encoding is for format)
- Hashing is a **technique**, not an encryption technique

## When to Apply

- When building applications
- when security matters
- when integrity is important
- when verification is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Hashing is complex |
| **Time** — Hashing takes time |
| **Over-hashing** — Don't hash everything |

## Common Misuses

- **Everything hashed**: Not everything needs hashing
- **Confusing with encryption**: Hashing ≠ encryption
- **Over-hashing**: Too much hashing creates complexity

## Related Concepts

- [Data Encryption](Architecture/data-encryption.md) — Hashing with encryption
- [Security Principles](Architecture/security-principles.md) — Hashing with security
- [Authentication](Architecture/authentication.md) — Hashing with authentication

## Project Observations

- The project uses hashing:
  - The project's architecture patterns note covers hashing (from existing notes)
  - No evidence of hashing in existing code (src/ is empty)
- File naming conventions support hashing:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

