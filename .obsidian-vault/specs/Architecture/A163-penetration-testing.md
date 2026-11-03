---
slug: penetration-testing
sources:
  - https://owasp.org/www-project-web-security-testing-guide/
  - https://owasp.org/www-project-top-ten/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/security
  - type/concept
  - status/complete
  - type/guide
  - domain/testing
  - status/complete
  - type/reference
  - domain/architecture
  - penetration-testing
  - owasp
  - testing
  - patterns
---

# Penetration Testing

## Definition

Penetration Testing is a **practice for testing software by simulating attacks**.

> "Penetration testing is an authorized simulated attack on a computer system, performed to evaluate its security." — Wikipedia

## Problem Addressed

Without penetration testing:
- **Vulnerabilities**: Software has security vulnerabilities
- **Data breaches**: Sensitive data is exposed
- **Compliance**: Software doesn't meet compliance requirements
- **Trust**: Users don't trust the software

## Scope and Boundaries

- Penetration Testing ≠ Security Testing (penetration testing is specific, security testing is broader)
- Penetration Testing ≠ OWASP (penetration testing is a practice, OWASP is a standard)
- Penetration Testing is a **practice**, not a standard

## When to Apply

- When building software
- when security matters
- when compliance is important
- when building for users

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Penetration testing is complex |
| **Time** — Penetration testing takes time |
| **Over-penetration-testing** — Don't over-test security |

## Common Misuses

- **Everything penetration tested**: Not everything needs penetration testing
- **Confusing with security testing**: Penetration testing ≠ security testing
- **Over-penetration-testing**: Too much penetration testing creates complexity

## Related Concepts

- [OWASP Top 10](Architecture/owasp-top-10.md) — Penetration testing with OWASP
- [Security Principles](Architecture/security-principles.md) — Penetration testing with security
- [Security Testing](Architecture/security-testing.md) — Penetration testing with security testing

## Project Observations

- The project uses penetration testing:
  - The project's security note covers penetration testing (from existing notes)
  - No evidence of penetration testing in existing code (src/ is empty)
- File naming conventions support penetration testing:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]





