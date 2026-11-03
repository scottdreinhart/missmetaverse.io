---
slug: file-level-separation-conventions
sources:
  - https://docs.microsoft.com/en-us/dotnet/architecture/microservices/
  - https://www.enterpriseintegrationpatterns.com/
date: 2026-11-02
tags:
  - file-naming
  - separation-of-concerns
  - view
  - logic
  - data
  - hook
  - schema
  - types
  - mapper
  - port
  - adapter
  - repository
  - use-case
  - entity
  - value-object
  - policy
  - event
  - --
# File-Level Separation Conventions

## Overview

File-level separation conventions define naming patterns and organizational rules for files within a codebase. These conventions make it easy to understand a file's purpose at a glance.

---

## 1. Naming Conventions

### *.view.* â€” UI/View Layer

**Files that handle presentation and user interface.**

```
src/
â”œâ”€â”€ components/
â”‚   â”œâ”€â”€ OrderList.view.tsx        # UI component for listing orders
â”‚   â”œâ”€â”€ OrderDetail.view.tsx      # UI component for order details
â”‚   â””â”€â”€ Dashboard.view.tsx        # Dashboard UI
â”œâ”€â”€ pages/
â”‚   â”œâ”€â”€ Home.view.tsx
â”‚   â””â”€â”€ Login.view.tsx
```

```typescript
// OrderList.view.tsx â€” Purely presentational
interface OrderListProps {
  orders: Order[]
  onSelect: (order: Order) => void
}

export function OrderList({ orders, onSelect }: OrderListProps) {
  return (
    <ul>
      {orders.map(order => (
        <li key={order.id} onClick={() => onSelect(order)}>
          {order.id} â€” {order.status}
        </li>
      ))}
    </ul>
  )
}
```

### *.logic.* â€” Business Logic

**Files that contain business rules and domain logic.**

```
src/
â”œâ”€â”€ logic/
â”‚   â”œâ”€â”€ order.logic.ts            # Order business rules
â”‚   â”œâ”€â”€ pricing.logic.ts          # Pricing calculations
â”‚   â””â”€â”€ validation.logic.ts       # Validation rules
```

```typescript
// order.logic.ts â€” Business rules
export function calculateOrderTotal(items: OrderItem[]): Money {
  return items.reduce(
    (total, item) => total.add(item.price.multiply(item.quantity)),
    Money.zero()
  )
}

export function applyDiscount(total: Money, discount: Discount): Money {
  if (discount.type === 'percentage') {
    return total.multiply(1 - discount.value / 100)
  }
  return total.subtract(discount.value)
}
```

### *.data.* â€” Data Layer

**Files that handle data access and storage.**

```
src/
â”œâ”€â”€ data/
â”‚   â”œâ”€â”€ order.data.ts             # Order data access
â”‚   â”œâ”€â”€ user.data.ts              # User data access
â”‚   â””â”€â”€ cache.data.ts             # Caching layer
```

```typescript
// order.data.ts â€” Data access
interface OrderRow {
  id: string
  customer_id: string
  total: number
  status: string
}

export async function getOrderById(id: string): Promise<OrderRow | null> {
  const result = await db.query('SELECT * FROM orders WHERE id = $1', [id])
  return result?.[0] ?? null
}

export async function saveOrder(order: Order): Promise<void> {
  await db.query(
    'INSERT INTO orders (id, customer_id, total, status) VALUES ($1, $2, $3, $4)',
    [order.id, order.customerId, order.total, order.status]
  )
}
```

### *.hook.* â€” React Hooks

**Custom React hooks.**

```
src/
â”œâ”€â”€ hooks/
â”‚   â”œâ”€â”€ useAuth.hook.ts           # Authentication hook
â”‚   â”œâ”€â”€ useOrders.hook.ts         # Orders data hook
â”‚   â””â”€â”€ useDebounce.hook.ts       # Debounce utility hook
```

```typescript
// useAuth.hook.ts
export function useAuth() {
  const [user, setUser] = useState<User | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    auth.currentUser().then(setUser).finally(() => setLoading(false))
  }, [])

  return { user, loading, login: auth.login, logout: auth.logout }
}
```

### *.schema.* â€” Data Schemas

**Validation schemas and data contracts.**

```
src/
â”œâ”€â”€ schemas/
â”‚   â”œâ”€â”€ order.schema.ts           # Order validation schema
â”‚   â”œâ”€â”€ user.schema.ts            # User validation schema
â”‚   â””â”€â”€ api.schema.ts             # API request/response schemas
```

```typescript
// order.schema.ts
import { z } from 'zod'

export const CreateOrderSchema = z.object({
  items: z.array(z.object({
    productId: z.string(),
    quantity: z.number().int().positive(),
  })).min(1),
  customerId: z.string(),
  shippingAddress: z.object({
    street: z.string(),
    city: z.string(),
    country: z.string(),
  }),
})

export type CreateOrderInput = z.infer<typeof CreateOrderSchema>
```

### *.types.* â€” Type Definitions

**TypeScript type and interface definitions.**

```
src/
â”œâ”€â”€ types/
â”‚   â”œâ”€â”€ order.types.ts            # Order-related types
â”‚   â”œâ”€â”€ user.types.ts             # User-related types
â”‚   â””â”€â”€ api.types.ts              # API-related types
```

```typescript
// order.types.ts
export interface Order {
  id: string
  customerId: string
  items: OrderItem[]
  total: Money
  status: OrderStatus
  createdAt: Date
}

export type OrderStatus = 'pending' | 'confirmed' | 'shipped' | 'cancelled'

export interface OrderItem {
  productId: string
  name: string
  price: Money
  quantity: number
}
```

### *.mapper.* â€” Data Mappers

**Transform data between layers.**

```
src/
â”œâ”€â”€ mappers/
â”‚   â”œâ”€â”€ order.mapper.ts         # Order data transformation
â”‚   â”œâ”€â”€ user.mapper.ts          # User data transformation
â”‚   â””â”€â”€ api.mapper.ts            # API response mapping
```

```typescript
// order.mapper.ts
export class OrderMapper {
  static toDomain(row: OrderRow): Order {
    return {
      id: row.id,
      customerId: row.customer_id,
      total: new Money(row.total, 'USD'),
      status: row.status as OrderStatus,
      createdAt: new Date(row.created_at),
    }
  }

  static toPersistence(order: Order): OrderPersistence {
    return {
      id: order.id,
      customer_id: order.customerId,
      total: order.total.amount,
      status: order.status,
      created_at: order.createdAt,
    }
  }
}
```

### *.port.* â€” Ports/Interfaces

**Abstraction interfaces for dependencies.**

```
src/
â”œâ”€â”€ ports/
â”‚   â”œâ”€â”€ email.port.ts             # Email service interface
â”‚   â”œâ”€â”€ payment.port.ts           # Payment service interface
â”‚   â””â”€â”€ storage.port.ts           # Storage service interface
```

```typescript
// email.port.ts
export interface EmailPort {
  send(to: string, subject: string, body: string): Promise<void>
  sendTemplate(templateId: string, to: string, data: Record<string, unknown>): Promise<void>
}
```

### *.adapter.* â€” Adapters/Implementations

**Concrete implementations of ports.**

```
src/
â”œâ”€â”€ adapters/
â”‚   â”œâ”€â”€ sendgrid.adapter.ts       # SendGrid email implementation
â”‚   â”œâ”€â”€ stripe.adapter.ts         # Stripe payment implementation
â”‚   â””â”€â”€ s3.adapter.ts             # AWS S3 storage implementation
```

```typescript
// sendgrid.adapter.ts
import { EmailPort } from '../ports/email.port'
import sgMail from '@sendgrid/mail'

export class SendGridAdapter implements EmailPort {
  async send(to: string, subject: string, body: string): Promise<void> {
    await sgMail.send({
      to,
      subject,
      html: body,
    })
  }
}
```

### *.repository.* â€” Repositories

**Data access abstractions for aggregates/entities.**

```
src/
â”œâ”€â”€ repositories/
â”‚   â”œâ”€â”€ order.repository.ts       # Order repository
â”‚   â”œâ”€â”€ user.repository.ts        # User repository
â”‚   â””â”€â”€ product.repository.ts     # Product repository
```

```typescript
// order.repository.ts
export interface OrderRepository {
  findById(id: string): Promise<Order | null>
  findByCustomer(customerId: string): Promise<Order[]>
  save(order: Order): Promise<void>
  delete(id: string): Promise<void>
}
```

### *.use-case.* â€” Use Cases

**Application-level business operations.**

```
src/
â”œâ”€â”€ usecases/
â”‚   â”œâ”€â”€ create-order.usecase.ts   # Create order use case
â”‚   â”œâ”€â”€ cancel-order.usecase.ts   # Cancel order use case
â”‚   â””â”€â”€ process-payment.usecase.ts # Payment processing use case
```

```typescript
// create-order.usecase.ts
export class CreateOrderUseCase {
  constructor(
    private orderRepository: OrderRepository,
    private emailPort: EmailPort,
  ) {}

  async execute(params: CreateOrderParams): Promise<Order> {
    const order = Order.create(params)
    await this.orderRepository.save(order)
    await this.emailPort.send(
      order.customerEmail,
      'Order confirmed',
      `Your order ${order.id} has been confirmed.`
    )
    return order
  }
}
```

### *.entity.* â€” Domain Entities

**Core domain objects with identity.**

```
src/
â”œâ”€â”€ entities/
â”‚   â”œâ”€â”€ order.entity.ts           # Order entity
â”‚   â”œâ”€â”€ user.entity.ts            # User entity
â”‚   â””â”€â”€ product.entity.ts         # Product entity
```

```typescript
// order.entity.ts
export class Order {
  private constructor(
    readonly id: string,
    private items: OrderItem[],
    private status: OrderStatus,
    private total: Money,
  ) {}

  static create(params: CreateOrderParams): Order {
    return new Order(
      generateId(),
      params.items,
      'pending',
      calculateTotal(params.items),
    )
  }

  confirm(): void {
    if (this.status !== 'pending') {
      throw new Error('Only pending orders can be confirmed')
    }
    this.status = 'confirmed'
  }
}
```

### *.value-object.* â€” Value Objects

**Immutable objects defined by their attributes.**

```
src/
â”œâ”€â”€ value-objects/
â”‚   â”œâ”€â”€ money.value-object.ts     # Money value object
â”‚   â”œâ”€â”€ email.value-object.ts     # Email value object
â”‚   â””â”€â”€ address.value-object.ts   # Address value object
```

```typescript
// money.value-object.ts
export class Money {
  constructor(
    readonly amount: number,
    readonly currency: string,
  ) {}

  static zero(currency = 'USD'): Money {
    return new Money(0, currency)
  }

  add(other: Money): Money {
    if (this.currency !== other.currency) {
      throw new Error('Cannot add different currencies')
    }
    return new Money(this.amount + other.amount, this.currency)
  }
}
```

### *.policy.* â€” Policies/Rules

**Business rules and validation policies.**

```
src/
â”œâ”€â”€ policies/
â”‚   â”œâ”€â”€ order-policy.policy.ts    # Order business rules
â”‚   â”œâ”€â”€ pricing-policy.policy.ts  # Pricing rules
â”‚   â””â”€â”€ security-policy.policy.ts # Security rules
```

```typescript
// order-policy.policy.ts
export class OrderPolicy {
  static canCancel(order: Order): boolean {
    return order.status === 'pending'
  }

  static canModify(order: Order): boolean {
    return order.status === 'pending' && order.items.length <= 10
  }

  static requiresApproval(order: Order): boolean {
    return order.total.amount > 10000
  }
}
```

### *.event.* â€” Domain Events

**Event definitions and handlers.**

```
src/
â”œâ”€â”€ events/
â”‚   â”œâ”€â”€ order-created.event.ts    # Order created event
â”‚   â”œâ”€â”€ order-cancelled.event.ts  # Order cancelled event
â”‚   â””â”€â”€ payment-processed.event.ts # Payment processed event
```

```typescript
// order-created.event.ts
export class OrderCreatedEvent {
  constructor(
    readonly orderId: string,
    readonly customerId: string,
    readonly total: Money,
    readonly timestamp: Date = new Date(),
  ) {}
}

// Event handler
class OrderCreatedHandler {
  async handle(event: OrderCreatedEvent): Promise<void> {
    await this.inventoryService.reserve(event.orderId)
    await this.emailService.sendConfirmation(event.orderId)
  }
}
```

---

## 2. Directory Structure Example

```
src/
â”œâ”€â”€ components/          # UI components (*.view.*)
â”‚   â”œâ”€â”€ OrderList.view.tsx
â”‚   â””â”€â”€ OrderDetail.view.tsx
â”œâ”€â”€ pages/               # Page components (*.view.*)
â”‚   â”œâ”€â”€ Home.view.tsx
â”‚   â””â”€â”€ Dashboard.view.tsx
â”œâ”€â”€ hooks/               # React hooks (*.hook.*)
â”‚   â”œâ”€â”€ useAuth.hook.ts
â”‚   â””â”€â”€ useOrders.hook.ts
â”œâ”€â”€ logic/               # Business logic (*.logic.*)
â”‚   â”œâ”€â”€ order.logic.ts
â”‚   â””â”€â”€ pricing.logic.ts
â”œâ”€â”€ data/                # Data access (*.data.*)
â”‚   â”œâ”€â”€ order.data.ts
â”‚   â””â”€â”€ user.data.ts
â”œâ”€â”€ mappers/             # Data mappers (*.mapper.*)
â”‚   â”œâ”€â”€ order.mapper.ts
â”‚   â””â”€â”€ user.mapper.ts
â”œâ”€â”€ ports/               # Port interfaces (*.port.*)
â”‚   â”œâ”€â”€ email.port.ts
â”‚   â””â”€â”€ payment.port.ts
â”œâ”€â”€ adapters/            # Port implementations (*.adapter.*)
â”‚   â”œâ”€â”€ sendgrid.adapter.ts
â”‚   â””â”€â”€ stripe.adapter.ts
â”œâ”€â”€ repositories/        # Repositories (*.repository.*)
â”‚   â”œâ”€â”€ order.repository.ts
â”‚   â””â”€â”€ user.repository.ts
â”œâ”€â”€ usecases/            # Use cases (*.use-case.*)
â”‚   â”œâ”€â”€ create-order.usecase.ts
â”‚   â””â”€â”€ cancel-order.usecase.ts
â”œâ”€â”€ entities/            # Domain entities (*.entity.*)
â”‚   â”œâ”€â”€ order.entity.ts
â”‚   â””â”€â”€ user.entity.ts
â”œâ”€â”€ value-objects/       # Value objects (*.value-object.*)
â”‚   â”œâ”€â”€ money.value-object.ts
â”‚   â””â”€â”€ email.value-object.ts
â”œâ”€â”€ policies/            # Business policies (*.policy.*)
â”‚   â”œâ”€â”€ order-policy.policy.ts
â”‚   â””â”€â”€ pricing-policy.policy.ts
â”œâ”€â”€ events/              # Domain events (*.event.*)
â”‚   â”œâ”€â”€ order-created.event.ts
â”‚   â””â”€â”€ order-cancelled.event.ts
â”œâ”€â”€ schemas/             # Validation schemas (*.schema.*)
â”‚   â”œâ”€â”€ order.schema.ts
â”‚   â””â”€â”€ user.schema.ts
â”œâ”€â”€ types/               # Type definitions (*.types.*)
â”‚   â”œâ”€â”€ order.types.ts
â”‚   â””â”€â”€ user.types.ts
â””â”€â”€ main.ts              # Application entry point
```

---

## 3. Convention Summary

| Suffix | Purpose | Example |
|--------|---------|---------|
| `*.view.*` | UI/Presentation | `OrderList.view.tsx` |
| `*.logic.*` | Business Logic | `order.logic.ts` |
| `*.data.*` | Data Access | `order.data.ts` |
| `*.hook.*` | React Hooks | `useAuth.hook.ts` |
| `*.schema.*` | Validation Schemas | `order.schema.ts` |
| `*.types.*` | Type Definitions | `order.types.ts` |
| `*.mapper.*` | Data Transformation | `order.mapper.ts` |
| `*.port.*` | Interface Abstraction | `email.port.ts` |
| `*.adapter.*` | Implementation | `sendgrid.adapter.ts` |
| `*.repository.*` | Data Access Abstraction | `order.repository.ts` |
| `*.use-case.*` | Application Use Case | `create-order.usecase.ts` |
| `*.entity.*` | Domain Entity | `order.entity.ts` |
| `*.value-object.*` | Value Object | `money.value-object.ts` |
| `*.policy.*` | Business Rules | `order-policy.policy.ts` |
| `*.event.*` | Domain Event | `order-created.event.ts` |

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./Application Architecture/domain-driven-design.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./Architecture/clean-architecture.md)


## See Also
- [[A001-abstract-factory-pattern]]
- [[Architecture/abstract-factory-pattern]]
- [[A003-accessibility-a11y]]
- [[A004-accessibility-by-design]]
- [[A005-active-record-pattern]]


