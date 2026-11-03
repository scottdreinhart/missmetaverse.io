---
slug: file-level-separation-conventions
sources:
  - https://docs.microsoft.com/en-us/dotnet/architecture/microservices/
  - https://www.enterpriseintegrationpatterns.com/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/optimization
  - status/complete
  - type/reference
  - domain/architecture
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
---

# File-Level Separation Conventions

## Overview

File-level separation conventions define naming patterns and organizational rules for files within a codebase. These conventions make it easy to understand a file's purpose at a glance.

---

## 1. Naming Conventions

### *.view.* — UI/View Layer

**Files that handle presentation and user interface.**

```
src/
├── components/
│   ├── OrderList.view.tsx        # UI component for listing orders
│   ├── OrderDetail.view.tsx      # UI component for order details
│   └── Dashboard.view.tsx        # Dashboard UI
├── pages/
│   ├── Home.view.tsx
│   └── Login.view.tsx
```

```typescript
// OrderList.view.tsx — Purely presentational
interface OrderListProps {
  orders: Order[]
  onSelect: (order: Order) => void
}

export function OrderList({ orders, onSelect }: OrderListProps) {
  return (
    <ul>
      {orders.map(order => (
        <li key={order.id} onClick={() => onSelect(order)}>
          {order.id} — {order.status}
        </li>
      ))}
    </ul>
  )
}
```

### *.logic.* — Business Logic

**Files that contain business rules and domain logic.**

```
src/
├── logic/
│   ├── order.logic.ts            # Order business rules
│   ├── pricing.logic.ts          # Pricing calculations
│   └── validation.logic.ts       # Validation rules
```

```typescript
// order.logic.ts — Business rules
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

### *.data.* — Data Layer

**Files that handle data access and storage.**

```
src/
├── data/
│   ├── order.data.ts             # Order data access
│   ├── user.data.ts              # User data access
│   └── cache.data.ts             # Caching layer
```

```typescript
// order.data.ts — Data access
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

### *.hook.* — React Hooks

**Custom React hooks.**

```
src/
├── hooks/
│   ├── useAuth.hook.ts           # Authentication hook
│   ├── useOrders.hook.ts         # Orders data hook
│   └── useDebounce.hook.ts       # Debounce utility hook
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

### *.schema.* — Data Schemas

**Validation schemas and data contracts.**

```
src/
├── schemas/
│   ├── order.schema.ts           # Order validation schema
│   ├── user.schema.ts            # User validation schema
│   └── api.schema.ts             # API request/response schemas
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

### *.types.* — Type Definitions

**TypeScript type and interface definitions.**

```
src/
├── types/
│   ├── order.types.ts            # Order-related types
│   ├── user.types.ts             # User-related types
│   └── api.types.ts              # API-related types
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

### *.mapper.* — Data Mappers

**Transform data between layers.**

```
src/
├── mappers/
│   ├── order.mapper.ts         # Order data transformation
│   ├── user.mapper.ts          # User data transformation
│   └── api.mapper.ts            # API response mapping
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

### *.port.* — Ports/Interfaces

**Abstraction interfaces for dependencies.**

```
src/
├── ports/
│   ├── email.port.ts             # Email service interface
│   ├── payment.port.ts           # Payment service interface
│   └── storage.port.ts           # Storage service interface
```

```typescript
// email.port.ts
export interface EmailPort {
  send(to: string, subject: string, body: string): Promise<void>
  sendTemplate(templateId: string, to: string, data: Record<string, unknown>): Promise<void>
}
```

### *.adapter.* — Adapters/Implementations

**Concrete implementations of ports.**

```
src/
├── adapters/
│   ├── sendgrid.adapter.ts       # SendGrid email implementation
│   ├── stripe.adapter.ts         # Stripe payment implementation
│   └── s3.adapter.ts             # AWS S3 storage implementation
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

### *.repository.* — Repositories

**Data access abstractions for aggregates/entities.**

```
src/
├── repositories/
│   ├── order.repository.ts       # Order repository
│   ├── user.repository.ts        # User repository
│   └── product.repository.ts     # Product repository
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

### *.use-case.* — Use Cases

**Application-level business operations.**

```
src/
├── usecases/
│   ├── create-order.usecase.ts   # Create order use case
│   ├── cancel-order.usecase.ts   # Cancel order use case
│   └── process-payment.usecase.ts # Payment processing use case
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

### *.entity.* — Domain Entities

**Core domain objects with identity.**

```
src/
├── entities/
│   ├── order.entity.ts           # Order entity
│   ├── user.entity.ts            # User entity
│   └── product.entity.ts         # Product entity
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

### *.value-object.* — Value Objects

**Immutable objects defined by their attributes.**

```
src/
├── value-objects/
│   ├── money.value-object.ts     # Money value object
│   ├── email.value-object.ts     # Email value object
│   └── address.value-object.ts   # Address value object
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

### *.policy.* — Policies/Rules

**Business rules and validation policies.**

```
src/
├── policies/
│   ├── order-policy.policy.ts    # Order business rules
│   ├── pricing-policy.policy.ts  # Pricing rules
│   └── security-policy.policy.ts # Security rules
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

### *.event.* — Domain Events

**Event definitions and handlers.**

```
src/
├── events/
│   ├── order-created.event.ts    # Order created event
│   ├── order-cancelled.event.ts  # Order cancelled event
│   └── payment-processed.event.ts # Payment processed event
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
├── components/          # UI components (*.view.*)
│   ├── OrderList.view.tsx
│   └── OrderDetail.view.tsx
├── pages/               # Page components (*.view.*)
│   ├── Home.view.tsx
│   └── Dashboard.view.tsx
├── hooks/               # React hooks (*.hook.*)
│   ├── useAuth.hook.ts
│   └── useOrders.hook.ts
├── logic/               # Business logic (*.logic.*)
│   ├── order.logic.ts
│   └── pricing.logic.ts
├── data/                # Data access (*.data.*)
│   ├── order.data.ts
│   └── user.data.ts
├── mappers/             # Data mappers (*.mapper.*)
│   ├── order.mapper.ts
│   └── user.mapper.ts
├── ports/               # Port interfaces (*.port.*)
│   ├── email.port.ts
│   └── payment.port.ts
├── adapters/            # Port implementations (*.adapter.*)
│   ├── sendgrid.adapter.ts
│   └── stripe.adapter.ts
├── repositories/        # Repositories (*.repository.*)
│   ├── order.repository.ts
│   └── user.repository.ts
├── usecases/            # Use cases (*.use-case.*)
│   ├── create-order.usecase.ts
│   └── cancel-order.usecase.ts
├── entities/            # Domain entities (*.entity.*)
│   ├── order.entity.ts
│   └── user.entity.ts
├── value-objects/       # Value objects (*.value-object.*)
│   ├── money.value-object.ts
│   └── email.value-object.ts
├── policies/            # Business policies (*.policy.*)
│   ├── order-policy.policy.ts
│   └── pricing-policy.policy.ts
├── events/              # Domain events (*.event.*)
│   ├── order-created.event.ts
│   └── order-cancelled.event.ts
├── schemas/             # Validation schemas (*.schema.*)
│   ├── order.schema.ts
│   └── user.schema.ts
├── types/               # Type definitions (*.types.*)
│   ├── order.types.ts
│   └── user.types.ts
└── main.ts              # Application entry point
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
- [DDD Patterns](./ddd-patterns.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./coding-practices.md)


## See Also
- [[A001-abstract-factory-pattern]]
- [[A002-abstract-factory-patterns]]
- [[A003-accessibility-a11y]]
- [[A004-accessibility-by-design]]
- [[A005-active-record-pattern]]


