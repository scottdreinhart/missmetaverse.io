---
slug: security-testing
sources:
  - https://owasp.org/www-project-web-security-testing-guide/
  - https://owasp.org/www-project-top-ten/
date: 2026-11-02
tags:
  - security-testing
  - owasp
  - testing
  - patterns
  - --
# Security Testing

## Definition

Security Testing is a **practice for testing software for security vulnerabilities**.

> "Security testing is a process intended to reveal flaws in the security mechanisms of information system products." â€” Wikipedia

## Problem Addressed

Without security testing:
- **Vulnerabilities**: Software has security vulnerabilities
- **Data breaches**: Sensitive data is exposed
- **Compliance**: Software doesn't meet compliance requirements
- **Trust**: Users don't trust the software

## Scope and Boundaries

- Security Testing â‰  Penetration Testing (security testing is broader, penetration testing is specific)
- Security Testing â‰  OWASP (security testing is a practice, OWASP is a standard)
- Security Testing is a **practice**, not a standard

## When to Apply

- When building software
- when security matters
- when compliance is important
- when building for users

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Security testing is complex |
| **Time** â€” Security testing takes time |
| **Over-security-testing** â€” Don't over-test security |

## Common Misuses

- **Everything security tested**: Not everything needs security testing
- **Confusing with penetration testing**: Security testing â‰  penetration testing
- **Over-security-testing**: Too much security testing creates complexity

## Related Concepts

- [OWASP Top 10](Architecture/owasp-top-10.md) â€” Security testing with OWASP
- [Security Principles](Architecture/security-principles.md) â€” Security testing with security
- [Automated Testing](Architecture/automated-testing.md) â€” Security testing with automated testing

## Project Observations

- The project uses security testing:
  - The project's security note covers security testing (from existing notes)
  - No evidence of security testing in existing code (src/ is empty)
- File naming conventions support security testing:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]






