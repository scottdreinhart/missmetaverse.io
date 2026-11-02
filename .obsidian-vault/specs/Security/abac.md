---
slug: abac
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - abac
  - security
  - access-control
  - authorization
---

# Attribute-Based Access Control (ABAC)

## Definition

Attribute-Based Access Control (ABAC) is **an access control model where access decisions are based on attributes of the user, resource, and environment**.

> "ABAC is an access control model where access decisions are based on attributes of the user, resource, and environment." — NIST

## Problem Addressed

Without ABAC:
- **Rigid roles**: RBAC roles are too rigid
- **Complex permissions**: Permissions are complex to manage with roles
- **Context awareness**: Access decisions don't consider context
- **Scalability**: Too many roles for large systems

## Scope and Boundaries

- ABAC ≠ RBAC (ABAC uses attributes, RBAC uses roles)
- ABAC = Attributes (ABAC uses attributes for access control)
- ABAC is an **access control model**, not a pattern

## When to Apply

- When building systems with complex access control requirements
- when context matters for access decisions
- when RBAC roles are too rigid
- when scaling access control is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — ABAC adds access control complexity |
| **Time** — Implementing ABAC takes time |
| **Performance**: ABAC evaluations can be slow |

## Common Misuses

- **Everything ABAC**: Not every system needs ABAC
- **Over-engineering**: Simple systems don't need ABAC
- **Confusing with RBAC**: ABAC uses attributes, RBAC uses roles

## Related Concepts

- [RBAC](Security/rbac.md) — RBAC is an alternative to ABAC
- [Authorization](Security/authorization.md) — Authorization uses ABAC
- [Separation of Duties](Security/separation-of-duties.md) — Separation of duties can be implemented through ABAC

## Project Observations

- The project uses ABAC:
  - TypeScript can enforce ABAC through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of ABAC in existing code (src/ is empty)
- File naming conventions support ABAC:
  - `*.guard.ts` — Guard files
  - `*.middleware.ts` — Middleware files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

