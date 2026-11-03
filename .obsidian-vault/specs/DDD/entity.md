---
slug: entity-ddd
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Entity.html
date: 2026-11-02
tags:
  - ddd
  - entity
  - domain-modeling
  - identity
---

# Entity

## Definition

Entity is **a unit of identity in a domain model that is defined by its identity rather than its attributes**.

> "An object not defined by its attributes, but by a continuum of identity and a link to other objects." — Eric Evans

## Problem Addressed

Without entities:
- **Identity confusion**: Can't track objects through changes
- **Equality issues**: Two objects with same attributes are considered equal
- **Lifecycle management**: Can't manage object lifecycle
- **Relationships**: Can't establish stable relationships between objects

## Scope and Boundaries

- Entity ≠ Value Object (entity has identity, value object is defined by attributes)
- Entity = Identity (entity is defined by its identity)
- Entity is a **domain model building block**, not a pattern

## When to Apply

- When building domain models
- when object identity matters (not just attributes)
- when objects have a lifecycle
- when objects have stable relationships

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Entities require identity management |
| **Time** — Designing entities takes time |
| **Over-entity** — Not everything needs identity |

## Common Misuses

- **Everything an entity**: Not everything needs identity — use value objects when appropriate
- **Ignoring invariants**: Entities should maintain domain invariants
- **Confusing with database row**: Entity identity ≠ database primary key (though they often align)

## Related Concepts

- [Value Object](DDD/value-object.md) — Value objects are compared by attributes, entities by identity
- [Aggregate](DDD/aggregate.md) — Aggregates contain entities and value objects
- [Domain Service](DDD/domain-service.md) — Domain services operate on entities

## Project Observations

- The project uses entities:
  - TypeScript classes can serve as entities
  - The project's architecture patterns note covers DDD concepts
  - No evidence of entities in existing code (src/ is empty)
- File naming conventions support entities:
  - `*.entity.ts` — Entity files
  - `*.types.ts` — Type files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

---

## Decision Tree: Entity vs Value Object

```mermaid
graph TD
    A[Need to model object?]\n    A --> B{Identity matters?}
    B -->|Yes| C[Entity]
    B -->|No| D[Value Object]
    C --> E{Mutable?}
    E -->|Yes| F[Entity with methods]
    E -->|No| G[Immutable entity]
    D --> H{Comparison by attributes?}
    H -->|Yes| I[Value Object]
    H -->|No| J[Reconsider]
    F --> K{Same identity?}
    K -->|Yes| L[Equal]
    K -->|No| M[Not equal]
```

### When to Use Entity vs Value Object

| Object Type | When to Use | Example |
|-------------|-------------|---------|
| **Entity** | Identity matters | User, Order, Product |
| **Value Object** | Attributes matter | Money, Email, Address |
| **Entity** | Lifecycle management | Task, Ticket |
| **Value Object** | Immutable | DateRange, Coordinates |

---

## Procedural Guidance: Entity Implementation

### Step 1: Define Entity with Identity

```typescript
// domains/user/user.entity.ts
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

### Step 2: Define Value Object

```typescript
// value-objects/email.vo.ts
export class EmailValueObject {
  readonly value: string

  constructor(value: string) {
    if (!this.isValidEmail(value)) {
      throw new Error(`Invalid email: ${value}`)
    }
    this.value = value.toLowerCase()
  }

  private isValidEmail(email: string): boolean {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
  }

  // Attribute-based equality
  equals(other: EmailValueObject): boolean {
    return this.value === other.value
  }

  toString(): string {
    return this.value
  }
}
```

### Step 3: Define Repository Interface

```typescript
// domains/user/user.repository.ts
import { UserEntity } from './user.entity'

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
import { UserEntity } from '@/domains/user/user.entity'
import { UserRepository } from '@/domains/user/user.repository'

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

### Step 5: Use Entity in Use Case

```typescript
// usecases/create-user.usecase.ts
import { UserEntity } from '@/domains/user/user.entity'
import { UserRepository } from '@/domains/user/user.repository'

export class CreateUserUseCase {
  constructor(private userRepository: UserRepository) {}

  async execute(email: string): Promise<UserEntity> {
    // Check if user exists
    const existing = await this.userRepository.findByEmail(email)
    if (existing) {
      throw new Error('User already exists')
    }
    
    // Create entity
    const user = UserEntity.create(email)
    
    // Save
    await this.userRepository.save(user)
    
    return user
  }
}
```

---

## Copilot Instructions

### When to Read This Note
- Designing domain entities
- Implementing entity identity
- Creating value objects
- Building repositories
- Using factory methods

### What to Do With This Information
1. **Entity identity**: Entities are defined by identity, not attributes
2. **Value objects**: Value objects are defined by attributes, not identity
3. **Factory methods**: Use static factory methods for creation
4. **Domain methods**: Encapsulate business logic in entity methods
5. **Repository pattern**: Use repositories for persistence

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `vitest` — for testing entities
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm tsc --noEmit` — type check

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing new entities
- **Code Review Agent**: Run when reviewing PRs with DDD changes

### Integration with Other Notes
- read [[aggregate]] for aggregate patterns
- read [[aggregate-root]] for aggregate root patterns
- read [[value-object]] for value object patterns
- read [[domain-invariant]] for domain invariant patterns
- read [[application-service]] for application service patterns
- read [[ddd-patterns]] for domain-driven design patterns

### Common Pitfalls
- Don't make everything an entity (use value objects when appropriate)
- Don't confuse entity identity with database PK (they may differ)
- Don't skip domain invariants (validate in constructors/methods)
- Don't expose setters (use domain methods)
- Don't mix persistence logic in entities

### Quick Validation Checklist
- [ ] Are entities defined by identity?
- [ ] Are value objects defined by attributes?
- [ ] Are factory methods used for creation?
- [ ] Are domain invariants enforced?
- [ ] Are repositories used for persistence?
- [ ] Are entities testable in isolation?

