---
slug: value-object
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/ValueObject.html
date: 2026-11-02
tags:
  - ddd
  - value-object
  - domain-modeling
  - immutability
---

# Value Object

## Definition

Value Object is **an object whose equality is based on value rather than identity — two value objects are equal if their attributes are equal**.

> "An object containing attributes or values but without identity. Two value objects are equal when all their parts are equal." — Eric Evans

## Problem Addressed

Without value objects:
- **Identity confusion**: Objects compared by reference instead of value
- **Immutability issues**: Values can be changed unexpectedly
- **Domain clarity**: Domain concepts not expressed in code
- **Null handling**: Null values create ambiguity

## Scope and Boundaries

- Value Object ≠ Entity (value object has no identity, entity has identity)
- Value Object = Immutability (value objects are typically immutable)
- Value Object is a **domain model building block**, not a pattern

## When to Apply

- When building domain models
- when value equality matters (not reference equality)
- when immutability is important
- when domain concepts need explicit representation

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Value objects add boilerplate |
| **Time** — Designing value objects takes time |
| **Over-value-object** — Not every data class needs to be a value object |

## Common Misuses

- **Everything a value object**: Not every data class needs value object semantics
- **Ignoring immutability**: Value objects should be immutable
- **Confusing with DTO**: Value objects belong in the domain layer, DTOs belong in the presentation layer

## Related Concepts

- [Entity](DDD/entity.md) — Entities have identity, value objects don't
- [Aggregate](DDD/aggregate.md) — Aggregates contain value objects
- [Immutable Data](Architecture/immutable-data.md) — Value objects are typically immutable

## Project Observations

- The project uses value objects:
  - TypeScript `readonly` can enforce value object immutability
  - Discriminated unions can represent value objects
  - The project's architecture patterns note covers DDD concepts
  - No evidence of value objects in existing code (src/ is empty)
- File naming conventions support value objects:
  - `*.value-object.ts` — Value object files
  - `*.types.ts` — Type files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

---

## Decision Tree: Value Object Design

```mermaid
graph TD
    A[Need to model object?]\n    A --> B{Identity matters?}
    B -->|Yes| C[Entity]
    B -->|No| D[Value Object]
    C --> E{Mutable?}
    E -->|Yes| F[Entity with methods]
    E -->|No| G[Immutable entity]
    D --> H{Immutable?}
    H -->|Yes| I[Value Object]
    H -->|No| J[Reconsider]
    I --> K{Comparison?}
    K -->|By value| L[equals method]
    K -->|By ref| M[Not value object]
```

### When to Use Value Object

| Situation | Action | Example |
|-----------|--------|---------|
| **No identity** | Value object | Money, Email, Address |
| **Immutable** | Value object | DateRange, Coordinates |
| **Value equality** | Value object | Currency, Percentage |
| **Domain concept** | Value object | Money with currency |

---

## Procedural Guidance: Value Object Implementation

### Step 1: Define Value Object

```typescript
// value-objects/money.vo.ts
export class MoneyValueObject {
  readonly amount: number
  readonly currency: string

  constructor(amount: number, currency: string = 'USD') {
    if (amount < 0) {
      throw new Error('Amount cannot be negative')
    }
    if (!['USD', 'EUR', 'GBP', 'JPY'].includes(currency)) {
      throw new Error(`Unsupported currency: ${currency}`)
    }
    
    this.amount = Math.round(amount * 100) / 100 // Prevent floating point errors
    this.currency = currency
  }

  // Factory method
  static create(amount: number, currency: string = 'USD'): MoneyValueObject {
    return new MoneyValueObject(amount, currency)
  }

  // Arithmetic operations
  add(other: MoneyValueObject): MoneyValueObject {
    this.validateCurrency(other)
    return new MoneyValueObject(this.amount + other.amount, this.currency)
  }

  subtract(other: MoneyValueObject): MoneyValueObject {
    this.validateCurrency(other)
    return new MoneyValueObject(this.amount - other.amount, this.currency)
  }

  multiply(multiplier: number): MoneyValueObject {
    return new MoneyValueObject(this.amount * multiplier, this.currency)
  }

  isGreaterThan(other: MoneyValueObject): boolean {
    this.validateCurrency(other)
    return this.amount > other.amount
  }

  isLessThan(other: MoneyValueObject): boolean {
    this.validateCurrency(other)
    return this.amount < other.amount
  }

  equals(other: MoneyValueObject): boolean {
    return this.amount === other.amount && this.currency === other.currency
  }

  toString(): string {
    return `${this.currency} ${this.amount.toFixed(2)}`
  }

  private validateCurrency(other: MoneyValueObject): void {
    if (this.currency !== other.currency) {
      throw new Error(`Currency mismatch: ${this.currency} vs ${other.currency}`)
    }
  }
}
```

### Step 2: Define Email Value Object

```typescript
// value-objects/email.vo.ts
export class EmailValueObject {
  readonly value: string

  constructor(value: string) {
    if (!this.isValidEmail(value)) {
      throw new Error(`Invalid email address: ${value}`)
    }
    this.value = value.toLowerCase()
  }

  // Factory method
  static create(value: string): EmailValueObject {
    return new EmailValueObject(value)
  }

  equals(other: EmailValueObject): boolean {
    return this.value === other.value
  }

  toString(): string {
    return this.value
  }

  private isValidEmail(email: string): boolean {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return regex.test(email)
  }
}
```

### Step 3: Define Address Value Object

```typescript
// value-objects/address.vo.ts
export interface AddressData {
  street: string
  city: string
  state: string
  zipCode: string
  country: string
}

export class AddressValueObject {
  readonly street: string
  readonly city: string
  readonly state: string
  readonly zipCode: string
  readonly country: string

  constructor(data: AddressData) {
    if (!data.street || data.street.length < 5) {
      throw new Error('Invalid street address')
    }
    if (!data.city || data.city.length < 2) {
      throw new Error('Invalid city')
    }
    if (!data.zipCode || data.zipCode.length < 5) {
      throw new Error('Invalid zip code')
    }
    if (!data.country || data.country.length !== 2) {
      throw new Error('Invalid country code')
    }

    this.street = data.street
    this.city = data.city
    this.state = data.state
    this.zipCode = data.zipCode
    this.country = data.country
  }

  // Factory method
  static create(data: AddressData): AddressValueObject {
    return new AddressValueObject(data)
  }

  equals(other: AddressValueObject): boolean {
    return (
      this.street === other.street &&
      this.city === other.city &&
      this.state === other.state &&
      this.zipCode === other.zipCode &&
      this.country === other.country
    )
  }

  toString(): string {
    return `${this.street}, ${this.city}, ${this.state} ${this.zipCode}, ${this.country}`
  }
}
```

### Step 4: Use Value Objects in Entities

```typescript
// entities/order/order.entity.ts
import { MoneyValueObject } from '@/value-objects/money.vo'
import { AddressValueObject } from '@/value-objects/address.vo'

export class OrderEntity {
  private id: string
  private customerEmail: EmailValueObject
  private shippingAddress: AddressValueObject
  private items: OrderItem[]
  private total: MoneyValueObject
  private status: 'pending' | 'confirmed' | 'shipped' | 'cancelled'

  constructor(
    id: string,
    customerEmail: string,
    shippingAddress: AddressData,
  ) {
    this.id = id
    this.customerEmail = EmailValueObject.create(customerEmail)
    this.shippingAddress = AddressValueObject.create(shippingAddress)
    this.items = []
    this.total = MoneyValueObject.create(0)
    this.status = 'pending'
  }

  // Domain methods using value objects
  addItem(product: string, quantity: number, price: MoneyValueObject): void {
    const itemTotal = price.multiply(quantity)
    this.total = this.total.add(itemTotal)
    this.items.push({ product, quantity, price: itemTotal })
  }

  getCustomerEmail(): string {
    return this.customerEmail.value
  }

  getShippingAddress(): AddressValueObject {
    return this.shippingAddress
  }

  getTotal(): MoneyValueObject {
    return this.total
  }
}
```

### Step 5: Test Value Objects

```typescript
// tests/money.vo.test.ts
import { describe, it, expect } from 'vitest'
import { MoneyValueObject } from '@/value-objects/money.vo'

describe('MoneyValueObject', () => {
  it('should create money with amount and currency', () => {
    const money = MoneyValueObject.create(100, 'USD')
    expect(money.amount).toBe(100)
    expect(money.currency).toBe('USD')
  })

  it('should add money with same currency', () => {
    const money1 = MoneyValueObject.create(100, 'USD')
    const money2 = MoneyValueObject.create(50, 'USD')
    const result = money1.add(money2)
    expect(result.amount).toBe(150)
    expect(result.currency).toBe('USD')
  })

  it('should throw error for different currencies', () => {
    const money1 = MoneyValueObject.create(100, 'USD')
    const money2 = MoneyValueObject.create(50, 'EUR')
    expect(() => money1.add(money2)).toThrow('Currency mismatch')
  })

  it('should multiply money', () => {
    const money = MoneyValueObject.create(10, 'USD')
    const result = money.multiply(3)
    expect(result.amount).toBe(30)
  })

  it('should compare money values', () => {
    const money1 = MoneyValueObject.create(100, 'USD')
    const money2 = MoneyValueObject.create(50, 'USD')
    expect(money1.isGreaterThan(money2)).toBe(true)
    expect(money1.isLessThan(money2)).toBe(false)
  })

  it('should compare by value, not reference', () => {
    const money1 = MoneyValueObject.create(100, 'USD')
    const money2 = MoneyValueObject.create(100, 'USD')
    expect(money1.equals(money2)).toBe(true)
  })

  it('should throw error for negative amount', () => {
    expect(() => MoneyValueObject.create(-10, 'USD')).toThrow('Amount cannot be negative')
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Implementing value objects
- Creating immutable domain objects
- Using value objects in entities
- Testing value object equality
- Building domain models

### What to Do With This Information
1. **Immutability**: Value objects should be immutable (readonly properties)
2. **Value equality**: Compare by value, not reference (equals method)
3. **Factory methods**: Use static factory methods for creation
4. **Domain methods**: Add arithmetic/operation methods
5. **Validation**: Validate in constructor

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `vitest` — for testing value objects
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm tsc --noEmit` — type check

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing value objects
- **Code Review Agent**: Run when reviewing PRs with domain model changes

### Integration with Other Notes
- read [[entity]] for entity patterns
- read [[aggregate]] for aggregate patterns
- read [[domain-service]] for domain service patterns
- read [immutable-data](D/immutable-data.md) for immutable data patterns
- read [ddd-patterns](D/ddd-patterns.md) for domain-driven design patterns

### Common Pitfalls
- Don't make value objects mutable (use readonly)
- Don't compare by reference (use equals method)
- Don't skip validation (validate in constructor)
- Don't use value objects for everything (only when value equality matters)
- Don't mix value objects with DTOs (value objects belong in domain layer)

### Quick Validation Checklist
- [ ] Are value objects immutable?
- [ ] Do they have equals method?
- [ ] Are factory methods used?
- [ ] Is validation in constructor?
- [ ] Are value objects tested?
- [ ] Are they used in domain layer (not presentation)?

