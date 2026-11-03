---
slug: aggregate-root
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Aggregate.html
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
  - domain/optimization
  - domain/frontend
  - domain/accessibility
  - ddd
  - aggregate-root
  - domain-modeling
  - boundary
---

# Aggregate Root

## Definition

Aggregate Root is **the single entry point to an aggregate — all external access to aggregate objects goes through the root**.

> "The root object is the only member of the aggregate that external objects can hold references to." — Eric Evans

## Problem Addressed

Without aggregate roots:
- **Inconsistent state**: External code can bypass consistency rules
- **Complex access**: No clear entry point to the aggregate
- **Transaction issues**: Can't ensure atomic updates
- **Encapsulation**: Aggregate internals are exposed

## Scope and Boundaries

- Aggregate Root ≠ Aggregate (aggregate root is the entry point, aggregate is the cluster)
- Aggregate Root = Boundary (aggregate root defines the access boundary)
- Aggregate Root is a **domain model building block**, not a pattern

## When to Apply

- When building aggregates with multiple objects
- when consistency within an aggregate is critical
- when transaction boundaries need to be enforced
- when external access to aggregate internals must be prevented

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Aggregate roots add modeling complexity |
| **Time** — Designing aggregate roots takes time |
| **Over-aggregate-root** — Simple aggregates may not need a root |

## Common Misuses

- **Every class a root**: Not every class needs to be an aggregate root
- **Cross-root references**: Use IDs, not object references, to reference other aggregate roots
- **Ignoring performance**: Loading entire aggregates can be expensive

## Related Concepts

- [Aggregate](DDD/aggregate.md) — Aggregate root is the entry point to an aggregate
- [Entity](DDD/entity.md) — Aggregate roots are entities
- [Domain Invariant](DDD/domain-invariant.md) — Aggregate roots maintain domain invariants

## Project Observations

- The project uses aggregate roots:
  - TypeScript classes can serve as aggregate roots
  - The project's architecture patterns note covers DDD concepts
  - No evidence of aggregate roots in existing code (src/ is empty)
- File naming conventions support aggregate roots:
  - `*.aggregate.ts` — Aggregate files
  - `*.entity.ts` — Entity files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

---

## Decision Tree: Aggregate Root Design

```mermaid
graph TD
    A[Need aggregate root?]\n    A --> B{Multiple objects?}
    B -->|Yes| C[Create root]
    B -->|No| D[Single entity]
    C --> E{External access?}
    E -->|Yes| F[Root as entry]
    E -->|No| G[Internal only]
    F --> H{Consistency?}
    H -->|Strong| I[Root enforces]
    H -->|Eventual| J[Events]
    I --> K{Large aggregate?}
    K -->|Yes| L[Split aggregate]
    K -->|No| M[Keep together]
```

### When to Use Aggregate Root

| Situation | Action | Example |
|-----------|--------|---------|
| **Multiple objects** | Create root | Order + OrderItems |
| **Consistency needed** | Root enforces | Account + Transactions |
| **Transaction boundary** | Root as entry | User + Profile |
| **External access** | Root only | All refs via ID |

---

## Procedural Guidance: Aggregate Root Implementation

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

  // Private constructor — only static factory methods
  private constructor() {
    this.id = uuidv4()
    this.items = []
    this.status = 'pending'
    this.createdAt = new Date()
    this.updatedAt = new Date()
  }

  // Static factory method
  static create(customerId: string, items: CreateOrderItem[]): Order {
    const order = new Order()
    order.customerId = customerId
    
    for (const item of items) {
      order.addItem(item.product, item.quantity, item.price)
    }
    
    return order
  }

  // Domain methods only
  addItem(product: string, quantity: number, price: Money): void {
    this.validateQuantity(quantity)
    this.items.push(new OrderItem(product, quantity, price))
    this.updatedAt = new Date()
  }

  removeItem(product: string): void {
    const index = this.items.findIndex(i => i.getProduct() === product)
    if (index === -1) throw new Error('Item not found')
    this.items.splice(index, 1)
    this.updatedAt = new Date()
    
    if (this.items.length === 0) {
      throw new Error('Order must have at least one item')
    }
  }

  confirm(): void {
    this.requireStatus('pending')
    this.status = 'confirmed'
    this.updatedAt = new Date()
  }

  cancel(): void {
    this.requireStatus('pending')
    this.status = 'cancelled'
    this.updatedAt = new Date()
  }

  // Getters only (no setters)
  getId(): string { return this.id }
  getCustomerId(): string { return this.customerId }
  getItems(): ReadonlyArray<OrderItem> { return [...this.items] }
  getStatus(): OrderStatus { return this.status }
  getTotal(): Money {
    return this.items.reduce((sum, item) => sum.add(item.getTotal()), new Money(0))
  }
  getCreatedAt(): Date { return this.createdAt }
  getUpdatedAt(): Date { return this.updatedAt }

  // Private validation
  private requireStatus(expected: OrderStatus): void {
    if (this.status !== expected) {
      throw new Error(`Order must be ${expected} to perform this action`)
    }
  }

  private validateQuantity(quantity: number): void {
    if (quantity <= 0) throw new Error('Quantity must be positive')
  }
}

interface CreateOrderItem {
  product: string
  quantity: number
  price: Money
}
```

### Step 2: Define Internal Items

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

  // Getters only
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
// infrastructure/order/prisma-order-repository.ts
import { PrismaClient } from '@prisma/client'
import { Order } from '@/domains/order/order.entity'
import { OrderRepository } from '@/domains/order/order.repository'

export class PrismaOrderRepository implements OrderRepository {
  private prisma: PrismaClient

  constructor() {
    this.prisma = new PrismaClient()
  }

  async findById(id: string): Promise<Order | null> {
    const data = await this.prisma.order.findUnique({
      where: { id },
      include: { items: true },
    })
    
    if (!data) return null
    
    // Reconstruct aggregate
    const order = Order.create(data.customerId, [])
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
      
      // Delete old items
      await tx.orderItem.deleteMany({
        where: { orderId: order.getId() },
      })
      
      // Create new items
      for (const item of order.getItems()) {
        await tx.orderItem.create({
          data: {
            orderId: order.getId(),
            product: item.getProduct(),
            quantity: item.getQuantity(),
            price: item.getTotal().value,
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
    
    return orders.map(data => Order.create(data.customerId, []))
  }

  async delete(id: string): Promise<void> {
    await this.prisma.order.delete({ where: { id } })
  }
}
```

### Step 5: Use in Application Service

```typescript
// domains/order/application/create-order.service.ts
import { Order } from '@/domains/order/order.entity'
import { OrderRepository } from '@/domains/order/order.repository'
import { Money } from '@/value-objects/money.vo'

interface CreateOrderCommand {
  customerId: string
  items: Array<{
    product: string
    quantity: number
    price: Money
  }>
}

export class CreateOrderService {
  constructor(private orderRepository: OrderRepository) {}

  async execute(command: CreateOrderCommand): Promise<Order> {
    // Create aggregate through root
    const order = Order.create(command.customerId, command.items)
    
    // Save aggregate
    await this.orderRepository.save(order)
    
    return order
  }
}
```

---

## Copilot Instructions

### When to Read This Note
- Designing aggregate roots
- Implementing domain boundaries
- Enforcing consistency
- Creating repositories
- Using static factory methods

### What to Do With This Information
1. **Single entry point**: All external access goes through the root
2. **Private constructor**: Use static factory methods for creation
3. **Domain methods**: Encapsulate business logic in root methods
4. **Getters only**: No setters — state changes through methods
5. **External refs**: Use IDs, not object references

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
- Read [[aggregate]] for aggregate patterns
- read [[bounded-context]] for bounded context patterns
- read [[entity]] for entity patterns
- read [[domain-invariant]] for domain invariant patterns
- read [[application-service]] for application service patterns
- read [ddd-patterns](D/ddd-patterns.md) for domain-driven design patterns

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



