---
slug: domain-invariant
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/DomainInvariant.html
date: 2026-11-02
tags:
  - maturity/deprecated
  - ddd
  - domain-invariant
  - domain-modeling
  - consistency
  - --
# Domain Invariant

## Definition

Domain Invariant is **a rule or constraint about the domain that must always be true â€” invariants define the valid states of domain objects**.

> "An invariant is a rule about the domain that must always be true, regardless of what operations are performed." â€” Eric Evans

## Problem Addressed

Without domain invariants:
- **Invalid state**: Objects can be in invalid states
- **Business rule violations**: Business rules are not enforced
- **Data corruption**: Invalid data can enter the system
- **Testing issues**: Hard to test business rules

## Scope and Boundaries

- Domain Invariant â‰  Validation (domain invariants are business rules, validation is often UI-level)
- Domain Invariant = Consistency (domain invariants ensure consistency)
- Domain Invariant is a **domain concept**, not a pattern

## When to Apply

- When building domain models
- when business rules must be enforced
- when data integrity is critical
- when testing business rules is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Invariants add validation complexity |
| **Time** â€” Identifying invariants takes time |
| **Over-invariant** â€” Not every constraint is an invariant |

## Common Misuses

- **Every constraint an invariant**: Not every constraint needs to be an invariant
- **Ignoring timing**: Invariants must hold at all times, not just at certain points
- **Confusing with validation**: Domain invariants are different from input validation

## Related Concepts

- [Aggregate](DDD/aggregate.md) â€” Aggregates maintain domain invariants
- [Aggregate Root](DDD/aggregate-root.md) â€” Aggregate roots enforce domain invariants
- [Design by Contract](Architecture/design-by-contract.md) â€” Design by contract enforces invariants

## Project Observations

- The project uses domain invariants:
  - TypeScript type system can enforce some invariants
  - Zod can validate domain invariants
  - The project's architecture patterns note covers DDD concepts
  - No evidence of domain invariants in existing code (src/ is empty)
- File naming conventions support domain invariants:
  - `*.policy.ts` â€” Policy files
  - `*.entity.ts` â€” Entity files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]

---

## Decision Tree: Domain Invariant Design

```mermaid
graph TD
    A[Need to enforce rule?]\n    A --> B{Always true?}
    B -->|Yes| C[Domain invariant]
    B -->|No| D[Validation]
    C --> E{Where enforced?}
    E -->|Entity| F[Entity constructor/method]
    E -->|Aggregate| G[Aggregate root]
    F --> H{Type system?}
    H -->|Yes| I[Type-level invariant]
    H -->|No| J[Runtime check]
    I --> K{Zod?}
    K -->|Yes| L[Zod schema]
    K -->|No| M[TypeScript types]
```

### When to Use Domain Invariant

| Situation | Action | Example |
|-----------|--------|---------|
| **Always true** | Domain invariant | Email format |
| **Entity state** | Enforce in constructor | Positive amount |
| **Aggregate** | Enforce in root | Order has items |
| **Type system** | Type-level invariant | Discriminated union |

---

## Procedural Guidance: Domain Invariant Implementation

### Step 1: Define Invariants in Entity

```typescript
// entities/account/account.entity.ts
import { MoneyValueObject } from '@/value-objects/money.vo'

export type AccountStatus = 'active' | 'frozen' | 'closed'

export class AccountEntity {
  private id: string
  private ownerName: string
  private balance: MoneyValueObject
  private status: AccountStatus
  private createdAt: Date
  private updatedAt: Date

  constructor(
    id: string,
    ownerName: string,
    initialBalance: number,
  ) {
    // Invariant: owner name must be valid
    if (!ownerName || ownerName.length < 2) {
      throw new Error('Owner name must be at least 2 characters')
    }

    // Invariant: initial balance cannot be negative
    if (initialBalance < 0) {
      throw new Error('Initial balance cannot be negative')
    }

    this.id = id
    this.ownerName = ownerName
    this.balance = new MoneyValueObject(initialBalance)
    this.status = 'active'
    this.createdAt = new Date()
    this.updatedAt = new Date()
  }

  // Domain methods that maintain invariants
  deposit(amount: number): void {
    if (amount <= 0) {
      throw new Error('Deposit amount must be positive')
    }
    if (this.status !== 'active') {
      throw new Error('Cannot deposit to non-active account')
    }
    this.balance = this.balance.add(new MoneyValueObject(amount))
    this.updatedAt = new Date()
  }

  withdraw(amount: number): void {
    if (amount <= 0) {
      throw new Error('Withdrawal amount must be positive')
    }
    if (this.status !== 'active') {
      throw new Error('Cannot withdraw from non-active account')
    }
    if (this.balance.isLessThan(new MoneyValueObject(amount))) {
      throw new Error('Insufficient funds')
    }
    this.balance = this.balance.subtract(new MoneyValueObject(amount))
    this.updatedAt = new Date()
  }

  freeze(): void {
    if (this.status === 'closed') {
      throw new Error('Cannot freeze a closed account')
    }
    this.status = 'frozen'
    this.updatedAt = new Date()
  }

  close(): void {
    if (this.balance.value !== 0) {
      throw new Error('Cannot close account with non-zero balance')
    }
    this.status = 'closed'
    this.updatedAt = new Date()
  }

  // Getters
  getId(): string { return this.id }
  getOwnerName(): string { return this.ownerName }
  getBalance(): MoneyValueObject { return this.balance }
  getStatus(): AccountStatus { return this.status }
  getCreatedAt(): Date { return this.createdAt }
  getUpdatedAt(): Date { return this.updatedAt }
}
```

### Step 2: Define Type-Level Invariants

```typescript
// types/order-status.types.ts
// Type-level invariant: status can only be these values
export type OrderStatus = 'pending' | 'confirmed' | 'shipped' | 'cancelled'

// Type-level invariant: payment status
export type PaymentStatus = 'pending' | 'completed' | 'failed' | 'refunded'

// Type-level invariant: shipping status
export type ShippingStatus = 'not_shipped' | 'shipped' | 'delivered' | 'returned'

// Usage â€” TypeScript enforces these invariants at compile time
const status: OrderStatus = 'pending' // âœ… Valid
const invalidStatus: OrderStatus = 'invalid' // âŒ Compile error
```

### Step 3: Define Discriminated Unions

```typescript
// types/result.types.ts
// Invariant: Result is either Success or Error, never both
export type Result<T> = Success<T> | Error

export interface Success<T> {
  readonly success: true
  readonly data: T
  readonly error?: never
}

export interface Error {
  readonly success: false
  readonly data?: never
  readonly error: string
}

// Factory functions maintain invariants
export function success<T>(data: T): Success<T> {
  return { success: true, data }
}

export function failure(error: string): Error {
  return { success: false, error }
}

// Usage â€” TypeScript knows which properties exist
function processResult(result: Result<User>) {
  if (result.success) {
    // TypeScript knows result.data exists
    console.log(result.data.name)
  } else {
    // TypeScript knows result.error exists
    console.error(result.error)
  }
}
```

### Step 4: Define Invariant Policies

```typescript
// policies/order-policies.ts
import { MoneyValueObject } from '@/value-objects/money.vo'

export interface OrderPolicy {
  minOrderAmount: MoneyValueObject
  maxOrderAmount: MoneyValueObject
  maxItemsPerOrder: number
  allowedCurrencies: string[]
}

export const defaultOrderPolicy: OrderPolicy = {
  minOrderAmount: new MoneyValueObject(1),
  maxOrderAmount: new MoneyValueObject(10000),
  maxItemsPerOrder: 100,
  allowedCurrencies: ['USD', 'EUR', 'GBP'],
}

export class OrderPolicyValidator {
  static validateOrderAmount(amount: MoneyValueObject, policy: OrderPolicy): void {
    if (!policy.allowedCurrencies.includes(amount.currency)) {
      throw new Error(`Currency ${amount.currency} not allowed`)
    }
    if (amount.isLessThan(policy.minOrderAmount)) {
      throw new Error(`Order amount must be at least ${policy.minOrderAmount.toString()}`)
    }
    if (amount.isGreaterThan(policy.maxOrderAmount)) {
      throw new Error(`Order amount must not exceed ${policy.maxOrderAmount.toString()}`)
    }
  }

  static validateItemCount(count: number, policy: OrderPolicy): void {
    if (count <= 0) {
      throw new Error('Order must have at least one item')
    }
    if (count > policy.maxItemsPerOrder) {
      throw new Error(`Order cannot have more than ${policy.maxItemsPerOrder} items`)
    }
  }
}
```

### Step 5: Test Invariants

```typescript
// tests/account.entity.test.ts
import { describe, it, expect } from 'vitest'
import { AccountEntity } from '@/entities/account/account.entity'

describe('AccountEntity Invariants', () => {
  describe('Constructor invariants', () => {
    it('should throw error for invalid owner name', () => {
      expect(() => new AccountEntity('acc-1', '', 100)).toThrow(
        'Owner name must be at least 2 characters',
      )
      expect(() => new AccountEntity('acc-1', 'A', 100)).toThrow(
        'Owner name must be at least 2 characters',
      )
    })

    it('should throw error for negative initial balance', () => {
      expect(() => new AccountEntity('acc-1', 'John Doe', -100)).toThrow(
        'Initial balance cannot be negative',
      )
    })

    it('should create account with valid data', () => {
      const account = new AccountEntity('acc-1', 'John Doe', 100)
      expect(account.getOwnerName()).toBe('John Doe')
      expect(account.getBalance().value).toBe(100)
      expect(account.getStatus()).toBe('active')
    })
  })

  describe('Deposit invariants', () => {
    it('should throw error for zero deposit', () => {
      const account = new AccountEntity('acc-1', 'John Doe', 100)
      expect(() => account.deposit(0)).toThrow('Deposit amount must be positive')
    })

    it('should throw error for negative deposit', () => {
      const account = new AccountEntity('acc-1', 'John Doe', 100)
      expect(() => account.deposit(-50)).toThrow('Deposit amount must be positive')
    })

    it('should allow valid deposit', () => {
      const account = new AccountEntity('acc-1', 'John Doe', 100)
      account.deposit(50)
      expect(account.getBalance().value).toBe(150)
    })
  })

  describe('Withdraw invariants', () => {
    it('should throw error for insufficient funds', () => {
      const account = new AccountEntity('acc-1', 'John Doe', 100)
      expect(() => account.withdraw(150)).toThrow('Insufficient funds')
    })

    it('should allow valid withdrawal', () => {
      const account = new AccountEntity('acc-1', 'John Doe', 100)
      account.withdraw(50)
      expect(account.getBalance().value).toBe(50)
    })
  })

  describe('Status invariants', () => {
    it('should throw error when closing account with balance', () => {
      const account = new AccountEntity('acc-1', 'John Doe', 100)
      expect(() => account.close()).toThrow(
        'Cannot close account with non-zero balance',
      )
    })

    it('should allow closing account with zero balance', () => {
      const account = new AccountEntity('acc-1', 'John Doe', 0)
      account.close()
      expect(account.getStatus()).toBe('closed')
    })
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Implementing domain invariants
- Enforcing business rules in entities
- Using type-level invariants
- Creating invariant policies
- Testing domain invariants

### What to Do With This Information
1. **Entity invariants**: Enforce rules in constructors and methods
2. **Type-level invariants**: Use TypeScript types to enforce constraints
3. **Discriminated unions**: Use for state machines
4. **Policy objects**: Extract invariant rules into policy classes
5. **Testing**: Test all invariant violations

### Tools to Use
- **VS Code Extension**: TypeScript Hero â€” for TypeScript shortcuts
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `zod` â€” for runtime validation
- **npm Package**: `vitest` â€” for testing invariants
- **Terminal Command**: `pnpm test` â€” run tests
- **Terminal Command**: `pnpm tsc --noEmit` â€” type check

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing new invariants
- **Code Review Agent**: Run when reviewing PRs with domain model changes

### Integration with Other Notes
- read [[aggregate]] for aggregate patterns
- read [[aggregate-root]] for aggregate root patterns
- read [[entity]] for entity patterns
- read [[value-object]] for value object patterns
- read [[domain-service]] for domain service patterns
- read [Application Architecture/domain-driven-design](D/Application Architecture/domain-driven-design.md) for domain-driven design patterns

### Common Pitfalls
- Don't skip invariant checks (always validate in constructor/methods)
- Don't confuse invariants with validation (invariants always true)
- Don't ignore type-level invariants (use TypeScript types)
- Don't hardcode policies (use policy objects)
- Don't skip testing (test all invariant violations)

### Quick Validation Checklist
- [ ] Are invariants enforced in constructors?
- [ ] Are methods validating inputs?
- [ ] Are type-level invariants used?
- [ ] Are policies extracted into objects?
- [ ] Are invariant violations tested?
- [ ] Do invariants hold at all times?



