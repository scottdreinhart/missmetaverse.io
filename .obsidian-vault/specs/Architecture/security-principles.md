---
slug: security-principles
sources:
  - https://owasp.org/www-project-top-ten/
  - https://docs.microsoft.com/en-us/azure/security/fundamentals/
  - https://www.nist.gov/cyberframework
date: 2026-11-02
tags:
  - security
  - polp
  - least-privilege
  - zero-trust
  - defense-in-depth
  - separation-of-duties
  - secure-by-design
  - input-validation
  - output-encoding
  - parameterized-queries
  - rbac
  - abac
  - secrets-management
  - threat-modeling
  - deny-by-default
  - complete-mediation
---

# Security Principles

## Overview

Security principles guide the design and implementation of secure systems. These are not optional — they are foundational requirements.

---

## 1. Core Principles

### Principle of Least Privilege (POLP)

**Every program and user should operate with the least privileges necessary.**

```typescript
// ❌ Overly permissive
class UserService {
  async deleteUser(id: string): Promise<void> {
    await this.db.query('DELETE FROM users WHERE id = $1', [id])
  }
}

// ✅ Least privilege
class UserService {
  constructor(private permissions: PermissionChecker) {}

  async deleteUser(id: string): Promise<void> {
    if (!this.permissions.has(id, 'user:delete')) {
      throw new PermissionDeniedError()
    }
    await this.db.query('DELETE FROM users WHERE id = $1', [id])
  }
}

// Database level: restricted roles
// CREATE ROLE app_readonly WITH LOGIN PASSWORD '...';
// GRANT SELECT ON ALL TABLES TO app_readonly;
// GRANT INSERT, UPDATE ON orders TO app_service;
// REVOKE DELETE FROM app_service;
```

### Deny by Default

**Explicitly deny all access unless explicitly allowed.**

```typescript
// ❌ Allow by default
function accessResource(user: User, resource: Resource): boolean {
  if (user.role === 'admin') return true
  if (user.id === resource.ownerId) return true
  return true  // ❌ Default allow
}

// ✅ Deny by default
function accessResource(user: User, resource: Resource): boolean {
  if (user.role === 'admin') return true
  if (user.id === resource.ownerId) return true
  return false  // ✅ Default deny
}
```

### Complete Mediation

**Every access to every object must be checked every time.**

```typescript
// ❌ Caching permissions without re-checking
class CachedPermissionChecker {
  private cache = new Map<string, boolean>()

  hasPermission(userId: string, permission: string): boolean {
    const key = `${userId}:${permission}`
    if (!this.cache.has(key)) {
      this.cache.set(key, this.checkPermission(userId, permission))
    }
    return this.cache.get(key)!  // ❌ Cached, not re-checked
  }
}

// ✅ Complete mediation — always check
class PermissionChecker {
  hasPermission(userId: string, permission: string): boolean {
    // Always check against current state
    return this.db.query(
      'SELECT 1 FROM user_permissions WHERE user_id = $1 AND permission = $2',
      [userId, permission]
    ).length > 0
  }
}
```

### Defense in Depth

**Layer multiple security controls so failure of one does not compromise the system.**

```
┌─────────────────────────────────────────────────────────┐
│  1. Network Security: VPC, Security Groups, WAF         │
│  2. Authentication: OAuth 2.0, MFA, JWT validation      │
│  3. Authorization: RBAC, ABAC, POLP                     │
│  4. Input Validation: Schema validation, sanitization   │
│  5. Encryption: TLS in transit, AES-256 at rest         │
│  6. Logging & Monitoring: Audit trails, alerts          │
│  7. Error Handling: No sensitive data in errors         │
└─────────────────────────────────────────────────────────┘
```

### Zero Trust

**Never trust, always verify. Assume breach.**

```typescript
// Zero Trust: Verify every request
class ZeroTrustMiddleware {
  async handle(request: Request): Promise<Response> {
    // 1. Verify identity (not just presence of token)
    const user = await this.verifyToken(request.token)
    if (!user) throw new UnauthorizedError()

    // 2. Verify authorization (every request)
    if (!this.hasPermission(user, request.resource, request.action)) {
      throw new ForbiddenError()
    }

    // 3. Verify input
    this.validateInput(request.body)

    // 4. Log the access
    await this.auditLog.log({ userId: user.id, resource: request.resource, action: request.action })

    // 5. Process with least privilege
    return this.processWithScopedAccess(user, request)
  }
}
```

### Separation of Duties

**No single entity should have control over all parts of a security-critical process.**

```typescript
class TransferApproval {
  async processTransfer(request: TransferRequest): Promise<void> {
    // Step 1: Requester initiates
    if (!this.isAuthorized(request.initiator, 'transfer:initiate')) {
      throw new PermissionDeniedError()
    }

    // Step 2: Separate approver must approve
    const approver = await this.findApprover(request.amount)
    if (!this.isAuthorized(approver, 'transfer:approve')) {
      throw new PermissionDeniedError()
    }

    // Step 3: Same person cannot initiate and approve
    if (request.initiator.id === approver.id) {
      throw new SeparationOfDutiesError('Initiator and approver must be different')
    }

    // Step 4: Execute after approval
    await this.executeTransfer(request)
  }
}
```

### Secure by Design

**Build security into the design, not as an afterthought.**

```typescript
// Secure by design: Security baked into the architecture
class SecureApplication {
  constructor() {
    // 1. Default secure configuration
    this.config = {
      cors: { origin: ['https://trusted-domain.com'] },  // Not *
      rateLimit: { max: 100, window: '1h' },              // Rate limiting on
      helmet: true,                                        // Security headers
      csrf: true,                                          // CSRF protection
    }

    // 2. Input validation at boundaries
    this.use(validateRequest)

    // 3. Parameterized queries everywhere
    this.db = new Database({ parameterized: true })

    // 4. No eval, no dynamic code execution
    // this.eval(userInput)  // ❌ Never
  }
}
```

---

## 2. Threat Mitigation

### Input Validation

**Validate all input at every boundary.**

```typescript
// Schema validation (not just client-side)
import { z } from 'zod'

const CreateUserSchema = z.object({
  name: z.string().min(2).max(100),
  email: z.string().email(),
  age: z.number().int().min(0).max(150).optional(),
  role: z.enum(['user', 'admin']).default('user'),
})

// ❌ Insecure: trusting client input
app.post('/users', (req, res) => {
  const user = req.body  // ❌ No validation
  db.insert('users', user)
})

// ✅ Secure: validate at every boundary
app.post('/users', async (req, res) => {
  const result = CreateUserSchema.safeParse(req.body)
  if (!result.success) {
    return res.status(400).json({ error: result.error.errors })
  }

  // Additional server-side checks
  if (await this.isEmailAlreadyTaken(result.data.email)) {
    return res.status(409).json({ error: 'Email already exists' })
  }

  await this.userService.create(result.data)
})
```

### Output Encoding

**Encode output to prevent XSS attacks.**

```typescript
// ❌ Insecure: rendering user input directly
function renderUserProfile(user: User): string {
  return `<div>${user.bio}</div>`  // ❌ XSS vulnerability
}

// ✅ Secure: encode output
function escapeHtml(text: string): string {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#x27;')
}

function renderUserProfile(user: User): string {
  return `<div>${escapeHtml(user.bio)}</div>`  // ✅ Safe
}

// In React: automatic encoding
function UserProfile({ user }: { user: User }) {
  return <div>{user.bio}</div>  // ✅ React auto-encodes
}
```

### Parameterized Queries

**Prevent SQL injection by using parameterized queries.**

```typescript
// ❌ Insecure: string concatenation (SQL injection vulnerable)
function getUser(username: string) {
  return db.query(`SELECT * FROM users WHERE username = '${username}'`)
}

// ✅ Secure: parameterized query
function getUser(username: string) {
  return db.query('SELECT * FROM users WHERE username = $1', [username])
}

// SQL injection attempt:
// username = "' OR '1'='1"
// ❌ Returns all users
// ✅ Returns no users (treated as literal string)
```

### Secrets Management

**Never hardcode secrets. Use environment variables or secret managers.**

```typescript
// ❌ Insecure: hardcoded secrets
const config = {
  databaseUrl: 'postgresql://admin:password123@db.example.com/mydb',
  apiKey: 'sk-1234567890abcdef',
  jwtSecret: 'my-secret-key',
}

// ✅ Secure: environment variables
const config = {
  databaseUrl: process.env.DATABASE_URL,
  apiKey: process.env.API_KEY,
  jwtSecret: process.env.JWT_SECRET,
}

// ✅ More secure: secret manager (AWS Secrets Manager example)
class SecretManager {
  async getSecret(name: string): Promise<string> {
    const response = await this.secretsManager.getSecretValue({ SecretId: name })
    return response.SecretString
  }
}

// .env.example (never commit actual values)
# .env (gitignored)
DATABASE_URL=postgresql://...
API_KEY=sk-...
JWT_SECRET=...
```

### Threat Modeling

**Systematically identify and mitigate threats.**

```
STRIDE Threat Modeling:
┌────────────────────────────────────────────────────────────┐
│ S - Spoofing: Can someone impersonate a user?              │
│ T - Tampering: Can data be modified unauthorized?          │
│ R - Repudiation: Can someone deny an action?               │
│ I - Information Disclosure: Can data be leaked?            │
│ D - Denial of Service: Can the system be made unavailable? │
│ E - Elevation of Privilege: Can a user gain admin?         │
└────────────────────────────────────────────────────────────┘

Example: Order System Threat Model
┌──────────────┬─────────────────────────────────────────────┐
│ Threat       │ Mitigation                                  │
├──────────────┼─────────────────────────────────────────────┤
│ Spoofing     │ JWT validation, MFA                         │
│ Tampering    │ Input validation, DB constraints            │
│ Repudiation  │ Audit logs, immutable events                │
│ Info Disc.   │ Encryption, access controls                 │
│ DoS          │ Rate limiting, circuit breakers             │
│ Elevation    │ RBAC, POLP, complete mediation              │
└──────────────┴─────────────────────────────────────────────┘
```

---

## 3. Access Control

### RBAC (Role-Based Access Control)

```typescript
type Role = 'admin' | 'manager' | 'user' | 'guest'

const permissions: Record<Role, Permission[]> = {
  admin: ['user:read', 'user:write', 'user:delete', 'order:read', 'order:write'],
  manager: ['order:read', 'order:write'],
  user: ['order:read', 'order:write'],
  guest: ['order:read'],
}

class RBAC {
  hasPermission(user: User, permission: Permission): boolean {
    return permissions[user.role]?.includes(permission) ?? false
  }
}
```

### ABAC (Attribute-Based Access Control)

```typescript
interface Policy {
  resource: string
  action: string
  condition: (user: User, resource: Resource) => boolean
}

class ABAC {
  private policies: Policy[] = []

  addPolicy(policy: Policy): void {
    this.policies.push(policy)
  }

  hasAccess(user: User, resource: Resource, action: string): boolean {
    return this.policies.some(
      p => p.resource === resource.type &&
           p.action === action &&
           p.condition(user, resource)
    )
  }
}

// Example policies
abac.addPolicy({
  resource: 'document',
  action: 'read',
  condition: (user, resource) => user.department === resource.department,
})

abac.addPolicy({
  resource: 'document',
  action: 'delete',
  condition: (user, resource) => user.role === 'admin' || user.id === resource.ownerId,
})
```

---

## 4. Data Protection

### Encryption

```typescript
import { createCipheriv, createDecipheriv, randomBytes } from 'crypto'

const ALGORITHM = 'aes-256-gcm'

class EncryptionService {
  private key: Buffer

  constructor(secret: string) {
    this.key = Buffer.from(secret, 'hex')
  }

  encrypt(plaintext: string): string {
    const iv = randomBytes(16)
    const cipher = createCipheriv(ALGORITHM, this.key, iv)
    let encrypted = cipher.update(plaintext, 'utf8', 'hex')
    encrypted += cipher.final('hex')
    const authTag = cipher.getAuthTag().toString('hex')
    return `${iv.toString('hex')}:${authTag}:${encrypted}`
  }

  decrypt(ciphertext: string): string {
    const [ivHex, authTagHex, encrypted] = ciphertext.split(':')
    const iv = Buffer.from(ivHex, 'hex')
    const authTag = Buffer.from(authTagHex, 'hex')
    const decipher = createDecipheriv(ALGORITHM, this.key, iv)
    decipher.setAuthTag(authTag)
    let plaintext = decipher.update(encrypted, 'hex', 'utf8')
    plaintext += decipher.final('utf8')
    return plaintext
  }
}
```

### Data Minimization

**Only collect and retain data that is necessary.**

```typescript
// ❌ Collecting everything
interface UserDto {
  name: string
  email: string
  phone: string
  address: string
  dateOfBirth: string
  ssn: string
  creditCard: string
  // ... 50 more fields
}

// ✅ Collecting only what's needed
interface CreateUserDto {
  name: string
  email: string
}

interface OrderDto {
  items: OrderItem[]
  shippingAddress: Address
  paymentMethodId: string  // Not the actual card number
}
```

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./ddd-patterns.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./coding-practices.md)
