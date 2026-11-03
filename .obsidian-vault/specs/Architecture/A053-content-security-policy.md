---
slug: content-security-policy
sources:
  - https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP
  - https://content-security-policy.com/
date: 2026-11-02
tags:
  - csp
  - security
  - web
  - patterns
  - --
# Content Security Policy

## Definition

Content Security Policy (CSP) is a **security standard for preventing cross-site scripting (XSS) attacks**.

> "Content Security Policy is an added layer of security that helps to detect and mitigate certain types of attacks." â€” MDN

## Problem Addressed

Without CSP:
- **XSS attacks**: XSS attacks succeed
- **Security**: Web application is insecure
- **Data breaches**: Data is exposed
- **Compliance**: Hard to meet compliance requirements

## Scope and Boundaries

- CSP â‰  CORS (CSP is for XSS prevention, CORS is for cross-origin requests)
- CSP â‰  Security (CSP is a security standard, security is broader)
- CSP is a **security standard**, not a security feature

## When to Apply

- When building web applications
- when XSS prevention matters
- when security is important
- when compliance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” CSP is complex |
| **Time** â€” CSP takes time |
| **Over-CSP** â€” Don't use CSP for everything |

## Common Misuses

- **Everything CSP**: Not everything needs CSP
- **Confusing with CORS**: CSP â‰  CORS
- **Over-CSP**: Too much CSP creates complexity

## Related Concepts

- [Security Principles](Architecture/security-principles.md) â€” CSP with security
- [CORS Patterns](Architecture/cors-patterns.md) â€” CSP with CORS
- [Authentication](Architecture/authentication.md) â€” CSP with authentication

## Project Observations

- The project uses CSP:
  - The project's architecture patterns note covers CSP (from existing notes)
  - No evidence of CSP in existing code (src/ is empty)
- File naming conventions support CSP:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]





