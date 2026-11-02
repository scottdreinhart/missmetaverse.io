---
slug: output-encoding
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - output-encoding
  - security
  - xss
  - encoding
---

# Contextual Output Encoding

## Definition

Contextual Output Encoding is **a security technique that encodes data based on the context in which it will be rendered to prevent injection attacks**.

> "Output encoding encodes data based on the context in which it will be rendered to prevent injection attacks." — OWASP

## Problem Addressed

Without output encoding:
- **XSS attacks**: Cross-site scripting attacks succeed
- **Injection attacks**: Injection attacks succeed
- **Data corruption**: Data is corrupted by injection
- **Security holes**: Security holes are introduced

## Scope and Boundaries

- Output Encoding ≠ Input Validation (output encoding encodes data on output, input validation validates data on input)
- Output Encoding = Protection (output encoding protects against injection)
- Output Encoding is a **security technique**, not a pattern

## When to Apply

- When building web applications
- when user input is rendered in the browser
- when XSS attacks are a concern
- when injection attacks are a concern

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Contextual encoding adds complexity |
| **Time** — Implementing contextual encoding takes time |
| **Display**: Encoded data may display differently |

## Common Misuses

- **Everything encoded**: Not every output needs encoding
- **Wrong context**: Encoding must match the context (HTML, JavaScript, CSS, etc.)
- **Confusing with input validation**: Output encoding encodes data on output, input validation validates data on input

## Related Concepts

- [Input Validation](Security/input-validation.md) — Input validation complements output encoding
- [Content Security Policy](Security/content-security-policy.md) — Content security policy complements output encoding
- [Security Principles](Security/security-principles.md) — Security principles include output encoding

## Project Observations

- The project uses output encoding:
  - React automatically encodes output
  - TypeScript can enforce output encoding through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of output encoding in existing code (src/ is empty)
- File naming conventions support output encoding:
  - `*.encoder.ts` — Encoder files
  - `*.guard.ts` — Guard files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
