---
slug: rbac
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - rbac
  - security
  - access-control
  - authorization
---

# Role-Based Access Control (RBAC)

## Definition

Role-Based Access Control (RBAC) is **an access control model where permissions are assigned to roles, and users are assigned to roles**.

> "RBAC is an access control model where permissions are assigned to roles, and users are assigned to roles." — NIST

## Problem Addressed

Without RBAC:
- **Complex permissions**: Permissions are complex to manage
- **User management**: User permissions are hard to manage
- **Compliance**: Compliance requires role-based access
- **Security**: Security is hard to enforce

## Scope and Boundaries

- RBAC ≠ ABAC (RBAC uses roles, ABAC uses attributes)
- RBAC = Roles (RBAC uses roles for access control)
- RBAC is an **access control model**, not a pattern

## When to Apply

- When building systems with access control
- when roles exist in the system
- when compliance requires role-based access
- when user management is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — RBAC adds access control complexity |
| **Time** — Implementing RBAC takes time |
| **Rigidity**: RBAC may not support all access patterns |

## Common Misuses

- **Everything a role**: Not every permission needs a role
- **Role explosion**: Too many roles create complexity
- **Confusing with ABAC**: RBAC uses roles, ABAC uses attributes

## Related Concepts

- [Authorization](Security/authorization.md) — Authorization uses RBAC
- [Separation of Duties](Security/separation-of-duties.md) — Separation of duties is implemented through RBAC
- [ABAC](Security/abac.md) — ABAC is an alternative to RBAC

## Project Observations

- The project uses RBAC:
  - TypeScript can enforce RBAC through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of RBAC in existing code (src/ is empty)
- File naming conventions support RBAC:
  - `*.guard.ts` — Guard files
  - `*.middleware.ts` — Middleware files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
