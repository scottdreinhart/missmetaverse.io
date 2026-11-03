---
slug: data-minimization
sources:
  - https://owasp.org/
  - https://gdpr.eu/
date: 2026-11-02
tags:

  - maturity/deprecated










  - data-minimization
  - security
  - privacy
  - gdpr
---

# Data Minimization

## Definition

Data Minimization is **a privacy principle that only collect, process, and retain the minimum amount of personal data necessary for the stated purpose**.

> "Data minimization means that personal data shall be adequate, relevant, and limited to what is necessary for the purposes for which they are processed." — GDPR

## Problem Addressed

Without data minimization:
- **Privacy violations**: More data than necessary is collected
- **Compliance issues**: Regulations require data minimization
- **Security risk**: More data means more risk
- **Storage costs**: More data costs more to store

## Scope and Boundaries

- Data Minimization ≠ Retention Policies (data minimization limits collection, retention policies limit how long data is kept)
- Data Minimization = Privacy (data minimization protects privacy)
- Data Minimization is a **privacy principle**, not a pattern

## When to Apply

- When building systems that handle personal data
- when privacy regulations apply (GDPR, CCPA, etc.)
- when security is important
- when storage costs are a concern

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Functionality**: Less data may limit functionality |
| **Complexity**: Determining minimum data adds complexity |
| **Time**: Implementing data minimization takes time |

## Common Misuses

- **Everything minimized**: Not every data point needs to be minimized
- **Ignoring retention**: Data minimization applies to collection and retention
- **Confusing with encryption**: Data minimization limits collection, encryption protects data

## Related Concepts

- [Retention Policies](Data Databases/retention-policies.md) — Retention policies complement data minimization
- [Data Encryption](Security/data-encryption.md) — Data encryption protects data
- [Secrets Management](Security/secrets-management.md) — Secrets management protects sensitive data

## Project Observations

- The project uses data minimization:
  - TypeScript can enforce data minimization through type system
  - Zod can validate data minimization through schemas
  - The project's architecture patterns note covers security concepts
  - No evidence of data minimization in existing code (src/ is empty)
- File naming conventions support data minimization:
  - `*.schema.ts` — Schema files
  - `*.types.ts` — Type files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: Data Minimization Implementation

```mermaid
graph TD
    A[Need to collect data?]\n    A --> B{Necessary?}
    B -->|Yes| C[Collect minimum]
    B -->|No| D[Don't collect]
    C --> E{How long?}
    E -->|Short| F[Short retention]
    E -->|Long| G[Long retention]
    F --> H{Anonymize?}
    H -->|Yes| I[Anonymize after]
    H -->|No| J[Delete after]
    G --> K{Anonymize?}
    K -->|Yes| L[Anonymize]
    K -->|No| M[Delete when done]
```

### When to Apply Data Minimization

| Situation | Action | Example |
|-----------|--------|---------|
| **Form collection** | Only required fields | Email, name |
| **Analytics** | Anonymize data | IP masking |
| **Logging** | Remove sensitive data | No passwords |
| **Retention** | Delete when done | 90-day purge |

---

## Procedural Guidance: Data Minimization Implementation

### Step 1: Define Minimal Schemas

```typescript
// schemas/user-registration.schema.ts
import { z } from 'zod'

// Only collect what's necessary for registration
export const userRegistrationSchema = z.object({
  email: z.string().email().max(255),
  password: z.string().min(8).max(128),
  name: z.string().min(2).max(100),
})

export type UserRegistrationInput = z.infer<typeof userRegistrationSchema>

// Don't collect: phone, address, DOB, gender, etc.
// Only collect if absolutely necessary for the feature
```

### Step 2: Implement Data Filtering

```typescript
// utils/data-filter.ts
export function filterSensitiveData(obj: Record<string, any>): Record<string, any> {
  const sensitiveFields = [
    'password',
    'passwordHash',
    'secret',
    'apiKey',
    'token',
    'ssn',
    'creditCard',
  ]

  const filtered = { ...obj }
  
  for (const field of sensitiveFields) {
    delete filtered[field]
  }
  
  return filtered
}

// Usage in logging
function logUserActivity(user: User, action: string) {
  const safeUser = filterSensitiveData(user)
  console.log(`User ${safeUser.id} performed ${action}`)
}
```

### Step 3: Implement Anonymization

```typescript
// utils/anonymize.ts
import { randomBytes } from 'crypto'

export function anonymizeEmail(email: string): string {
  const [local, domain] = email.split('@')
  const hashed = randomBytes(8).toString('hex')
  return `${hashed}@${domain}`
}

export function anonymizeIp(ip: string): string {
  return ip.replace(/\d+\.\d+\.\d+$/, '0.0')
}

export function anonymizeData(data: Record<string, any>): Record<string, any> {
  const anonymized = { ...data }
  
  if (anonymized.email) {
    anonymized.email = anonymizeEmail(anonymized.email)
  }
  
  if (anonymized.ip) {
    anonymized.ip = anonymizeIp(anonymized.ip)
  }
  
  return anonymized
}
```

### Step 4: Implement Retention Policies

```typescript
// services/data-retention.service.ts
import { PrismaClient } from '@prisma/client'

export class DataRetentionService {
  private prisma: PrismaClient

  constructor() {
    this.prisma = new PrismaClient()
  }

  // Delete user data after 90 days of inactivity
  async purgeInactiveUsers(daysInactive: number = 90): Promise<number> {
    const cutoffDate = new Date()
    cutoffDate.setDate(cutoffDate.getDate() - daysInactive)

    const result = await this.prisma.user.deleteMany({
      where: {
        updatedAt: { lt: cutoffDate },
        lastLoginAt: { lt: cutoffDate },
      },
    })

    return result.count
  }

  // Delete session data after 30 days
  async purgeOldSessions(daysOld: number = 30): Promise<number> {
    const cutoffDate = new Date()
    cutoffDate.setDate(cutoffDate.getDate() - daysOld)

    const result = await this.prisma.session.deleteMany({
      where: {
        expiresAt: { lt: cutoffDate },
      },
    })

    return result.count
  }

  // Anonymize analytics data after 1 year
  async anonymizeOldAnalytics(yearsOld: number = 1): Promise<number> {
    const cutoffDate = new Date()
    cutoffDate.setFullYear(cutoffDate.getFullYear() - yearsOld)

    // Anonymize instead of delete for analytics
    await this.prisma.$executeRaw`
      UPDATE analytics
      SET user_email = NULL,
          user_ip = NULL,
          user_agent = NULL
      WHERE created_at < ${cutoffDate}
    `

    return 1 // Simplified
  }
}
```

### Step 5: Implement Data Deletion API

```typescript
// controllers/user-data.controller.ts
import { Request, Response } from 'express'
import { DataRetentionService } from '@/services/data-retention.service'

export class UserDataController {
  private retentionService: DataRetentionService

  constructor() {
    this.retentionService = new DataRetentionService()
  }

  // DELETE /api/users/me/data — User can delete their data
  async deleteUserData(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user.id
      
      // Delete user data
      await this.prisma.user.delete({ where: { id: userId } })
      
      // Delete associated data
      await this.prisma.order.deleteMany({ where: { customerId: userId } })
      await this.prisma.session.deleteMany({ where: { userId } })
      
      res.json({ success: true, message: 'User data deleted' })
    } catch (error) {
      res.status(500).json({ error: 'Failed to delete user data' })
    }
  }

  // GET /api/users/me/data — User can see what data is collected
  async getUserData(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user.id
      
      const userData = await this.prisma.user.findUnique({
        where: { id: userId },
        select: {
          id: true,
          email: true,
          name: true,
          createdAt: true,
          updatedAt: true,
        },
      })
      
      const orders = await this.prisma.order.findMany({
        where: { customerId: userId },
        select: {
          id: true,
          createdAt: true,
          total: true,
        },
      })
      
      res.json({ user: userData, orders })
    } catch (error) {
      res.status(500).json({ error: 'Failed to retrieve user data' })
    }
  }
}
```

### Step 6: Test Data Minimization

```typescript
// tests/data-minimization.test.ts
import { describe, it, expect } from 'vitest'
import { filterSensitiveData } from '@/utils/data-filter'
import { anonymizeEmail, anonymizeIp } from '@/utils/anonymize'

describe('Data Minimization', () => {
  describe('filterSensitiveData', () => {
    it('should remove sensitive fields', () => {
      const data = {
        id: 'user-1',
        email: 'user@example.com',
        password: 'secret123',
        apiKey: 'abc123',
      }
      
      const filtered = filterSensitiveData(data)
      
      expect(filtered).not.toHaveProperty('password')
      expect(filtered).not.toHaveProperty('apiKey')
      expect(filtered.id).toBe('user-1')
      expect(filtered.email).toBe('user@example.com')
    })
  })

  describe('anonymizeEmail', () => {
    it('should anonymize email', () => {
      const anonymized = anonymizeEmail('user@example.com')
      expect(anonymized).toContain('@example.com')
      expect(anonymized).not.toContain('user')
    })
  })

  describe('anonymizeIp', () => () => {
    it('should anonymize IP', () => {
      const anonymized = anonymizeIp('192.168.1.100')
      expect(anonymized).toBe('192.168.1.0.0')
    })
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Implementing data minimization
- Creating minimal schemas
- Anonymizing user data
- Implementing retention policies
- Complying with GDPR/CCPA

### What to Do With This Information
1. **Minimal schemas**: Only collect what's necessary (Zod schemas)
2. **Filter sensitive data**: Remove sensitive fields before logging
3. **Anonymize data**: Hash emails, mask IPs for analytics
4. **Retention policies**: Delete data when no longer needed
5. **User rights**: Provide APIs for data access and deletion

### Tools to Use
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `zod` — for schema validation
- **npm Package**: `express` — for API controllers
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm audit` — check for vulnerabilities

### Agents to Invoke
- **Security Review Agent**: Run when adding new data collection
- **Code Review Agent**: Run when reviewing PRs with data handling changes

### Integration with Other Notes
- read [security-principles](D/security-principles.md) for security principles
- read [[abac]] for ABAC patterns
- read [[secrets-management]] for secrets management
- read [data-encryption](D/data-encryption.md) for data encryption
- read [retention-policies](D/retention-policies.md) for retention policies

### Common Pitfalls
- Don't collect more data than necessary (minimize collection)
- Don't store sensitive data in logs (filter before logging)
- Don't keep data forever (implement retention policies)
- Don't forget user rights (provide access/deletion APIs)
- Don't anonymize incorrectly (test anonymization)

### Quick Validation Checklist
- [ ] Are schemas minimal (only required fields)?
- [ ] Is sensitive data filtered from logs?
- [ ] Is data anonymized for analytics?
- [ ] Are retention policies implemented?
- [ ] Are user data access/deletion APIs provided?
- [ ] Is data minimization tested?




