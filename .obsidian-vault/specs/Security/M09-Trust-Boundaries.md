---
slug: trust-boundaries
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - trust-boundaries
  - security
  - architecture
  - design
  - --
# Trust Boundaries

## Definition

Trust Boundaries is **a security concept that defines the points where data crosses from one trust level to another, requiring validation and authentication**.

> "A trust boundary is a point where data crosses from one trust level to another. At each trust boundary, data must be treated as untrusted." â€” OWASP

## Problem Addressed

Without trust boundaries:
- **Untrusted data**: Data from untrusted sources is trusted
- **Injection attacks**: Injection attacks succeed
- **Authentication bypass**: Authentication is bypassed
- **Security holes**: Security holes are introduced

## Scope and Boundaries

- Trust Boundaries â‰  Authentication (trust boundaries define where authentication is needed, authentication verifies identity)
- Trust Boundaries = Validation (trust boundaries require validation)
- Trust Boundaries is a **security concept**, not a pattern

## When to Apply

- When building secure systems
- when data crosses trust levels
- when authentication is needed
- when validation is required

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Trust boundaries add validation complexity |
| **Time** â€” Identifying trust boundaries takes time |
| **Performance**: Validation adds overhead |

## Common Misuses

- **Ignoring boundaries**: Trust boundaries must be identified and enforced
- **One-time checks**: Trust boundaries must be checked at every crossing
- **Confusing with authentication**: Trust boundaries define where authentication is needed, authentication verifies identity

## Related Concepts

- [Authentication](Security/authentication.md) â€” Authentication is needed at trust boundaries
- [Input Validation](Security/input-validation.md) â€” Input validation is needed at trust boundaries
- [Security Principles](Security/security-principles.md) â€” Security principles include trust boundaries

## Project Observations

- The project uses trust boundaries:
  - TypeScript can enforce trust boundaries through type system
  - Zod can validate data at trust boundaries
  - The project's architecture patterns note covers security concepts
  - No evidence of trust boundaries in existing code (src/ is empty)
- File naming conventions support trust boundaries:
  - `*.guard.ts` â€” Guard files
  - `*.middleware.ts` â€” Middleware files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: Trust Boundary Implementation

```mermaid
graph TD
    A[Data crossing boundary?]\n    A --> B{From external?}\n    B -->|Yes| C[Validate & authenticate]\n    B -->|No| D{From internal?}\n    D -->|Yes| E[Check authorization]\n    D -->|No| F[Trust but verify]\n    C --> G{User data?}\n    G -->|Yes| H[Input validation]\n    G -->|No| I[Type checking]\n    E --> J{Sensitive data?}\n    J -->|Yes| K[RBAC/ABAC check]\n    J -->|No| L[Log access]\n```\n\n### Trust Level Selection\n\n| Trust Level | When to Use | Validation |\n|-------------|-------------|------------|\n| **Untrusted** | External API, user input | Full validation + auth |\n| **Semi-trusted** | Internal service, partner | Auth + limited validation |\n| **Trusted** | Internal service, same origin | Authorization only |\n\n---

## Procedural Guidance: Trust Boundary Implementation

### Step 1: Define Trust Boundaries

```typescript
// security/trust-boundaries.ts
export enum TrustLevel {
  UNTRUSTED = 'untrusted',
  SEMI_TRUSTED = 'semi-trusted',
  TRUSTED = 'trusted',
}

export interface TrustBoundary {
  id: string
  name: string
  from: TrustLevel
  to: TrustLevel
  requiresAuthentication: boolean
  requiresAuthorization: boolean
  requiresValidation: boolean
  description: string
}

export const trustBoundaries: TrustBoundary[] = [
  {
    id: 'external-to-api',
    name: 'External to API',
    from: TrustLevel.UNTRUSTED,
    to: TrustLevel.SEMI_TRUSTED,
    requiresAuthentication: true,
    requiresAuthorization: true,
    requiresValidation: true,
    description: 'All external requests must be authenticated, authorized, and validated',
  },
  {
    id: 'api-to-service',
    name: 'API to Service',
    from: TrustLevel.SEMI_TRUSTED,
    to: TrustLevel.TRUSTED,
    requiresAuthentication: false,
    requiresAuthorization: true,
    requiresValidation: false,
    description: 'API to internal service calls need authorization but not re-validation',
  },
  {
    id: 'service-to-database',
    name: 'Service to Database',
    from: TrustLevel.TRUSTED,
    to: TrustLevel.TRUSTED,
    requiresAuthentication: false,
    requiresAuthorization: true,
    requiresValidation: false,
    description: 'Internal service to database calls need authorization only',
  },
]
```

### Step 2: Implement Boundary Middleware

```typescript
// security/boundary-middleware.ts
import { Request, Response, NextFunction } from 'express'
import { z } from 'zod'
import { trustBoundaries, TrustBoundary } from './trust-boundaries'

interface AuthRequest extends Request {
  user?: {
    id: string
    role: string
  }
}

export function enforceTrustBoundary(boundary: TrustBoundary) {
  return (req: AuthRequest, res: Response, next: NextFunction): void => {
    // Check authentication
    if (boundary.requiresAuthentication) {
      if (!req.user) {
        res.status(401).json({ error: 'Authentication required' })
        return
      }
    }

    // Check authorization
    if (boundary.requiresAuthorization) {
      // Check if user has permission
      const hasPermission = checkAuthorization(req.user, req)
      if (!hasPermission) {
        res.status(403).json({ error: 'Authorization required' })
        return
      }
    }

    // Check validation
    if (boundary.requiresValidation && req.body) {
      const isValid = validateInput(req.body)
      if (!isValid) {
        res.status(400).json({ error: 'Invalid input' })
        return
      }
    }

    next()
  }
}

function checkAuthorization(user: any, req: Request): boolean {
  // Implement authorization check
  return true
}

function validateInput(input: any): boolean {
  // Implement input validation
  return true
}
```

### Step 3: Implement Input Validation at Boundaries

```typescript
// security/boundary-validation.ts
import { z } from 'zod'

// External API input schema
export const externalApiSchema = z.object({
  email: z.string().email().max(255),
  password: z.string().min(8).max(128),
  name: z.string().min(2).max(100),
})

// Internal service input schema
export const internalServiceSchema = z.object({
  userId: z.string().uuid(),
  action: z.enum(['create', 'update', 'delete']),
  data: z.record(z.unknown()),
})

// Database input schema
export const databaseSchema = z.object({
  id: z.string().uuid(),
  values: z.record(z.unknown()),
})

// Validate at boundary
export function validateAtBoundary<T>(
  schema: z.ZodSchema<T>,
  input: unknown,
): T {
  try {
    return schema.parse(input)
  } catch (error) {
    if (error instanceof z.ZodError) {
      throw new Error(`Validation failed: ${error.errors.map((e) => e.message).join(', ')}`)
    }
    throw error
  }
}
```

### Step 4: Implement Authentication at Boundaries

```typescript
// security/boundary-authentication.ts
import { Request, Response, NextFunction } from 'express'
import jwt from 'jsonwebtoken'

interface AuthRequest extends Request {
  user?: {
    id: string
    role: string
  }
}

export function authenticateAtBoundary(req: AuthRequest, res: Response, next: NextFunction): void {
  // Get token from header
  const authHeader = req.headers.authorization
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    res.status(401).json({ error: 'Authentication required' })
    return
  }

  const token = authHeader.split(' ')[1]

  try {
    // Verify token
    const decoded = jwt.verify(token, process.env.JWT_SECRET!) as {
      id: string
      role: string
    }

    // Attach user to request
    req.user = decoded
    next()
  } catch (error) {
    res.status(401).json({ error: 'Invalid token' })
  }
}
```

### Step 5: Log Boundary Crossings

```typescript
// security/boundary-logging.ts
export interface BoundaryCrossing {
  timestamp: Date
  boundaryId: string
  from: string
  to: string
  userId?: string
  ipAddress?: string
  userAgent?: string
  result: 'allowed' | 'denied'
  reason?: string
}

export class BoundaryLogger {
  private crossings: BoundaryCrossing[] = []

  log(crossing: Omit<BoundaryCrossing, 'timestamp'>): void {
    const entry: BoundaryCrossing = {
      ...crossing,
      timestamp: new Date(),
    }
    this.crossings.push(entry)

    console.log(`[BOUNDARY] ${entry.timestamp.toISOString()} - ${entry.from} -> ${entry.to} - ${entry.result}${entry.reason ? ` (${entry.reason})` : ''}`)
  }

  getCrossings(boundaryId?: string): BoundaryCrossing[] {
    if (boundaryId) {
      return this.crossings.filter((c) => c.boundaryId === boundaryId)
    }
    return [...this.crossings]
  }
}

export const boundaryLogger = new BoundaryLogger()
```

---

## Copilot Instructions

### When to Read This Note
- Designing secure architectures
- Implementing authentication at boundaries
- Validating input at trust boundaries
- Creating authorization checks
- Logging boundary crossings

### What to Do With This Information
1. **Define boundaries**: Document trust boundaries
2. **Enforce at boundaries**: Add middleware for each boundary
3. **Validate input**: Use Zod schemas at untrusted boundaries
4. **Authenticate**: Use JWT or OAuth at external boundaries
5. **Log crossings**: Audit all boundary crossings

### Tools to Use
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `zod` â€” for validation
- **npm Package**: `jsonwebtoken` â€” for JWT authentication
- **npm Package**: `express` â€” for middleware
- **Terminal Command**: `pnpm test` â€” run tests
- **Terminal Command**: `pnpm lint` â€” check code quality

### Agents to Invoke
- **Security Review Agent**: Run when designing boundaries
- **Architecture Review Agent**: Run when implementing boundaries

### Integration with Other Notes
- read [[threat-modeling]] for threat modeling
- read [authentication](D/authentication.md) for authentication patterns
- read [input-validation](D/input-validation.md) for input validation
- read [security-principles](D/security-principles.md) for security principles

### Common Pitfalls
- Don't skip validation at untrusted boundaries
- Don't trust internal services completely (verify)
- Don't forget to log (audit all crossings)
- Don't hardcode boundaries (use configuration)
- Don't ignore semi-trusted sources (validate partially)

### Quick Validation Checklist
- [ ] Are trust boundaries defined?
- [ ] Is authentication enforced at external boundaries?
- [ ] Is input validated at untrusted boundaries?
- [ ] Is authorization checked at all boundaries?
- [ ] Are boundary crossings logged?
- [ ] Are boundaries reviewed regularly?




