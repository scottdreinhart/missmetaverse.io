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

---

## Decision Tree: ABAC Policy Design

```mermaid
graph TD
    A[Need access control?]\n    A --> B{Simple?}
    B -->|Yes| C[RBAC]
    B -->|No| D[ABAC]
    C --> E{Roles enough?}
    E -->|Yes| F[Role-based]
    E -->|No| G[ABAC]
    D --> H{What attributes?}
    H -->|User| I[User attributes]
    H -->|Resource| J[Resource attributes]
    H -->|Environment| K[Environment attributes]
    I --> L{Dynamic?}
    L -->|Yes| M[Policy engine]
    L -->|No| N[Static rules]
```

### When to Use ABAC

| Situation | Action | Example |
|-----------|--------|---------|
| **Complex permissions** | ABAC policies | Department + Location |
| **Context matters** | Environment attributes | Time, IP, device |
| **Dynamic access** | Policy engine | OPA, Cedar |
| **RBAC too rigid** | ABAC attributes | Role + Department |

---

## Procedural Guidance: ABAC Implementation

### Step 1: Define Attributes

```typescript
// security/attributes/user-attributes.ts
export interface UserAttributes {
  id: string
  role: 'admin' | 'manager' | 'user'
  department: string
  location: string
  clearanceLevel: number
  isActive: boolean
}

// security/attributes/resource-attributes.ts
export interface ResourceAttributes {
  id: string
  type: 'document' | 'record' | 'file'
  sensitivity: 'public' | 'internal' | 'confidential' | 'restricted'
  owner: string
  department: string
  createdAt: Date
}

// security/attributes/environment-attributes.ts
export interface EnvironmentAttributes {
  timestamp: Date
  ip_address: string
  device_id: string
  location: string
  is_secure_network: boolean
}
```

### Step 2: Define Policy

```typescript
// security/policies/access-policy.ts
import { UserAttributes } from '../attributes/user-attributes'
import { ResourceAttributes } from '../attributes/resource-attributes'
import { EnvironmentAttributes } from '../attributes/environment-attributes'

export interface AccessPolicy {
  effect: 'allow' | 'deny'
  conditions: (
    user: UserAttributes,
    resource: ResourceAttributes,
    environment: EnvironmentAttributes,
  ) => boolean
}

// Policy: Admins can access everything
export const adminPolicy: AccessPolicy = {
  effect: 'allow',
  conditions: (user) => user.role === 'admin',
}

// Policy: Managers can access their department's confidential docs
export const managerPolicy: AccessPolicy = {
  effect: 'allow',
  conditions: (user, resource) =>
    user.role === 'manager' &&
    user.department === resource.department &&
    (resource.sensitivity === 'confidential' || resource.sensitivity === 'internal'),
}

// Policy: Users can access public resources
export const userPolicy: AccessPolicy = {
  effect: 'allow',
  conditions: (user, resource) =>
    user.isActive && resource.sensitivity === 'public',
}

// Policy: No access during non-business hours for restricted
export const timePolicy: AccessPolicy = {
  effect: 'deny',
  conditions: (_user, resource, env) =>
    resource.sensitivity === 'restricted' &&
    (env.timestamp.getHours() < 8 || env.timestamp.getHours() > 18),
}
```

### Step 3: Implement Policy Engine

```typescript
// security/policy-engine.ts
import { AccessPolicy } from './policies/access-policy'
import { UserAttributes } from './attributes/user-attributes'
import { ResourceAttributes } from './attributes/resource-attributes'
import { EnvironmentAttributes } from './attributes/environment-attributes'

export class PolicyEngine {
  private policies: AccessPolicy[]

  constructor() {
    this.policies = [
      adminPolicy,
      managerPolicy,
      userPolicy,
      timePolicy,
    ]
  }

  evaluate(
    user: UserAttributes,
    resource: ResourceAttributes,
    environment: EnvironmentAttributes,
  ): boolean {
    // Check deny policies first
    for (const policy of this.policies) {
      if (policy.effect === 'deny' && policy.conditions(user, resource, environment)) {
        return false
      }
    }

    // Check allow policies
    for (const policy of this.policies) {
      if (policy.effect === 'allow' && policy.conditions(user, resource, environment)) {
        return true
      }
    }

    // Default deny
    return false
  }

  addPolicy(policy: AccessPolicy): void {
    this.policies.push(policy)
  }

  removePolicy(policy: AccessPolicy): void {
    this.policies = this.policies.filter(p => p !== policy)
  }
}
```

### Step 4: Use in Middleware

```typescript
// middleware/abac.middleware.ts
import { Request, Response, NextFunction } from 'express'
import { PolicyEngine } from '../security/policy-engine'

const policyEngine = new PolicyEngine()

export function abacMiddleware(
  requiredPolicy: string,
  attributeExtractor: (req: Request) => {
    user: any
    resource: any
    environment: any
  },
) {
  return (req: Request, res: Response, next: NextFunction) => {
    try {
      const attributes = attributeExtractor(req)
      const allowed = policyEngine.evaluate(
        attributes.user,
        attributes.resource,
        attributes.environment,
      )

      if (!allowed) {
        return res.status(403).json({ error: 'Access denied' })
      }

      next()
    } catch (error) {
      return res.status(500).json({ error: 'Policy evaluation failed' })
    }
  }
}

// Usage
app.get('/documents/:id',
  abacMiddleware('read', (req) => ({
    user: req.user,
    resource: { id: req.params.id, ...document },
    environment: {
      timestamp: new Date(),
      ip_address: req.ip,
      device_id: req.headers['device-id'] as string,
    },
  })),
  getDocumentHandler,
)
```

### Step 5: Test Policies

```typescript
// tests/abac.test.ts
import { describe, it, expect } from 'vitest'
import { PolicyEngine } from '../security/policy-engine'
import type { UserAttributes } from '../security/attributes/user-attributes'
import type { ResourceAttributes } from '../security/attributes/resource-attributes'
import type { EnvironmentAttributes } from '../security/attributes/environment-attributes'

describe('PolicyEngine', () => {
  const engine = new PolicyEngine()

  const adminUser: UserAttributes = {
    id: 'admin-1',
    role: 'admin',
    department: 'IT',
    location: 'HQ',
    clearanceLevel: 5,
    isActive: true,
  }

  const confidentialResource: ResourceAttributes = {
    id: 'doc-1',
    type: 'document',
    sensitivity: 'confidential',
    owner: 'admin-1',
    department: 'IT',
    createdAt: new Date(),
  }

  it('should allow admin access', () => {
    const env: EnvironmentAttributes = {
      timestamp: new Date(),
      ip_address: '192.168.1.1',
      device_id: 'device-1',
      location: 'HQ',
      is_secure_network: true,
    }

    expect(engine.evaluate(adminUser, confidentialResource, env)).toBe(true)
  })

  it('should deny user access to confidential', () => {
    const regularUser: UserAttributes = {
      id: 'user-1',
      role: 'user',
      department: 'Sales',
      location: 'Branch',
      clearanceLevel: 1,
      isActive: true,
    }

    const env: EnvironmentAttributes = {
      timestamp: new Date(),
      ip_address: '192.168.1.1',
      device_id: 'device-1',
      location: 'Branch',
      is_secure_network: true,
    }

    expect(engine.evaluate(regularUser, confidentialResource, env)).toBe(false)
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Implementing ABAC access control
- Designing access policies
- Building policy engines
- Creating middleware for authorization
- Testing access control

### What to Do With This Information
1. **Define attributes**: User, resource, and environment attributes
2. **Create policies**: Allow/deny rules based on attributes
3. **Policy engine**: Evaluate policies in order (deny first)
4. **Middleware**: Use ABAC in Express/Fastify middleware
5. **Test policies**: Verify access control with unit tests

### Tools to Use
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `express` — for middleware
- **npm Package**: `vitest` — for testing policies
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm audit` — check for vulnerabilities

### Agents to Invoke
- **Security Review Agent**: Run when adding new ABAC policies
- **Code Review Agent**: Run when reviewing PRs with authorization changes

### Integration with Other Notes
- Read [security-principles](D/security-principles.md) for security principles
- read [[rbac]] for RBAC patterns
- read [authorization](D/authorization.md) for authorization patterns
- read [input-validation](D/input-validation.md) for input validation
- read [[separation-of-duties]] for separation of duties

### Common Pitfalls
- Don't use ABAC for simple systems (use RBAC)
- Don't forget deny policies (evaluate deny first)
- Don't hardcode policies (use policy engine)
- Don't skip testing (verify all access scenarios)
- Don't expose sensitive attributes in logs

### Quick Validation Checklist
- [ ] Are attributes properly defined?
- [ ] Are deny policies evaluated first?
- [ ] Is default deny implemented?
- [ ] Are policies tested?
- [ ] Is middleware properly configured?
- [ ] Are sensitive attributes protected?

