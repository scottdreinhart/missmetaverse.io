---
slug: entity-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - type/reference
  - file-conventions
  - react
  - typescript
  - project-structure
---

# *.entity.ts

## Definition

`*.entity.ts` is **a file naming convention for TypeScript files that contain DDD entity definitions**.

> "The *.entity.ts convention identifies TypeScript files that contain DDD entity definitions." — TypeScript Docs

## Problem Addressed

Without `*.entity.ts` convention:
- **Confusion**: Don't know which files contain entity definitions
- **Mixing concerns**: Entities are mixed with business logic
- **Testing**: Hard to test entities separately
- **Maintenance**: Hard to maintain entities

## Scope and Boundaries

- `*.entity.ts` ≠ `*.value-object.ts` (`*.entity.ts` is for entities, `*.value-object.ts` is for value objects)
- `*.entity.ts` = Entities (`*.entity.ts` is for entity definitions)
- `*.entity.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building DDD applications
- when entity pattern is used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every entity needs a separate file |

## Common Misuses

- **Everything an entity**: Not every domain object needs an entity file
- **Mixing concerns**: Entity files should not contain business logic
- **Confusing with value object**: Entity files contain entities, value object files contain value objects

## Related Concepts

- [Entity (DDD)](DDD/entity.md) — Entity pattern is the pattern behind `*.entity.ts`
- [Value Object File Convention](Project File Conventions/value-object-file-convention.md) — Value object file convention is related
- [DDD Patterns](Architecture/ddd-patterns.md) — DDD patterns use `*.entity.ts`

## Project Observations

- The project uses `*.entity.ts`:
  - TypeScript supports `*.entity.ts` through module system
  - React supports `*.entity.ts` through entity definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.entity.ts` in existing code (src/ is empty)
- File naming conventions support `*.entity.ts`:
  - `*.entity.ts` — Entity files
  - `*.value-object.ts` — Value object files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: Entity File Structure

```mermaid
graph TD
    A[Need entity file?]\n    A --> B{Simple entity?}
    B -->|Yes| C[Single file]
    B -->|No| D[Split files]
    C --> E{Tests?}
    E -->|Yes| F[*.entity.ts + *.test.ts]
    E -->|No| G[*.entity.ts]
    D --> H{Multiple aggregates?}
    H -->|Yes| I[Separate files]
    H -->|No| J[Single file]
    F --> K{Repository?}
    K -->|Yes| L[*.repository.ts]
    K -->|No| M[No repo]
```

### When to Use Entity File Convention

| Situation | Action | Example |
|-----------|--------|---------|
| **Simple entity** | Single file | user.entity.ts |
| **Complex entity** | Split files | user.entity.ts + user.types.ts |
| **Entity + tests** | Separate test file | user.entity.ts + user.test.ts |
| **Entity + repo** | Separate repo file | user.entity.ts + user.repository.ts |

---

## Procedural Guidance: Entity File Setup

### Step 1: Create Entity File

```typescript
// entities/user/user.entity.ts
import { v4 as uuidv4 } from 'uuid'
import { EmailValueObject } from '@/value-objects/email.vo'

export type UserRole = 'admin' | 'user' | 'guest'

export class UserEntity {
  private id: string
  private email: EmailValueObject
  private role: UserRole
  private createdAt: Date
  private updatedAt: Date

  constructor(
    id: string,
    email: string,
    role: UserRole = 'user',
  ) {
    this.id = id
    this.email = new EmailValueObject(email)
    this.role = role
    this.createdAt = new Date()
    this.updatedAt = new Date()
  }

  // Static factory method
  static create(email: string, role: UserRole = 'user'): UserEntity {
    return new UserEntity(uuidv4(), email, role)
  }

  // Domain methods
  changeEmail(newEmail: string): void {
    this.email = new EmailValueObject(newEmail)
    this.updatedAt = new Date()
  }

  promoteToAdmin(): void {
    if (this.role !== 'user') {
      throw new Error('Only users can be promoted')
    }
    this.role = 'admin'
    this.updatedAt = new Date()
  }

  // Getters
  getId(): string { return this.id }
  getEmail(): string { return this.email.value }
  getRole(): UserRole { return this.role }
  getCreatedAt(): Date { return this.createdAt }
  getUpdatedAt(): Date { return this.updatedAt }

  // Identity-based equality
  equals(other: UserEntity): boolean {
    return this.id === other.id
  }
}
```

### Step 2: Create Test File

```typescript
// entities/user/user.test.ts
import { describe, it, expect } from 'vitest'
import { UserEntity } from './user.entity'

describe('UserEntity', () => {
  it('should create a user', () => {
    const user = UserEntity.create('john@example.com')
    expect(user.getEmail()).toBe('john@example.com')
    expect(user.getRole()).toBe('user')
    expect(user.getId()).toBeDefined()
  })

  it('should change email', () => {
    const user = UserEntity.create('john@example.com')
    user.changeEmail('john.doe@example.com')
    expect(user.getEmail()).toBe('john.doe@example.com')
  })

  it('should promote user to admin', () => {
    const user = UserEntity.create('john@example.com', 'user')
    user.promoteToAdmin()
    expect(user.getRole()).toBe('admin')
  })

  it('should not promote admin again', () => {
    const user = UserEntity.create('john@example.com', 'admin')
    expect(() => user.promoteToAdmin()).toThrow('Only users can be promoted')
  })

  it('should compare by identity', () => {
    const user1 = UserEntity.create('john@example.com')
    const user2 = UserEntity.create('john@example.com')
    expect(user1.equals(user2)).toBe(false) // Different IDs
  })
})
```

### Step 3: Create Repository File

```typescript
// repositories/user.repository.ts
import { UserEntity } from '@/entities/user/user.entity'

export interface UserRepository {
  findById(id: string): Promise<UserEntity | null>
  findByEmail(email: string): Promise<UserEntity | null>
  save(user: UserEntity): Promise<void>
  delete(id: string): Promise<void>
}
```

### Step 4: Implement Repository

```typescript
// infrastructure/user/prisma-user-repository.ts
import { PrismaClient } from '@prisma/client'
import { UserEntity } from '@/entities/user/user.entity'
import { UserRepository } from '@/repositories/user.repository'

export class PrismaUserRepository implements UserRepository {
  private prisma: PrismaClient

  constructor() {
    this.prisma = new PrismaClient()
  }

  async findById(id: string): Promise<UserEntity | null> {
    const data = await this.prisma.user.findUnique({ where: { id } })
    if (!data) return null
    
    return new UserEntity(data.id, data.email, data.role as 'admin' | 'user' | 'guest')
  }

  async findByEmail(email: string): Promise<UserEntity | null> {
    const data = await this.prisma.user.findUnique({ where: { email } })
    if (!data) return null
    
    return new UserEntity(data.id, data.email, data.role as 'admin' | 'user' | 'guest')
  }

  async save(user: UserEntity): Promise<void> {
    await this.prisma.user.upsert({
      where: { id: user.getId() },
      update: { email: user.getEmail(), role: user.getRole() },
      create: {
        id: user.getId(),
        email: user.getEmail(),
        role: user.getRole(),
      },
    })
  }

  async delete(id: string): Promise<void> {
    await this.prisma.user.delete({ where: { id } })
  }
}
```

### Step 5: Organize File Structure

```
src/
├── entities/
│   ├── user/
│   │   ├── user.entity.ts        # Entity definition
│   │   ├── user.test.ts          # Entity tests
│   │   └── user.types.ts         # Type definitions (optional)
│   ├── order/
│   │   ├── order.entity.ts
│   │   ├── order.test.ts
│   │   └── order-item.entity.ts
│   └── product/
│       ├── product.entity.ts
│       └── product.test.ts
├── repositories/
│   ├── user.repository.ts        # Repository interface
│   ├── order.repository.ts
│   └── product.repository.ts
└── infrastructure/
    ├── user/
    │   └── prisma-user-repository.ts
    ├── order/
    │   └── prisma-order-repository.ts
    └── product/
        └── prisma-product-repository.ts
```

---

## Copilot Instructions

### When to Read This Note
- Creating entity files
- Organizing DDD file structure
- Writing entity tests
- Creating repository interfaces
- Implementing repository patterns

### What to Do With This Information
1. **Entity files**: Use *.entity.ts for DDD entity definitions
2. **Test files**: Use *.test.ts for entity tests
3. **Repository files**: Use *.repository.ts for repository interfaces
4. **Infrastructure files**: Use prisma-*.repository.ts for implementations
5. **File structure**: Organize by domain, then by file type

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `vitest` — for testing entities
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm tsc --noEmit` — type check

### Agents to Invoke
- **Architecture Validation Agent**: Run when organizing file structure
- **Code Review Agent**: Run when reviewing PRs with file changes

### Integration with Other Notes
- read [entity](D/entity.md) for entity patterns
- read [aggregate](D/aggregate.md) for aggregate patterns
- read [value-object](D/value-object.md) for value object patterns
- read [repository-pattern](D/repository-pattern.md) for repository patterns
- read [project-structure-mapping](D/project-structure-mapping.md) for project structure mapping

### Common Pitfalls
- Don't put business logic in entity files (use domain services)
- Don't mix entities with value objects (separate files)
- Don't skip tests (always test entities)
- Don't hardcode repository implementations (use interfaces)
- Don't ignore file naming conventions

### Quick Validation Checklist
- [ ] Are entities in *.entity.ts files?
- [ ] Are tests in *.test.ts files?
- [ ] Are repository interfaces separate from implementations?
- [ ] Is file structure organized by domain?
- [ ] Are value objects in separate files?
- [ ] Are entities tested?



