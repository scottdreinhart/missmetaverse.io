---
slug: separation-of-duties
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - separation-of-duties
  - security
  - access-control
  - compliance
---

# Separation of Duties

## Definition

Separation of Duties is **a security principle that critical tasks require multiple people to complete, preventing any single person from having too much power**.

> "Separation of duties is a key internal control concept that aims to reduce the risk of error and inappropriate behavior." — OWASP

## Problem Addressed

Without separation of duties:
- **Too much power**: Any single person can perform critical tasks
- **Fraud**: Fraud can be committed by a single person
- **Errors**: Errors go undetected
- **Compliance**: Regulations require separation of duties

## Scope and Boundaries

- Separation of Duties ≠ RBAC (separation of duties is a principle, RBAC is an implementation)
- Separation of Duties = Prevention (separation of duties prevents abuse)
- Separation of Duties is a **security principle**, not a pattern

## When to Apply

- When building systems with critical tasks
- when fraud prevention is important
- when compliance requires separation of duties
- when multiple roles exist

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Separation of duties adds complexity |
| **Time** — Implementing separation of duties takes time |
| **Overhead**: More people needed for critical tasks |

## Common Misuses

- **Everything separated**: Not every task needs separation
- **Ignoring small teams**: Small teams may not be able to separate duties
- **Confusing with RBAC**: Separation of duties is a principle, RBAC is an implementation

## Related Concepts

- [RBAC](Security/rbac.md) — RBAC implements separation of duties
- [Authorization](Security/authorization.md) — Authorization enforces separation of duties
- [Security Principles](Security/security-principles.md) — Security principles include separation of duties

## Project Observations

- The project uses separation of duties:
  - TypeScript can enforce separation of duties through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of separation of duties in existing code (src/ is empty)
- File naming conventions support separation of duties:
  - `*.guard.ts` — Guard files
  - `*.middleware.ts` — Middleware files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
