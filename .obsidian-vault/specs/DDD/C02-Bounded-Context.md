---
slug: bounded-context
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/BoundedContext.html
date: 2026-11-02
tags:
  - priority/high
  - maturity/deprecated
  - domain/backend
  - type/reference
  - domain/architecture
  - type/concept
  - domain/testing
  - type/guide
  - domain/frontend
  - domain/devops
  - domain/database
  - ddd
  - bounded-context
  - domain-modeling
  - architecture
---

# Bounded Context

## Definition

Bounded Context is **a explicit boundary within which a domain model is valid and a ubiquitous language applies**.

> "Each context map has a bounded context that defines the applicability of the model." — Eric Evans

## Problem Addressed

Without bounded contexts:
- **Model confusion**: The same term means different things in different parts of the system
- **Model bloat**: One model tries to cover everything and becomes unwieldy
- **Team confusion**: Teams don't know which model they're working with
- **Integration issues**: Different teams use different terms for the same concept

## Scope and Boundaries

- Bounded Context ≠ Context Map (bounded context is a single model, context map is the relationship between bounded contexts)
- Bounded Context = Model (bounded context defines the boundary of a model)
- Bounded Context is an **architectural boundary**, not a pattern

## When to Apply

- When building complex systems with multiple domains
- when different teams work on different parts of the system
- when the same term has different meanings in different parts of the system
- when scaling development teams

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Bounded contexts add architectural complexity |
| **Time** — Defining boundaries takes time |
| **Over-bounded** — Don't create bounded contexts for simple domains |

## Common Misuses

- **Every module a bounded context**: Not every module needs its own bounded context
- **Ignoring context maps**: Bounded contexts need explicit integration strategies
- **Confusing with microservice**: A bounded context is a modeling concept, not a deployment unit

## Related Concepts

- [Ubiquitous Language](DDD/ubiquitous-language.md) — Each bounded context has its own ubiquitous language
- [Context Map](DDD/context-map.md) — Context map defines relationships between bounded contexts
- [Anti-Corruption Layer](DDD/anti-corruption-layer.md) — Anti-corruption layer protects a bounded context

## Project Observations

- The project uses bounded contexts:
  - The project's architecture patterns note covers DDD concepts
  - TypeScript modules can serve as bounded context boundaries
  - No evidence of bounded contexts in existing code (src/ is empty)
- File naming conventions support bounded contexts:
  - `*.bounded-context.ts` — Bounded context files
  - `*.use-case.ts` — Use case files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

---

## Decision Tree: Bounded Context Design

```mermaid
graph TD
    A[Need to define bounded context?]\n    A --> B{Same term, different meaning?}
    B -->|Yes| C[Separate contexts]
    B -->|No| D[Same context]
    C --> E{Team boundary?}
    E -->|Yes| F[Align with team]
    E -->|No| G[Align with domain]
    F --> H{Integration needed?}
    H -->|Yes| I[Context map]
    H -->|No| J[Independent]
    I --> K{Relationship?}
    K -->|Shared| L[Shared kernel]
    K -->|Separate| M[Customer/Supplier]
    K -->|Parallel| N[Conformist]
```

### When to Create Separate Bounded Contexts

| Situation | Action | Example |
|-----------|--------|---------|
| **Same term, different meaning** | Separate contexts | "Customer" in Sales vs Support |
| **Different team ownership** | Separate contexts | Team A owns User, Team B owns Order |
| **Different subdomain importance** | Separate contexts | Core vs Support context |
| **Different lifecycle** | Separate contexts | Payment vs Reporting |

---

## Procedural Guidance: Bounded Context Setup

### Step 1: Identify Subdomains

```typescript
// domains/user/user-context.ts — Core Subdomain
export class UserContext {
  // Core business logic for user management
  async createUser(data: CreateUserInput): Promise<User> {
    // Core domain logic
  }
}

// domains/order/order-context.ts — Core Subdomain
export class OrderContext {
  // Core business logic for order management
  async createOrder(data: CreateOrderInput): Promise<Order> {
    // Core domain logic
  }
}

// domains/reporting/reporting-context.ts — Support Subdomain
export class ReportingContext {
  // Support business logic for reporting
  async generateReport(type: ReportType): Promise<Report> {
    // Support domain logic
  }
}
```

### Step 2: Define Context Map

```typescript
// contexts/context-map.ts
export type ContextRelationship =
  | 'shared-kernel'
  | 'customer-supplier'
  | 'conformist'
  | 'partnership'
  | 'otter-service'
  | 'anti-corruption-layer'
  | 'published-language'

export interface ContextMapping {
  source: string
  target: string
  relationship: ContextRelationship
  integrationMethod: 'api' | 'event' | 'database' | 'file'
}

export const contextMap: ContextMapping[] = [
  {
    source: 'user-context',
    target: 'order-context',
    relationship: 'customer-supplier',
    integrationMethod: 'event',
  },
  {
    source: 'order-context',
    target: 'reporting-context',
    relationship: 'published-language',
    integrationMethod: 'api',
  },
]
```

### Step 3: Implement Anti-Corruption Layer

```typescript
// contexts/user/ac-l.ts — Anti-Corruption Layer
import { LegacyUserService } from '@/legacy/user-service'
import { User } from '@/domains/user/user.entity'

export class UserAntiCorruptionLayer {
  private legacyService: LegacyUserService

  constructor() {
    this.legacyService = new LegacyUserService()
  }

  // Transform legacy model to our model
  async getUser(id: string): Promise<User> {
    const legacyUser = await this.legacyService.getUser(id)
    return new User({
      id: legacyUser.userId,
      name: legacyUser.fullName,
      email: legacyUser.emailAddress,
    })
  }

  // Transform our model to legacy model
  async updateUser(user: User): Promise<void> {
    await this.legacyService.updateUser({
      userId: user.id,
      fullName: user.name,
      emailAddress: user.email,
    })
  }
}
```

### Step 4: Define Integration Patterns

```typescript
// events/user-events.ts — Published Language
export class UserCreatedEvent {
  constructor(
    public readonly userId: string,
    public readonly name: string,
    public readonly email: string,
    public readonly timestamp: Date,
  ) {}
}

export class UserUpdatedEvent {
  constructor(
    public readonly userId: string,
    public readonly name: string,
    public readonly email: string,
    public readonly timestamp: Date,
  ) {}
}

// handlers/order-handler.ts — Conformist Pattern
import { UserCreatedEvent } from '@/events/user-events'

export class OrderUserHandler {
  async handleUserCreated(event: UserCreatedEvent): Promise<void> {
    // Conform to the published language
    const customer = {
      id: event.userId,
      name: event.name,
      email: event.email,
    }
    // Use in order context
    await this.orderService.addCustomer(customer)
  }
}
```

### Step 5: Test Bounded Contexts

```typescript
// tests/user-context.test.ts
import { describe, it, expect } from 'vitest'
import { UserContext } from '@/domains/user/user-context'
import { UserAntiCorruptionLayer } from '@/contexts/user/ac-l'

describe('UserContext', () => {
  it('should create a user', async () => {
    const context = new UserContext()
    const user = await context.createUser({
      name: 'John Doe',
      email: 'john@example.com',
    })
    expect(user.id).toBeDefined()
    expect(user.name).toBe('John Doe')
  })
})

describe('UserAntiCorruptionLayer', () => {
  it('should transform legacy user to our model', async () => {
    const acl = new UserAntiCorruptionLayer()
    const user = await acl.getUser('legacy-123')
    expect(user.id).toBeDefined()
    expect(user.name).toBeDefined()
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Defining bounded contexts
- Creating context maps
- Implementing anti-corruption layers
- Integrating bounded contexts
- Setting up DDD architecture

### What to Do With This Information
1. **Identify subdomains**: Separate core, support, and generic subdomains
2. **Define context map**: Document relationships between contexts
3. **Implement ACL**: Protect contexts from external model changes
4. **Published language**: Use common event schemas for integration
5. **Test boundaries**: Verify context isolation

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `vitest` — for testing bounded contexts
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm tsc --noEmit` — type check

### Agents to Invoke
- **Architecture Validation Agent**: Run when defining new bounded contexts
- **Code Review Agent**: Run when reviewing PRs with DDD changes

### Integration with Other Notes
- Read [ddd-patterns](D/ddd-patterns.md) for domain-driven design patterns
- Read [[context-map]] for context map patterns
- Read [[ubiquitous-language]] for ubiquitous language patterns
- Read [anti-corruption-layer](D/anti-corruption-layer.md) for anti-corruption layer patterns
- Read [[aggregate]] for aggregate patterns
- Read [[aggregate-root]] for aggregate root patterns
- Read [[application-service]] for application service patterns
- Read [[bounded-context]] for bounded context patterns

### Common Pitfalls
- Don't create bounded contexts for simple domains
- Don't ignore context maps (document relationships)
- Don't confuse bounded contexts with microservices
- Don't skip anti-corruption layers (protect your model)
- Don't over-integrate contexts (keep them independent)

### Quick Validation Checklist
- [ ] Are bounded contexts aligned with team boundaries?
- [ ] Is the context map documented?
- [ ] Are anti-corruption layers implemented?
- [ ] Is published language used for integration?
- [ ] Are contexts properly tested?
- [ ] Are subdomains correctly identified?



