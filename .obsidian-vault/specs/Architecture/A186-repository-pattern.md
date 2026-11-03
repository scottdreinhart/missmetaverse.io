---
slug: repository-pattern
sources:
  - https://martinfowler.com/eaaDev/repository.html
  - https://en.wikipedia.org/wiki/Repository_pattern
date: 2026-11-02
tags:

  - maturity/deprecated









  - repository-pattern
  - ddd
  - data-access
  - patterns
---

# Repository Pattern

## Definition

Repository Pattern is a **design pattern that provides an abstraction over data access, mediating between domain and data mapping layers**.

> "A Repository mediates between the domain and data mapping layers, acting like an in-memory collection of domain objects." — Martin Fowler

## Problem Addressed

Without repository pattern:
- **Coupling**: Domain is coupled to data access
- **Testing**: Hard to test domain logic
- **Maintenance**: Hard to maintain data access code
- **Flexibility**: Hard to change data access

## Scope and Boundaries

- Repository Pattern ≠ Data Mapper (repository pattern is an abstraction, data mapper is a specific pattern)
- Repository Pattern ≠ Unit of Work (repository pattern is for data access, unit of work is for transactions)
- Repository Pattern is a **design pattern**, not a data access pattern

## When to Apply

- When building applications
- when testing matters
- when maintenance is important
- when flexibility is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Repository pattern is complex |
| **Time** — Repository pattern takes time |
| **Over-repository** — Don't use repository for everything |

## Common Misuses

- **Everything repository**: Not everything needs repository pattern
- **Confusing with data mapper**: Repository pattern ≠ data mapper
- **Over-repository**: Too many repositories create complexity

## Related Concepts

- [DDD Patterns](ddd-patterns.md) — Repository pattern with DDD
- [Data Mapper](data-mapper-pattern.md) — Repository pattern with data mapper
- [Unit of Work](unit-of-work-pattern.md) — Repository pattern with unit of work

## Project Observations

- The project uses repository pattern:
  - The project's architecture patterns note covers repository pattern (from existing notes)
  - No evidence of repository pattern in existing code (src/ is empty)
- File naming conventions support repository pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

---

## Repository Pattern Implementation

### Interface Definition (Domain Layer)

```typescript
// ports/user-repository.port.ts
import { User } from '../entities/user.entity'

export interface UserRepository {
  findById(id: string): Promise<User | null>
  findByEmail(email: string): Promise<User | null>
  findAll(page: number, limit: number): Promise<User[]>
  save(user: User): Promise<void>
  delete(id: string): Promise<void>
}
```

### Implementation (Infrastructure Layer)

```typescript
// adapters/gateways/database/user-repository.adapter.ts
import { UserRepository } from '../../../ports/user-repository.port'
import { User } from '../../../entities/user.entity'
import { DbClient } from './db-client.adapter'

export class UserRepositoryAdapter implements UserRepository {
  constructor(private db: DbClient) {}

  async findById(id: string): Promise<User | null> {
    const row = await this.db.query('SELECT * FROM users WHERE id = $1', [id])
    if (!row) return null
    return User.create({ name: row.name, email: row.email })
  }

  async findByEmail(email: string): Promise<User | null> {
    const row = await this.db.query('SELECT * FROM users WHERE email = $1', [email])
    if (!row) return null
    return User.create({ name: row.name, email: row.email })
  }

  async findAll(page: number, limit: number): Promise<User[]> {
    const offset = page * limit
    const rows = await this.db.query(
      'SELECT * FROM users LIMIT $1 OFFSET $2', [limit, offset]
    )
    return rows.map(row => User.create({ name: row.name, email: row.email }))
  }

  async save(user: User): Promise<void> {
    await this.db.query(
      'INSERT INTO users (name, email) VALUES ($1, $2) ON CONFLICT (id) DO UPDATE SET name = $1, email = $2',
      [user.name, user.email]
    )
  }

  async delete(id: string): Promise<void> {
    await this.db.query('DELETE FROM users WHERE id = $1', [id])
  }
}
```

### In-Memory Repository (for Testing)

```typescript
// tests/unit/adapters/in-memory-user-repository.ts
import { UserRepository } from '../../../src/ports/user-repository.port'
import { User } from '../../../src/entities/user.entity'

export class InMemoryUserRepository implements UserRepository {
  private users: Map<string, User> = new Map()

  async findById(id: string): Promise<User | null> {
    return this.users.get(id) || null
  }

  async findByEmail(email: string): Promise<User | null> {
    return Array.from(this.users.values()).find(u => u.email === email) || null
  }

  async findAll(page: number, limit: number): Promise<User[]> {
    const all = Array.from(this.users.values())
    const offset = page * limit
    return all.slice(offset, offset + limit)
  }

  async save(user: User): Promise<void> {
    this.users.set(user.id, user)
  }

  async delete(id: string): Promise<void> {
    this.users.delete(id)
  }
}
```

---

## Copilot Instructions

### When to Read This Note
- Creating a new data access layer
- Writing tests that need mock repositories
- Refactoring direct database queries into repositories
- Code review: checking for repository pattern compliance

### What to Do With This Information
1. **Define the interface**: Create the repository interface in `ports/` (domain layer)
2. **Implement the adapter**: Create the implementation in `adapters/gateways/database/` (infrastructure layer)
3. **Create in-memory version**: For testing, create an in-memory implementation in `tests/`
4. **Inject via DI**: Use dependency injection to wire the repository to use cases
5. **Never query directly**: Domain code should never call database queries directly

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for type inference when creating repository interfaces
- **VS Code Extension**: Error Lens — for inline error detection
- **npm Package**: `prisma` — for ORM with type-safe repositories
- **npm Package**: `typeorm` — alternative ORM with built-in repository pattern
- **Terminal Command**: `pnpm add prisma @prisma/client` — install Prisma
- **Terminal Command**: `pnpm add -D @types/supertest` — for API testing with repositories

### Agents to Invoke
- **Architecture Validation Agent**: Run when creating new repositories to verify layer placement
- **Code Review Agent**: Run when reviewing repository changes

### Integration with Other Notes
- Read [[ddd-patterns]] for repository in DDD context
- read [data-mapper-pattern](https://martinfowler.com/eaaCatalog/dataMapper.html) for data mapper relationship
- read [unit-of-work-pattern](https://martinfowler.com/eaaCatalog/unitOfWork.html) for transaction management
- read [[project-structure-mapping]] for folder placement
- read [clean-architecture](https://martinfowler.com/bliki/CleanArchitecture.html) for layer boundaries

### Common Pitfalls
- Don't put database queries in domain entities (use repositories)
- Don't let repositories know about domain events (use event handlers)
- Don't create repositories for simple lookups (use direct queries)
- Don't mix SQL and ORM in the same repository (pick one approach)
- Don't forget to handle null cases (use `Promise<User | null>`)
- Don't expose raw database rows (always map to domain entities)

### Quick Validation Checklist
- [ ] Is the repository interface defined in the domain layer?
- [ ] Is the implementation in the infrastructure layer?
- [ ] Are there in-memory implementations for testing?
- [ ] Is dependency injection used to wire the repository?
- [ ] Does the domain code never call database queries directly?
- [ ] Are raw database rows mapped to domain entities?

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




