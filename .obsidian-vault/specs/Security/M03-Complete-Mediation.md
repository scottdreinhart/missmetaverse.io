---
slug: complete-mediation
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - complete-mediation
  - security
  - authentication
  - authorization
  - --
# Complete Mediation

## Definition

Complete Mediation is **a security principle that every access to every object must be checked for authorization**.

> "Complete mediation means that every access to every object must be checked for authorization." â€” OWASP

## Problem Addressed

Without complete mediation:
- **Bypassed checks**: Access checks are bypassed
- **Caching issues**: Cached authorization decisions are stale
- **Race conditions**: Race conditions allow unauthorized access
- **Security holes**: Security holes are introduced

## Scope and Boundaries

- Complete Mediation â‰  Caching (complete mediation checks every access, caching stores authorization decisions)
- Complete Mediation = Security (complete mediation ensures security)
- Complete Mediation is a **security principle**, not a pattern

## When to Apply

- When building secure systems
- when authorization is critical
- when security holes must be prevented
- when caching authorization decisions is considered

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Performance** â€” Checking every access adds overhead |
| **Complexity** â€” Complete mediation adds complexity |
| **Time** â€” Implementing complete mediation takes time |

## Common Misuses

- **Ignoring caching**: Caching authorization decisions can be safe if done correctly
- **One-time checks**: One-time checks at login are not complete mediation
- **Confusing with authentication**: Authentication verifies identity, authorization verifies access

## Related Concepts

- [Authentication](Security/authentication.md) â€” Authentication verifies identity
- [Authorization](Security/authorization.md) â€” Authorization verifies access
- [Security Principles](Security/security-principles.md) â€” Security principles include complete mediation

## Project Observations

- The project uses complete mediation:
  - TypeScript can enforce complete mediation through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of complete mediation in existing code (src/ is empty)
- File naming conventions support complete mediation:
  - `*.middleware.ts` â€” Middleware files
  - `*.guard.ts` â€” Guard files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: Complete Mediation Implementation

```mermaid
graph TD
    A[Need authorization check?]\n    A --> B{Every access?}
    B -->|Yes| C[Complete mediation]
    B -->|No| D[Skip â€” not secure]
    C --> E{Cached decision?}
    E -->|Yes| F{Valid?}
    F -->|Yes| G[Use cache]
    F -->|No| H[Re-evaluate]
    E -->|No| H
    H --> I[Check authorization]
    I --> J{Allowed?}
    J -->|Yes| K[Grant access]
    J -->|No| L[Deny access]
```

### When to Use Complete Mediation

| Situation | Action | Example |
|-----------|--------|---------|
| **Every access** | Complete mediation | API endpoints |
| **Cached decisions** | Validate cache | Token validation |
| **Race conditions** | Re-check | Concurrent requests |
| **Critical resources** | Always check | Admin operations |

---

## Procedural Guidance: Complete Mediation Implementation

### Step 1: Implement Authorization Middleware

```typescript
// middleware/authorization.middleware.ts
import { Request, Response, NextFunction } from 'express'
import { PermissionChecker } from '@/security/permission-checker'

export function authorize(
  requiredPermission: string,
  options?: {
    attributeExtractor?: (req: Request) => string
    customCheck?: (req: Request, resource: string) => Promise<boolean>
  },
) {
  return async (req: Request, res: Response, next: NextFunction) => {
    try {
      // Extract resource identifier
      const resourceId = options?.attributeExtractor
        ? options.attributeExtractor(req)
        : req.params.id || req.body.id

      // Custom check if provided
      if (options?.customCheck) {
        const allowed = await options.customCheck(req, resourceId)
        if (!allowed) {
          return res.status(403).json({ error: 'Access denied' })
        }
        return next()
      }

      // Check permission
      const permissionChecker = new PermissionChecker(req.user)
      const allowed = await permissionChecker.hasPermission(
        requiredPermission,
        resourceId,
      )

      if (!allowed) {
        return res.status(403).json({ error: 'Access denied' })
      }

      next()
    } catch (error) {
      return res.status(500).json({ error: 'Authorization failed' })
    }
  }
}
```

### Step 2: Implement Permission Checker

```typescript
// security/permission-checker.ts
import { UserAttributes } from './attributes/user-attributes'

export class PermissionChecker {
  private user: UserAttributes

  constructor(user: UserAttributes) {
    this.user = user
  }

  async hasPermission(permission: string, resourceId?: string): Promise<boolean> {
    // Admin has all permissions
    if (this.user.role === 'admin') {
      return true
    }

    // Check specific permissions
    if (permission === 'user:read') {
      return this.checkUserRead(resourceId)
    }

    if (permission === 'user:write') {
      return this.checkUserWrite(resourceId)
    }

    if (permission === 'user:delete') {
      return this.checkUserDelete(resourceId)
    }

    // Default deny
    return false
  }

  private async checkUserRead(resourceId?: string): Promise<boolean> {
    if (!resourceId) return false
    
    // Users can read their own profile
    if (resourceId === this.user.id) return true
    
    // Managers can read their department
    if (this.user.role === 'manager') {
      return await this.isInDepartment(resourceId)
    }
    
    return false
  }

  private async checkUserWrite(resourceId?: string): Promise<boolean> {
    if (!resourceId) return false
    
    // Users can write their own profile
    if (resourceId === this.user.id) return true
    
    // Managers can write their department
    if (this.user.role === 'manager') {
      return await this.isInDepartment(resourceId)
    }
    
    return false
  }

  private async checkUserDelete(resourceId?: string): Promise<boolean> {
    // Only admins can delete users
    return this.user.role === 'admin' && resourceId === this.user.id
  }

  private async isInDepartment(resourceId: string): Promise<boolean> {
    // Check if resource is in user's department
    // Implementation depends on data source
    return true
  }
}
```

### Step 3: Use in Routes

```typescript
// routes/user.routes.ts
import { Router } from 'express'
import { authorize } from '@/middleware/authorization.middleware'

const router = Router()

// GET /users/:id â€” Anyone can read public profiles
router.get('/users/:id', authorize('user:read'))

// PUT /users/:id â€” Users can update their own profile
router.put(
  '/users/:id',
  authorize('user:write', {
    attributeExtractor: (req) => req.params.id,
  }),
  updateUserHandler,
)

// DELETE /users/:id â€” Only admins can delete
router.delete('/users/:id', authorize('user:delete'))

// POST /users â€” Only admins can create
router.post('/users', authorize('user:create'))

// GET /users â€” Managers can read their department
router.get(
  '/users',
  authorize('user:read', {
    customCheck: async (req) => {
      return req.user.role === 'manager' || req.user.role === 'admin'
    },
  }),
  listUsersHandler,
)

export default router
```

### Step 4: Implement Cache with Validation

```typescript
// security/authorization-cache.ts
import { LRUCache } from 'lru-cache'

interface CacheEntry {
  permission: string
  resourceId: string
  allowed: boolean
  timestamp: number
  ttl: number
}

export class AuthorizationCache {
  private cache: LRUCache<string, CacheEntry>

  constructor(maxSize = 1000, defaultTtl = 60000) {
    this.cache = new LRUCache({
      max: maxSize,
      ttl: defaultTtl,
      ttlAutopurge: true,
    })
  }

  get(permission: string, resourceId: string): boolean | undefined {
    const key = `${permission}:${resourceId}`
    const entry = this.cache.get(key)
    
    if (!entry) return undefined
    
    return entry.allowed
  }

  set(permission: string, resourceId: string, allowed: boolean): void {
    const key = `${permission}:${resourceId}`
    this.cache.set(key, {
      permission,
      resourceId,
      allowed,
      timestamp: Date.now(),
      ttl: 60000, // 1 minute TTL
    })
  }

  invalidate(permission: string, resourceId: string): void {
    const key = `${permission}:${resourceId}`
    this.cache.delete(key)
  }

  invalidateAll(userId: string): void {
    // Invalidate all cached decisions for a user
    for (const key of this.cache.keys()) {
      if (key.includes(userId)) {
        this.cache.delete(key)
      }
    }
  }
}

// Usage with complete mediation
const authCache = new AuthorizationCache()

async function checkAuthorization(user: UserAttributes, permission: string, resourceId: string): Promise<boolean> {
  // Check cache first
  const cached = authCache.get(permission, resourceId)
  if (cached !== undefined) {
    return cached
  }
  
  // Evaluate permission
  const checker = new PermissionChecker(user)
  const allowed = await checker.hasPermission(permission, resourceId)
  
  // Cache result
  authCache.set(permission, resourceId, allowed)
  
  return allowed
}
```

### Step 5: Test Complete Mediation

```typescript
// tests/complete-mediation.test.ts
import { describe, it, expect, vi } from 'vitest'
import { PermissionChecker } from '@/security/permission-checker'
import type { UserAttributes } from '@/security/attributes/user-attributes'

describe('Complete Mediation', () => {
  const adminUser: UserAttributes = {
    id: 'admin-1',
    role: 'admin',
    department: 'IT',
    location: 'HQ',
    clearanceLevel: 5,
    isActive: true,
  }

  const regularUser: UserAttributes = {
    id: 'user-1',
    role: 'user',
    department: 'Sales',
    location: 'Branch',
    clearanceLevel: 1,
    isActive: true,
  }

  it('should allow admin to access everything', () => {
    const checker = new PermissionChecker(adminUser)
    expect(checker.hasPermission('user:delete', 'any-id')).toBe(true)
    expect(checker.hasPermission('user:read', 'any-id')).toBe(true)
  })

  it('should deny user from deleting others', () => {
    const checker = new PermissionChecker(regularUser)
    expect(checker.hasPermission('user:delete', 'other-user-id')).toBe(false)
  })

  it('should allow user to read own profile', () => {
    const checker = new PermissionChecker(regularUser)
    expect(checker.hasPermission('user:read', 'user-1')).toBe(true)
  })

  it('should deny user from reading others', () => {
    const checker = new PermissionChecker(regularUser)
    expect(checker.hasPermission('user:read', 'other-user-id')).toBe(false)
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Implementing authorization checks
- Creating middleware for security
- Building permission checkers
- Caching authorization decisions
- Testing security middleware

### What to Do With This Information
1. **Every access**: Check authorization on every request
2. **Middleware**: Use Express/Fastify middleware for authorization
3. **Permission checker**: Implement reusable permission checking logic
4. **Caching**: Cache decisions but validate TTL
5. **Default deny**: Deny by default, explicitly allow

### Tools to Use
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `express` â€” for middleware
- **npm Package**: `lru-cache` â€” for authorization caching
- **npm Package**: `vitest` â€” for testing security
- **Terminal Command**: `pnpm test` â€” run tests
- **Terminal Command**: `pnpm audit` â€” check for vulnerabilities

### Agents to Invoke
- **Security Review Agent**: Run when adding new authorization logic
- **Code Review Agent**: Run when reviewing PRs with security changes

### Integration with Other Notes
- read [security-principles](D/security-principles.md) for security principles
- read [[abac]] for ABAC patterns
- read [[rbac]] for RBAC patterns
- read [authorization](D/authorization.md) for authorization patterns
- read [input-validation](D/input-validation.md) for input validation
- read [[separation-of-duties]] for separation of duties

### Common Pitfalls
- Don't skip authorization checks (always check every access)
- Don't cache without TTL (cache can become stale)
- Don't rely only on client-side checks (always validate server-side)
- Don't hardcode permissions (use permission checker)
- Don't ignore default deny (deny by default)

### Quick Validation Checklist
- [ ] Are all endpoints protected with authorization?
- [ ] Is default deny implemented?
- [ ] Are authorization checks in middleware?
- [ ] Is cache validated with TTL?
- [ ] Are security tests written?
- [ ] Are permissions checked server-side?




