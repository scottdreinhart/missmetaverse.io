---
slug: secrets-management
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - secrets-management
  - security
  - secrets
  - compliance
---

# Secrets Management

## Definition

Secrets Management is **the practice of securely storing, rotating, and accessing sensitive data such as passwords, API keys, and certificates**.

> "Secrets management is the practice of securely storing, rotating, and accessing sensitive data." — OWASP

## Problem Addressed

Without secrets management:
- **Exposed secrets**: Secrets are exposed in code or configuration
- **Rotation**: Secrets are not rotated regularly
- **Access**: Too many people have access to secrets
- **Compliance**: Regulations require secrets management

## Scope and Boundaries

- Secrets Management ≠ Data Encryption (secrets management manages secrets, data encryption protects data)
- Secrets Management = Protection (secrets management protects secrets)
- Secrets Management is a **security practice**, not a pattern

## When to Apply

- When building systems that handle secrets
- when compliance requires secrets management
- when security is important
- when multiple people access secrets

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Secrets management adds infrastructure complexity |
| **Time** — Implementing secrets management takes time |
| **Overhead**: Secrets management adds overhead |

## Common Misuses

- **Everything a secret**: Not every sensitive data point is a secret
- **Ignoring rotation**: Secrets must be rotated regularly
- **Confusing with encryption**: Secrets management manages secrets, data encryption protects data

## Related Concepts

- [Data Encryption](Security/data-encryption.md) — Data encryption protects secrets
- [Data Minimization](Security/data-minimization.md) — Data minimization limits secrets collection
- [Security Principles](Security/security-principles.md) — Security principles include secrets management

## Project Observations

- The project uses secrets management:
  - Node.js supports secrets management through environment variables
  - TypeScript can enforce secrets management through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of secrets management in existing code (src/ is empty)
- File naming conventions support secrets management:
  - `*.env.ts` — Environment files
  - `*.config.ts` — Config files

## Sources

- [[Sources/owasp-top-ten-2021|owasp-top-ten-2021]]

---

## Decision Tree: Secrets Management

```mermaid
graph TD
    A[Need to manage secret?]
    A --> B{Environment-specific?}
    B -->|Yes| C[Environment variables]
    B -->|No| D{Shared secret?}
    D -->|Yes| E[Secrets manager]
    D -->|No| F[Config file]
    C --> G{Local dev?}
    G -->|Yes| H[.env.local]
    G -->|No| I[CI/CD secrets]
    E --> J{Cloud provider?}
    J -->|Yes| K[Cloud secrets manager]
    J -->|No| L[Vault/1Password]
```

### Secrets Storage Selection

| Storage | When to Use | Security Level | Example |
|---------|-------------|----------------|---------|
| **.env.local** | Local development only | Low | DATABASE_URL, API_KEY |
| **.env.example** | Template for team | Low | DATABASE_URL=your-url |
| **CI/CD secrets** | Pipeline variables | Medium | GitHub Actions secrets |
| **Cloud secrets** | Production cloud | High | AWS Secrets Manager |
| **Vault** | Multi-cloud/on-prem | High | HashiCorp Vault |

---

## Procedural Guidance: Secrets Management Implementation

### Step 1: Create .env.local for Local Development

```bash
# .env.local — NEVER commit this file
# Add to .gitignore

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/mydb
DATABASE_POOL_MAX=10

# API Keys
STRIPE_SECRET_KEY=sk_test_1234567890
SENDGRID_API_KEY=SG.xxxxx.yyyyy

# JWT
JWT_SECRET=your-super-secret-jwt-key-change-in-production
JWT_EXPIRES_IN=24h

# External Services
REDIS_URL=redis://localhost:6379
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

### Step 2: Create .env.example Template

```bash
# .env.example — Commit this file (with placeholder values)
# Team members copy this to .env.local

DATABASE_URL=postgresql://user:password@localhost:5432/mydb
DATABASE_POOL_MAX=10

STRIPE_SECRET_KEY=your-stripe-secret-key-here
SENDGRID_API_KEY=your-sendgrid-api-key-here

JWT_SECRET=your-jwt-secret-here
JWT_EXPIRES_IN=24h

REDIS_URL=redis://localhost:6379
AWS_ACCESS_KEY_ID=your-aws-access-key-here
AWS_SECRET_ACCESS_KEY=your-aws-secret-key-here
```

### Step 3: Load Secrets Safely

```typescript
// config/env.ts
import { z } from 'zod'

// Define schema for environment variables
const envSchema = z.object({
  DATABASE_URL: z.string().url(),
  DATABASE_POOL_MAX: z.string().transform(Number).default('10'),
  STRIPE_SECRET_KEY: z.string().min(1),
  SENDGRID_API_KEY: z.string().min(1),
  JWT_SECRET: z.string().min(32),
  JWT_EXPIRES_IN: z.string().default('24h'),
  REDIS_URL: z.string().url(),
  AWS_ACCESS_KEY_ID: z.string().min(1),
  AWS_SECRET_ACCESS_KEY: z.string().min(1),
  NODE_ENV: z.enum(['development', 'test', 'production']).default('development'),
})

// Parse and validate environment variables
export const env = envSchema.parse({
  DATABASE_URL: process.env.DATABASE_URL,
  DATABASE_POOL_MAX: process.env.DATABASE_POOL_MAX,
  STRIPE_SECRET_KEY: process.env.STRIPE_SECRET_KEY,
  SENDGRID_API_KEY: process.env.SENDGRID_API_KEY,
  JWT_SECRET: process.env.JWT_SECRET,
  JWT_EXPIRES_IN: process.env.JWT_EXPIRES_IN,
  REDIS_URL: process.env.REDIS_URL,
  AWS_ACCESS_KEY_ID: process.env.AWS_ACCESS_KEY_ID,
  AWS_SECRET_ACCESS_KEY: process.env.AWS_SECRET_ACCESS_KEY,
  NODE_ENV: process.env.NODE_ENV,
})

// Type-safe environment variables
export type Env = z.infer<typeof envSchema>
```

### Step 4: Use Secrets Manager in Production

```typescript
// config/secrets-manager.ts
import { SecretsManagerClient, GetSecretValueCommand } from '@aws-sdk/client-secrets-manager'

export class SecretsManager {
  private client: SecretsManagerClient

  constructor() {
    this.client = new SecretsManagerClient({
      region: process.env.AWS_REGION || 'us-east-1',
    })
  }

  // Get secret from AWS Secrets Manager
  async getSecret(secretName: string): Promise<string> {
    try {
      const response = await this.client.send(
        new GetSecretValueCommand({ SecretId: secretName }),
      )

      if (!response.SecretString) {
        throw new Error(`Secret ${secretName} is not a string`)
      }

      return response.SecretString
    } catch (error) {
      console.error(`Failed to get secret ${secretName}:`, error)
      throw error
    }
  }

  // Get JSON secret
  async getJsonSecret<T>(secretName: string): Promise<T> {
    const secretString = await this.getSecret(secretName)
    return JSON.parse(secretString) as T
  }
}

// Usage:
// const secrets = new SecretsManager()
// const dbCredentials = await secrets.getJsonSecret<{username: string, password: string}>(
//   'production/database'
// )
```

### Step 5: Rotate Secrets

```typescript
// config/secret-rotation.ts
import { SecretsManager } from './secrets-manager'

export class SecretRotationService {
  private secrets: SecretsManager

  constructor() {
    this.secrets = new SecretsManager()
  }

  // Rotate database password
  async rotateDatabasePassword(): Promise<void> {
    const newPassword = this.generateStrongPassword()

    // Update secret in AWS Secrets Manager
    await this.secrets.updateSecret('production/database', {
      username: 'dbuser',
      password: newPassword,
    })

    // Update environment variable (if using dynamic secrets)
    process.env.DATABASE_PASSWORD = newPassword

    // Log rotation (never log the actual secret)
    console.log(`Database password rotated at ${new Date().toISOString()}`)
  }

  // Rotate JWT secret
  async rotateJwtSecret(): Promise<string> {
    const newSecret = this.generateStrongSecret(64)

    // Update secret in AWS Secrets Manager
    await this.secrets.updateSecret('production/jwt', {
      secret: newSecret,
      rotatedAt: new Date().toISOString(),
    })

    return newSecret
  }

  private generateStrongPassword(): string {
    const length = 32
    const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*'
    let password = ''
    for (let i = 0; i < length; i++) {
      password += charset.charAt(Math.floor(Math.random() * charset.length))
    }
    return password
  }

  private generateStrongSecret(length: number): string {
    const crypto = require('crypto')
    return crypto.randomBytes(length).toString('hex')
  }
}
```

### Step 6: Configure .gitignore

```gitignore
# .gitignore

# Environment files
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Secrets
secrets/
*.pem
*.key

# IDE
.idea/
.vscode/
```

---

## Copilot Instructions

### When to Read This Note
- Managing API keys and passwords
- Setting up environment variables
- Implementing secrets rotation
- Configuring CI/CD secrets
- Securing production deployments

### What to Do With This Information
1. **Use .env.local**: For local development only
2. **Use .env.example**: As template for team
3. **Validate secrets**: Use Zod schema validation
4. **Use secrets manager**: For production secrets
5. **Rotate regularly**: Set up automatic rotation

### Tools to Use
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `zod` — for environment validation
- **npm Package**: `@aws-sdk/client-secrets-manager` — for AWS Secrets Manager
- **npm Package**: `dotenv` — for loading .env files
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm lint` — check code quality

### Agents to Invoke
- **Security Review Agent**: Run when configuring secrets
- **DevOps Agent**: Run when setting up CI/CD secrets

### Integration with Other Notes
- read [data-encryption](D/data-encryption.md) for encryption at rest
- read [[secure-defaults]] for secure configuration
- read [[secure-by-design]] for security principles
- read [content-security-policy](D/content-security-policy.md) for web security

### Common Pitfalls
- Don't commit .env.local (add to .gitignore)
- Don't log secrets (sanitize logs)
- Don't hardcode secrets (use environment variables)
- Don't share secrets via email/chat (use secrets manager)
- Don't forget to rotate (set up automatic rotation)

### Quick Validation Checklist
- [ ] Are secrets in .env.local (not committed)?
- [ ] Is .env.example committed (with placeholders)?
- [ ] Are secrets validated on startup?
- [ ] Is secrets manager used in production?
- [ ] Are secrets rotated regularly?
- [ ] Are logs sanitized (no secrets)?

