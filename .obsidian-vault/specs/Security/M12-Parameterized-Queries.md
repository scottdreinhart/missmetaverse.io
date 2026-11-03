---
slug: parameterized-queries
sources:
  - https://owasp.org/
  - https://www.postgresql.org/docs/
date: 2026-11-02
tags:
  - parameterized-queries
  - security
  - sql-injection
  - database
  - --
# Parameterized Queries

## Definition

Parameterized Queries is **a security technique that separates SQL code from data to prevent SQL injection attacks**.

> "Parameterized queries separate SQL code from data, preventing SQL injection attacks." â€” OWASP

## Problem Addressed

Without parameterized queries:
- **SQL injection**: SQL injection attacks succeed
- **Data theft**: Attacker can read any data
- **Data corruption**: Attacker can modify or delete data
- **Security holes**: Security holes are introduced

## Scope and Boundaries

- Parameterized Queries â‰  Input Validation (parameterized queries prevent SQL injection, input validation validates data)
- Parameterized Queries = Protection (parameterized queries protect against SQL injection)
- Parameterized Queries is a **security technique**, not a pattern

## When to Apply

- When building applications that use databases
- when SQL queries are constructed
- when SQL injection is a concern
- when user input is used in queries

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Parameterized queries add query complexity |
| **Time** â€” Implementing parameterized queries takes time |
| **Limitations**: Some queries can't use parameterized queries |

## Common Misuses

- **Everything parameterized**: Not every query needs parameterized queries
- **String concatenation**: Never concatenate user input into SQL
- **Confusing with input validation**: Parameterized queries prevent SQL injection, input validation validates data

## Related Concepts

- [Input Validation](Security/input-validation.md) â€” Input validation complements parameterized queries
- [ORM Patterns](Data Databases/orm-patterns.md) â€” ORMs use parameterized queries
- [Security Principles](Security/security-principles.md) â€” Security principles include parameterized queries

## Project Observations

- The project uses parameterized queries:
  - PostgreSQL supports parameterized queries
  - TypeORM supports parameterized queries
  - The project's architecture patterns note covers security concepts
  - No evidence of parameterized queries in existing code (src/ is empty)
- File naming conventions support parameterized queries:
  - `*.repository.ts` â€” Repository files
  - `*.schema.ts` â€” Schema files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: SQL Query Security

```mermaid
graph TD
    A[Need to query database?]\n    A --> B{User input?}
    B -->|Yes| C[Parameterized query]
    B -->|No| D[Static query]
    C --> E{ORM?}
    E -->|Yes| F[ORM methods]
    E -->|No| G[Raw query + params]
    F --> H{Type-safe?}
    H -->|Yes| I[Prisma/TypeORM]
    H -->|No| J[pg/pool]
    G --> K{PostgreSQL?}
    K -->|Yes| L[$1, $2 params]
    K -->|No| M[? params]
```

### When to Use Parameterized Queries

| Situation | Action | Example |
|-----------|--------|---------|
| **User input** | Parameterized query | WHERE id = $1 |
| **ORM** | Use ORM methods | prisma.user.findUnique |
| **Static query** | No params needed | SELECT * FROM config |
| **Dynamic WHERE** | Build params array | WHERE name = $1 AND age > $2 |

---

## Procedural Guidance: Parameterized Query Implementation

### Step 1: Use Prisma (Recommended)

```typescript
// repositories/user.repository.ts
import { PrismaClient } from '@prisma/client'

export class PrismaUserRepository {
  private prisma: PrismaClient

  constructor() {
    this.prisma = new PrismaClient()
  }

  // âœ… Safe â€” Prisma uses parameterized queries
  async findById(id: string) {
    return this.prisma.user.findUnique({
      where: { id },
    })
  }

  // âœ… Safe â€” Prisma escapes user input
  async findByEmail(email: string) {
    return this.prisma.user.findUnique({
      where: { email },
    })
  }

  // âœ… Safe â€” Prisma handles SQL injection
  async searchUsers(query: string) {
    return this.prisma.user.findMany({
      where: {
        OR: [
          { name: { contains: query } },
          { email: { contains: query } },
        ],
      },
    })
  }

  // âœ… Safe â€” Prisma uses parameterized queries
  async createUser(name: string, email: string) {
    return this.prisma.user.create({
      data: { name, email },
    })
  }

  // âœ… Safe â€” Prisma escapes user input
  async updateUser(id: string, name: string) {
    return this.prisma.user.update({
      where: { id },
      data: { name },
    })
  }

  // âœ… Safe â€” Prisma uses parameterized queries
  async deleteUser(id: string) {
    return this.prisma.user.delete({
      where: { id },
    })
  }
}
```

### Step 2: Use PostgreSQL Directly

```typescript
// repositories/user.pg-repository.ts
import { Pool, QueryResult } from 'pg'

export class PgUserRepository {
  private pool: Pool

  constructor() {
    this.pool = new Pool({
      connectionString: process.env.DATABASE_URL,
    })
  }

  // âœ… Safe â€” Uses $1, $2 parameters
  async findById(id: string) {
    const result: QueryResult = await this.pool.query(
      'SELECT * FROM users WHERE id = $1',
      [id],
    )
    return result.rows[0]
  }

  // âœ… Safe â€” Uses $1, $2 parameters
  async findByEmail(email: string) {
    const result: QueryResult = await this.pool.query(
      'SELECT * FROM users WHERE email = $1',
      [email],
    )
    return result.rows[0]
  }

  // âœ… Safe â€” Uses $1, $2 parameters
  async searchUsers(query: string) {
    const result: QueryResult = await this.pool.query(
      'SELECT * FROM users WHERE name ILIKE $1 OR email ILIKE $1',
      [`%${query}%`],
    )
    return result.rows
  }

  // âœ… Safe â€” Uses $1, $2 parameters
  async createUser(name: string, email: string) {
    const result: QueryResult = await this.pool.query(
      'INSERT INTO users (name, email) VALUES ($1, $2) RETURNING *',
      [name, email],
    )
    return result.rows[0]
  }

  // âœ… Safe â€” Uses $1, $2 parameters
  async updateUser(id: string, name: string) {
    const result: QueryResult = await this.pool.query(
      'UPDATE users SET name = $1 WHERE id = $2 RETURNING *',
      [name, id],
    )
    return result.rows[0]
  }

  // âœ… Safe â€” Uses $1, $2 parameters
  async deleteUser(id: string) {
    return this.pool.query('DELETE FROM users WHERE id = $1', [id])
  }
}
```

### Step 3: Use TypeORM

```typescript
// repositories/user.typeorm-repository.ts
import { Repository, Entity, Column, PrimaryGeneratedColumn } from 'typeorm'
import { DataSource } from 'typeorm'

@Entity('users')
export class UserEntity {
  @PrimaryGeneratedColumn()
  id: string

  @Column()
  name: string

  @Column({ unique: true })
  email: string
}

export class TypeOrmUserRepository {
  private repository: Repository<UserEntity>

  constructor(dataSource: DataSource) {
    this.repository = dataSource.getRepository(UserEntity)
  }

  // âœ… Safe â€” TypeORM uses parameterized queries
  async findById(id: string) {
    return this.repository.findOne({ where: { id } })
  }

  // âœ… Safe â€” TypeORM uses parameterized queries
  async findByEmail(email: string) {
    return this.repository.findOne({ where: { email } })
  }

  // âœ… Safe â€” TypeORM uses parameterized queries
  async searchUsers(query: string) {
    return this.repository.find({
      where: [
        { name: Like(`%${query}%`) },
        { email: Like(`%${query}%`) },
      ],
    })
  }

  // âœ… Safe â€” TypeORM uses parameterized queries
  async createUser(name: string, email: string) {
    const user = this.repository.create({ name, email })
    return this.repository.save(user)
  }

  // âœ… Safe â€” TypeORM uses parameterized queries
  async updateUser(id: string, name: string) {
    await this.repository.update(id, { name })
    return this.repository.findOne({ where: { id } })
  }

  // âœ… Safe â€” TypeORM uses parameterized queries
  async deleteUser(id: string) {
    return this.repository.delete(id)
  }
}
```

### Step 4: Avoid SQL Injection

```typescript
// âŒ NEVER do this â€” SQL injection vulnerable
async findByEmailUnsafe(email: string) {
  return this.pool.query(`SELECT * FROM users WHERE email = '${email}'`)
}

// âŒ NEVER do this â€” SQL injection vulnerable
async searchUsersUnsafe(query: string) {
  return this.pool.query(`SELECT * FROM users WHERE name LIKE '%${query}%'`)
}

// âŒ NEVER do this â€” SQL injection vulnerable
async deleteUserUnsafe(id: string) {
  return this.pool.query(`DELETE FROM users WHERE id = ${id}`)
}

// âœ… ALWAYS do this â€” Parameterized query
async findByEmailSafe(email: string) {
  return this.pool.query('SELECT * FROM users WHERE email = $1', [email])
}

// âœ… ALWAYS do this â€” Parameterized query
async searchUsersSafe(query: string) {
  return this.pool.query('SELECT * FROM users WHERE name LIKE $1', [`%${query}%`])
}

// âœ… ALWAYS do this â€” Parameterized query
async deleteUserSafe(id: string) {
  return this.pool.query('DELETE FROM users WHERE id = $1', [id])
}
```

### Step 5: Test Parameterized Queries

```typescript
// tests/parameterized-queries.test.ts
import { describe, it, expect } from 'vitest'

describe('SQL Injection Prevention', () => {
  it('should prevent SQL injection in email search', async () => {
    // Malicious input
    const maliciousEmail = "admin'--"
    
    // With parameterized query â€” safe
    // The query treats the entire string as the email value
    // It will not find a user with email "admin'--"
    // unless such a user actually exists
    
    // With string concatenation â€” vulnerable
    // const query = `SELECT * FROM users WHERE email = '${maliciousEmail}'`
    // This would become: SELECT * FROM users WHERE email = 'admin'--'
    // Which comments out the rest of the query!
  })

  it('should prevent SQL injection in search', async () => {
    // Malicious input
    const maliciousQuery = "' OR '1'='1"
    
    // With parameterized query â€” safe
    // The query treats the entire string as the search term
    // It will not return all users
    
    // With string concatenation â€” vulnerable
    // const query = `SELECT * FROM users WHERE name LIKE '%${maliciousQuery}%'`
    // This would become: SELECT * FROM users WHERE name LIKE '%'' OR '1'='1%'
    // Which returns all users!
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Writing SQL queries
- Preventing SQL injection
- Using Prisma/TypeORM/pg
- Database security best practices
- Testing query security

### What to Do With This Information
1. **Use Prisma**: Prefer Prisma for type-safe, parameterized queries
2. **Use pg directly**: Use $1, $2 parameters for raw queries
3. **Use TypeORM**: Use ORM methods for parameterized queries
4. **Never concatenate**: Never use string concatenation for SQL
5. **Test security**: Test with malicious input

### Tools to Use
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `@prisma/client` â€” for Prisma ORM
- **npm Package**: `typeorm` â€” for TypeORM
- **npm Package**: `pg` â€” for PostgreSQL client
- **Terminal Command**: `pnpm test` â€” run tests
- **Terminal Command**: `pnpm audit` â€” check for vulnerabilities

### Agents to Invoke
- **Security Review Agent**: Run when adding new database queries
- **Code Review Agent**: Run when reviewing PRs with database changes

### Integration with Other Notes
- read [security-principles](D/security-principles.md) for security principles
- read [input-validation](D/input-validation.md) for input validation
- read [[output-encoding]] for output encoding
- read [orm-patterns](D/orm-patterns.md) for ORM patterns
- read [[event-sourcing]] for event sourcing patterns

### Common Pitfalls
- Don't concatenate user input into SQL (always use parameters)
- Don't trust ORM to always be safe (review raw queries)
- Don't ignore stored procedures (they can also be vulnerable)
- Don't skip testing (test with malicious input)
- Don't use ORMs for everything (sometimes raw queries are needed)

### Quick Validation Checklist
- [ ] Are all queries parameterized?
- [ ] Is string concatenation avoided?
- [ ] Are ORMs used correctly?
- [ ] Are raw queries reviewed for security?
- [ ] Is SQL injection tested?
- [ ] Are stored procedures parameterized?




