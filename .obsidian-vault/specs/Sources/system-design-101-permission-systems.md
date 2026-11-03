---
slug: system-design-101-permission-systems
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - security
  - access-control
  - reference
---

# Designing a Permission System

## Overview

Reference: [Guide: how-do-we-design-a-permission-system](https://bytebytego.com/guides/how-do-we-design-a-permission-system)

This guide covers common permission system designs including ACL, DAC, MAC, ABAC, and RBAC.

## Permission Models

### 1. ACL (Access Control List)
- Associates permissions with resources
- Each resource has a list of allowed users/roles
- Example: File permissions (read, write, execute)
- Pros: Simple, granular control
- Cons: Hard to manage at scale

### 2. DAC (Discretionary Access Control)
- Resource owners control access
- Owners can grant/revoke permissions
- Example: GitHub repository permissions
- Pros: Flexible, decentralized
- Cons: Security risks, inconsistent policies

### 3. MAC (Mandatory Access Control)
- System-enforced access control
- Labels determine access (top secret, confidential)
- Example: Military systems, government
- Pros: Highly secure, consistent
- Cons: Inflexible, complex

### 4. ABAC (Attribute-Based Access Control)
- Access based on attributes (user, resource, environment)
- Policies define rules
- Example: "Users can access documents if department matches"
- Pros: Flexible, scalable, fine-grained
- Cons: Complex, performance overhead

### 5. RBAC (Role-Based Access Control)
- Access based on roles
- Users assigned to roles
- Roles have permissions
- Example: Admin, Manager, User roles
- Pros: Simple, easy to manage
- Cons: Role explosion, rigid

## Comparison Table

| Model | Granularity | Complexity | Scalability | Security | Best For |
|-------|-------------|------------|-------------|----------|----------|
| **ACL** | High | Medium | Poor | Medium | Small systems |
| **DAC** | High | Low | Good | Low | Collaborative systems |
| **MAC** | Medium | High | Poor | High | Military/government |
| **ABAC** | Very High | High | Good | Very High | Enterprise systems |
| **RBAC** | Medium | Low | Good | Good | Most applications |

## Implementation Example

### RBAC Implementation

```typescript
// auth/rbac.ts
export enum Role {
  ADMIN = 'admin',
  MANAGER = 'manager',
  USER = 'user',
}

export const permissions: Record<Role, string[]> = {
  [Role.ADMIN]: ['user:read', 'user:write', 'user:delete', 'settings:read', 'settings:write'],
  [Role.MANAGER]: ['user:read', 'user:write', 'settings:read'],
  [Role.USER]: ['user:read'],
}

export function hasPermission(userRole: Role, permission: string): boolean {
  return permissions[userRole]?.includes(permission) || false
}
```

### ABAC Implementation

```typescript
// auth/abac.ts
interface Policy {
  resource: string
  action: string
  condition: (user: User, resource: Resource) => boolean
}

interface User {
  id: string
  role: string
  department: string
  clearanceLevel: number
}

interface Resource {
  id: string
  type: string
  department: string
  sensitivity: number
}

const policies: Policy[] = [
  {
    resource: 'document',
    action: 'read',
    condition: (user, resource) => user.department === resource.department,
  },
  {
    resource: 'confidential',
    action: 'read',
    condition: (user, resource) => user.clearanceLevel >= resource.sensitivity,
  },
]

export function checkAccess(user: User, resource: Resource, action: string): boolean {
  return policies.some(
    (policy) =>
      policy.resource === resource.type &&
      policy.action === action &&
      policy.condition(user, resource),
  )
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [rbac](D/rbac.md) — Role-Based Access Control patterns
- [abac](D/abac.md) — Attribute-Based Access Control
- [separation-of-duties](D/separation-of-duties.md) — Separation of duties implementation
- [authorization](D/authorization.md) — Authorization patterns
- [security-principles](D/security-principles.md) — Security best practices

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [permission-system-guide](https://bytebytego.com/guides/how-do-we-design-a-permission-system)
