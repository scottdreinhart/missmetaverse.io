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
# Security Principles

## Overview

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Security principles guide the design and implementation of secure systems. These are not optional â€” they are foundational requirements.

---

## 1. Core Principles

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### Principle of Least Privilege (POLP)

**Every program and user should operate with the least privileges necessary.**

```typescript
// âŒ Overly permissive
class UserService {
  async deleteUser(id: string): Promise<void> {
    await this.db.query('DELETE FROM users WHERE id = $1', [id])
  }
}

// âœ… Least privilege
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
// âŒ Allow by default
function accessResource(user: User, resource: Resource): boolean {
  if (user.role === 'admin') return true
  if (user.id === resource.ownerId) return true
  return true  // âŒ Default allow
}

// âœ… Deny by default
function accessResource(user: User, resource: Resource): boolean {
  if (user.role === 'admin') return true
  if (user.id === resource.ownerId) return true
  return false  // âœ… Default deny
}
```

### Complete Mediation

**Every access to every object must be checked every time.**

```typescript
// âŒ Caching permissions without re-checking
class CachedPermissionChecker {
  private cache = new Map<string, boolean>()

  hasPermission(userId: string, permission: string): boolean {
    const key = `${userId}:${permission}`
    if (!this.cache.has(key)) {
      this.cache.set(key, this.checkPermission(userId, permission))
    }
    return this.cache.get(key)!  // âŒ Cached, not re-checked
  }
}

// âœ… Complete mediation â€” always check
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
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚  1. Network Security: VPC, Security Groups, WAF         â”‚
â”‚  2. Authentication: OAuth 2.0, MFA, JWT validation      â”‚
â”‚  3. Authorization: RBAC, ABAC, POLP                     â”‚
â”‚  4. Input Validation: Schema validation, sanitization   â”‚
â”‚  5. Encryption: TLS in transit, AES-256 at rest         â”‚
â”‚  6. Logging & Monitoring: Audit trails, alerts          â”‚
â”‚  7. Error Handling: No sensitive data in errors         â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
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
    // this.eval(userInput)  // âŒ Never
  }
}
```

---

## 2. Threat Mitigation

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
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

// âŒ Insecure: trusting client input
app.post('/users', (req, res) => {
  const user = req.body  // âŒ No validation
  db.insert('users', user)
})

// âœ… Secure: validate at every boundary
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
// âŒ Insecure: rendering user input directly
function renderUserProfile(user: User): string {
  return `<div>${user.bio}</div>`  // âŒ XSS vulnerability
}

// âœ… Secure: encode output
function escapeHtml(text: string): string {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#x27;')
}

function renderUserProfile(user: User): string {
  return `<div>${escapeHtml(user.bio)}</div>`  // âœ… Safe
}

// In React: automatic encoding
function UserProfile({ user }: { user: User }) {
  return <div>{user.bio}</div>  // âœ… React auto-encodes
}
```

### Parameterized Queries

**Prevent SQL injection by using parameterized queries.**

```typescript
// âŒ Insecure: string concatenation (SQL injection vulnerable)
function getUser(username: string) {
  return db.query(`SELECT * FROM users WHERE username = '${username}'`)
}

// âœ… Secure: parameterized query
function getUser(username: string) {
  return db.query('SELECT * FROM users WHERE username = $1', [username])
}

// SQL injection attempt:
// username = "' OR '1'='1"
// âŒ Returns all users
// âœ… Returns no users (treated as literal string)
```

### Secrets Management

**Never hardcode secrets. Use environment variables or secret managers.**

```typescript
// âŒ Insecure: hardcoded secrets
const config = {
  databaseUrl: 'postgresql://admin:password123@db.example.com/mydb',
  apiKey: 'sk-1234567890abcdef',
  jwtSecret: 'my-secret-key',
}

// âœ… Secure: environment variables
const config = {
  databaseUrl: process.env.DATABASE_URL,
  apiKey: process.env.API_KEY,
  jwtSecret: process.env.JWT_SECRET,
}

// âœ… More secure: secret manager (AWS Secrets Manager example)
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
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ S - Spoofing: Can someone impersonate a user?              â”‚
â”‚ T - Tampering: Can data be modified unauthorized?          â”‚
â”‚ R - Repudiation: Can someone deny an action?               â”‚
â”‚ I - Information Disclosure: Can data be leaked?            â”‚
â”‚ D - Denial of Service: Can the system be made unavailable? â”‚
â”‚ E - Elevation of Privilege: Can a user gain admin?         â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜

Example: Order System Threat Model
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚ Threat       â”‚ Mitigation                                  â”‚
â”œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤
â”‚ Spoofing     â”‚ JWT validation, MFA                         â”‚
â”‚ Tampering    â”‚ Input validation, DB constraints            â”‚
â”‚ Repudiation  â”‚ Audit logs, immutable events                â”‚
â”‚ Info Disc.   â”‚ Encryption, access controls                 â”‚
â”‚ DoS          â”‚ Rate limiting, circuit breakers             â”‚
â”‚ Elevation    â”‚ RBAC, POLP, complete mediation              â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## 3. Access Control

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
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

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
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
// âŒ Collecting everything
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

// âœ… Collecting only what's needed
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

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./Application Architecture/domain-driven-design.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./Architecture/clean-architecture.md)

---

## Decision Tree: Security Patterns

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
```mermaid
graph TD
    A[Need to secure something?]
    A --> B{What are you securing?}
    B -->|User Input| C[Input Validation]
    B -->|Database| D[Parameterized Queries]
    B -->|API| E[Authentication + Authorization]
    B -->|Secrets| F[Secrets Management]
    B -->|System| G[Threat Modeling]
    C --> H{What type of input?}
    H -->|Form| I[Schema Validation]
    H -->|URL| J[Route Validation]
    H -->|Header| K[Header Validation]
    E --> L{What auth method?}
    L -->|Web App| M[JWT/OAuth 2.0]
    L -->|API| N[API Keys]
    L -->|Internal| O[mTLS]
```

### When to Apply Each Principle

| Principle | When to Apply | How to Validate |
|-----------|---------------|-----------------|
| **POLP** | Every permission request | Review each permission |
| **Zero Trust** | Network/API design | Test with untrusted input |
| **Defense in Depth** | Security-critical systems | Check all layers |
| **Deny by Default** | Access control | Test unauthorized access |
| **Complete Mediation** | Every access check | Test every code path |

---

## Procedural Guidance: Security Checklist for New Features

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### Step 1: Threat Model

```bash
# Run threat modeling session
# 1. Identify assets (data, APIs, services)
# 2. Identify threats (STRIDE: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege)
# 3. Identify mitigations
```

### Step 2: Input Validation

```typescript
import { z } from 'zod'

// Define schema
const CreateUserSchema = z.object({
  name: z.string().min(2).max(100),
  email: z.string().email(),
})

// Validate at boundary
app.post('/users', async (req, res) => {
  const result = CreateUserSchema.safeParse(req.body)
  if (!result.success) {
    return res.status(400).json({ error: result.error.errors })
  }
  // Safe to use result.data
})
```

### Step 3: Parameterized Queries

```typescript
// âœ… Always use parameterized queries
const user = await db.query('SELECT * FROM users WHERE email = $1', [email])

// âŒ Never use string concatenation
// const user = await db.query(`SELECT * FROM users WHERE email = '${email}'`)
```

### Step 4: Secrets Management

```bash
# Use environment variables
# .env (gitignored)
DATABASE_URL=postgresql://...
API_KEY=sk-...

# Or use secret manager
pnpm add @aws-sdk/client-secrets-manager
```

### Step 5: Security Headers

```typescript
import helmet from 'helmet'

app.use(helmet())  // Sets security headers automatically
```

### Step 6: Test for Vulnerabilities

```bash
# Run OWASP ZAP
npx zap-cli quick-scan http://localhost:3000

# Run npm audit
pnpm audit

# Run ESLint security checks
pnpm eslint --ext .ts src/
```

---

## Copilot Instructions

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### When to Read This Note
- Designing new features
- Code review: checking for security vulnerabilities
- Adding new API endpoints
- Implementing authentication/authorization
- Setting up database access

### What to Do With This Information
1. **Validate all input**: Use schema validation at every boundary
2. **Use parameterized queries**: Never concatenate SQL strings
3. **Manage secrets properly**: Use environment variables or secret managers
4. **Apply least privilege**: Only grant necessary permissions
5. **Implement defense in depth**: Multiple layers of security

### Tools to Use
- **VS Code Extension**: ESLint with `eslint-plugin-security` â€” for security linting
- **Browser Extension**: OWASP ZAP â€” for vulnerability scanning
- **npm Package**: `zod` â€” for schema validation
- **npm Package**: `helmet` â€” for security headers
- **Terminal Command**: `pnpm audit` â€” check for npm vulnerabilities
- **Terminal Command**: `npx eslint --ext .ts src/` â€” run security linting

### Agents to Invoke
- **Security Review Agent**: Run when adding new API endpoints
- **Code Review Agent**: Run when reviewing PRs that touch security-critical code

### Integration with Other Notes
- Read [[Security/web-security]] for React-specific security
- Read [input-validation](https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html) for input validation patterns
- Read [clean-architecture](https://martinfowler.com/bliki/CleanArchitecture.html) for security in architecture
- Read [[Security/web-security]] for additional security patterns

### Common Pitfalls
- Don't trust client-side validation (always validate server-side)
- Don't hardcode secrets (use environment variables)
- Don't use string concatenation for SQL (use parameterized queries)
- Don't skip threat modeling (do it early)
- Don't rely on a single security layer (use defense in depth)

### Quick Validation Checklist
- [ ] Is all input validated at every boundary?
- [ ] Are all SQL queries parameterized?
- [ ] Are secrets stored in environment variables or secret manager?
- [ ] Is least privilege applied to all permissions?
- [ ] Are security headers set (helmet)?
- [ ] Has threat modeling been done for new features?



## See Also

## concept_id
a193-security-principles

## title
Security Principles

## aliases
- A193-security-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended- [[A001-abstract-factory-pattern]]
- [[Architecture/abstract-factory-pattern]]
- [[A003-accessibility-a11y]]
- [[A004-accessibility-by-design]]
- [[A005-active-record-pattern]]


