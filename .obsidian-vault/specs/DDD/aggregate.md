---
slug: aggregate
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Aggregate.html
date: 2026-11-02
tags:
  - ddd
  - aggregate
  - domain-modeling
  - consistency
---

# Aggregate

## Definition

Aggregate is **a cluster of associated objects that we treat as a unit for the purpose of data changes, with a boundary and a root**.

> "An Aggregate is a pattern of one or more domain objects that forms an integrity boundary." — Eric Evans

## Problem Addressed

Without aggregates:
- **Consistency issues**: Related objects can be updated inconsistently
- **Performance**: Loading entire object graphs is expensive
- **Concurrency**: Hard to manage concurrent updates
- **Transaction boundaries**: No clear transaction boundaries

## Scope and Boundaries

- Aggregate ≠ Aggregate Root (aggregate is the cluster, aggregate root is the entry point)
- Aggregate = Consistency (aggregates maintain consistency within their boundary)
- Aggregate is a **domain model building block**, not a pattern

## When to Apply

- When building domain models with complex relationships
- when consistency within a group of objects is important
- when transaction boundaries need to be defined
- when concurrency control is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Aggregates add modeling complexity |
| **Time** — Designing aggregates takes time |
| **Over-aggregate** — Don't create aggregates for simple domains |

## Common Misuses

- **One aggregate per table**: Aggregates don't map to database tables
- **Cross-aggregate references**: Use IDs, not object references, to reference other aggregates
- **Ignoring size**: Aggregates should be small enough to maintain consistency

## Related Concepts

- [Aggregate Root](DDD/aggregate-root.md) — Aggregate root is the entry point to an aggregate
- [Entity](DDD/entity.md) — Aggregates contain entities
- [Domain Invariant](DDD/domain-invariant.md) — Aggregates maintain domain invariants

## Project Observations

- The project uses aggregates:
  - TypeScript modules can serve as aggregate boundaries
  - The project's architecture patterns note covers DDD concepts
  - No evidence of aggregates in existing code (src/ is empty)
- File naming conventions support aggregates:
  - `*.aggregate.ts` — Aggregate files
  - `*.entity.ts` — Entity files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

---

## Decision Tree: Aggregate Design

```mermaid
graph TD
    A[Need to design aggregate?]\n    A --> B{Strong consistency needed?}
    B -->|Yes| C[Same aggregate]
    B -->|No| D[Separate aggregates]
    C --> E{One root?}
    E -->|Yes| F[Single aggregate root]
    E -->|No| G[Redesign]
    F --> H{External reference?}
    H -->|Yes| I[Use ID, not object]
    H -->|No| J[Internal reference]
    I --> K{Cross-aggregate?}
    K -->|Yes| L[Eventual consistency]
    K -->|No| M[Immediate consistency]
```

### When to Group Objects in Same Aggregate

| Situation | Action | Example |
|-----------|--------|---------|
| **Strong consistency** | Same aggregate | Order + OrderItems |
| **Transaction boundary** | Same aggregate | User + UserProfile |
| **Domain invariant** | Same aggregate | Account + Transactions |
| **Performance** | Small aggregate | Single entity |

---

## Procedural Guidance: Aggregate Implementation

### Step 1: Define Aggregate Root

```typescript
// domains/order/order.entity.ts
import { v4 as uuidv4 } from 'uuid'
import { OrderItem } from './order-item.entity'
import { Money } from '@/value-objects/money.vo'

export type OrderStatus = 'pending' | 'confirmed' | 'shipped' | 'cancelled'

export class Order {
  private id: string
  private customerId: string
  private items: OrderItem[]
  private status: OrderStatus
  private createdAt: Date
  private updatedAt: Date

  constructor(customerId: string, items: OrderItem[] = []) {
    this.id = uuidv4()
    this.customerId = customerId
    this.items = items
    this.status = 'pending'
    this.createdAt = new Date()
    this.updatedAt = new Date()
    
    this.validate()
  }

  // Domain methods (business logic)
  addItem(product: string, quantity: number, price: Money): void {
    this.items.push(new OrderItem(product, quantity, price))
    this.updatedAt = new Date()
    this.validate()
  }

  removeItem(product: string): void {
    this.items = this.items.filter(item => item.product !== product)
    this.updatedAt = new Date()
    this.validate()
  }

  confirm(): void {
    if (this.status !== 'pending') {
      throw new Error('Order must be pending to confirm')
    }
    this.status = 'confirmed'
    this.updatedAt = new Date()
  }

  cancel(): void {
    if (this.status !== 'pending') {
      throw new Error('Order must be pending to cancel')
    }
    this.status = 'cancelled'
    this.updatedAt = new Date()
  }

  // Getters (no setters - encapsulation)
  getId(): string { return this.id }
  getCustomerId(): string { return this.customerId }
  getItems(): OrderItem[] { return [...this.items] }
  getStatus(): OrderStatus { return this.status }
  getTotal(): Money {
    return this.items.reduce((sum, item) => sum.add(item.getTotal()), new Money(0))
  }
  getCreatedAt(): Date { return this.createdAt }
  getUpdatedAt(): Date { return this.updatedAt }

  // Domain invariants
  private validate(): void {
    if (this.items.length === 0) {
      throw new Error('Order must have at least one item')
    }
    if (this.items.some(item => item.quantity <= 0)) {
      throw new Error('Item quantity must be positive')
    }
  }
}
```

### Step 2: Define Aggregate Items

```typescript
// domains/order/order-item.entity.ts
import { Money } from '@/value-objects/money.vo'

export class OrderItem {
  private product: string
  private quantity: number
  private price: Money

  constructor(product: string, quantity: number, price: Money) {
    if (quantity <= 0) throw new Error('Quantity must be positive')
    if (price.value < 0) throw new Error('Price cannot be negative')
    
    this.product = product
    this.quantity = quantity
    this.price = price
  }

  getTotal(): Money {
    return this.price.multiply(this.quantity)
  }

  getProduct(): string { return this.product }
  getQuantity(): number { return this.quantity }
  getPrice(): Money { return this.price }
}
```

### Step 3: Define Repository Interface

```typescript
// domains/order/order.repository.ts
import { Order } from './order.entity'

export interface OrderRepository {
  findById(id: string): Promise<Order | null>
  findByCustomerId(customerId: string): Promise<Order[]>
  save(order: Order): Promise<void>
  delete(id: string): Promise<void>
}
```

### Step 4: Implement Repository

```typescript
// infrastructure/order/order-repository.ts
import { PrismaClient } from '@prisma/client'
import { Order } from '@/domains/order/order.entity'
import { OrderRepository } from '@/domains/order/order.repository'

export class PrismaOrderRepository implements OrderRepository {
  private prisma: PrismaClient

  constructor() {
    this.prisma = new PrismaClient()
  }

  async findById(id: string): Promise<Order | null> {
    const orderData = await this.prisma.order.findUnique({
      where: { id },
      include: { items: true },
    })
    
    if (!orderData) return null
    
    // Reconstruct aggregate from database
    const order = new Order(orderData.customerId, [])
    // Restore state (in production, use proper reconstruction)
    return order
  }

  async save(order: Order): Promise<void> {
    await this.prisma.$transaction(async (tx) => {
      await tx.order.upsert({
        where: { id: order.getId() },
        update: { status: order.getStatus() },
        create: {
          id: order.getId(),
          customerId: order.getCustomerId(),
          status: order.getStatus(),
        },
      })
      
      // Save items
      for (const item of order.getItems()) {
        await tx.orderItem.create({
          data: {
            orderId: order.getId(),
            product: item.getProduct(),
            quantity: item.getQuantity(),
            price: item.getPrice().value,
          },
        })
      }
    })
  }

  async findByCustomerId(customerId: string): Promise<Order[]> {
    const orders = await this.prisma.order.findMany({
      where: { customerId },
      include: { items: true },
    })
    
    return orders.map(data => {
      const order = new Order(data.customerId, [])
      return order
    })
  }

  async delete(id: string): Promise<void> {
    await this.prisma.order.delete({ where: { id } })
  }
}
```

### Step 5: Use Aggregate in Use Case

```typescript
// usecases/create-order.usecase.ts
import { Order } from '@/domains/order/order.entity'
import { OrderRepository } from '@/domains/order/order.repository'
import { Money } from '@/value-objects/money.vo'

export class CreateOrderUseCase {
  constructor(private orderRepository: OrderRepository) {}

  async execute(customerId: string, items: { product: string; quantity: number; price: Money }[]): Promise<Order> {
    // Create aggregate
    const order = new Order(customerId)
    
    // Add items through domain methods
    for (const item of items) {
      order.addItem(item.product, item.quantity, item.price)
    }
    
    // Save aggregate
    await this.orderRepository.save(order)
    
    return order
  }
}
```

---

## Copilot Instructions

### When to Read This Note
- Designing aggregates
- Implementing aggregate roots
- Defining domain methods
- Maintaining domain invariants
- Creating repositories

### What to Do With This Information
1. **Single root**: Each aggregate has one entry point (aggregate root)
2. **Strong consistency**: Maintain consistency within aggregate boundary
3. **Domain methods**: Encapsulate business logic in aggregate methods
4. **External references**: Use IDs, not object references, for cross-aggregate refs
5. **Small aggregates**: Keep aggregates small for performance

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `vitest` — for testing aggregates
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm tsc --noEmit` — type check

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing new aggregates
- **Code Review Agent**: Run when reviewing PRs with DDD changes

### Integration with Other Notes
- Read [ddd-patterns](D/ddd-patterns.md) for domain-driven design patterns
- read [[aggregate-root]] for aggregate root patterns
- read [[bounded-context]] for bounded context patterns
- read [[entity]] for entity patterns
- read [[domain-invariant]] for domain invariant patterns
- read [[application-service]] for application service patterns

### Common Pitfalls
- Don't create one aggregate per table (aggregates don't map to tables)
- Don't reference other aggregates directly (use IDs)
- Don't make aggregates too large (performance issues)
- Don't expose setters (use domain methods)
- Don't skip validation (enforce domain invariants)

### Quick Validation Checklist
- [ ] Does the aggregate have a single root?
- [ ] Are domain invariants enforced?
- [ ] Are external references using IDs?
- [ ] Is the aggregate small enough?
- [ ] Are domain methods used instead of setters?
- [ ] Is consistency maintained within the boundary?

