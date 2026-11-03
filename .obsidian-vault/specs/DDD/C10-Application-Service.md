---
slug: application-service
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/articles/2023-01-software-architecture.html
date: 2026-11-02
tags:










  - ddd
  - application-service
  - domain-modeling
  - orchestration
---

# Application Service

## Definition

Application Service is **a operation defined by the way the application needs to work, coordinating domain objects to accomplish a task**.

> "An operation offered as an interface by a layer specifically designed to coordinate application tasks." — Martin Fowler

## Problem Addressed

Without application services:
- **No orchestration**: No clear coordination of domain objects
- **UI coupling**: Domain logic coupled to UI
- **Transaction issues**: No clear transaction boundaries
- **Security issues**: No clear security boundaries

## Scope and Boundaries

- Application Service ≠ Domain Service (application service orchestrates, domain service contains domain logic)
- Application Service = Orchestration (application service coordinates domain objects)
- Application Service is a **layer pattern**, not a domain pattern

## When to Apply

- When building applications with domain models
- when coordination of domain objects is needed
- when transaction boundaries need to be defined
- when security boundaries are important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Application services add architectural layers |
| **Time** — Designing application services takes time |
| **Over-service** — Not every operation needs an application service |

## Common Misuses

- **Every operation a service**: Not every operation needs an application service
- **Domain logic in application service**: Application services should orchestrate, not contain domain logic
- **Confusing with domain service**: Application services orchestrate, domain services contain domain logic

## Related Concepts

- [Domain Service](DDD/domain-service.md) — Domain services contain domain logic, application services orchestrate them
- [Use Case](DDD/use-case.md) — Application services often implement use cases
- [Service Layer](Architecture/service-layer-pattern.md) — Application services are a form of service layer

## Project Observations

- The project uses application services:
  - TypeScript functions can serve as application services
  - The project's architecture patterns note covers DDD concepts
  - No evidence of application services in existing code (src/ is empty)
- File naming conventions support application services:
  - `*.use-case.ts` — Use case files
  - `*.service.ts` — Service files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]

---

## Decision Tree: Application Service Design

```mermaid
graph TD
    A[Need to orchestrate?]\n    A --> B{Single aggregate?}
    B -->|Yes| C[Domain method]
    B -->|No| D[Application service]
    C --> E{Transaction needed?}
    E -->|Yes| F[Service with transaction]
    E -->|No| G[Direct call]
    D --> H{Multiple aggregates?}
    H -->|Yes| I[Orchestrate]
    H -->|No| J[Simple service]
    I --> K{Security needed?}
    K -->|Yes| L[Add auth check]
    K -->|No| M[Direct orchestration]
```

### When to Use Application Service

| Situation | Action | Example |
|-----------|--------|---------|
| **Multiple aggregates** | Application service | Order + Payment + Shipping |
| **Transaction needed** | Service with transaction | Transfer funds |
| **Security boundary** | Service with auth | Admin operations |
| **Use case** | Service implements use case | Create order |

---

## Procedural Guidance: Application Service Implementation

### Step 1: Define Service Interface

```typescript
// domains/order/application/create-order.service.ts
import { Order } from '@/domains/order/order.entity'
import { OrderRepository } from '@/domains/order/order.repository'
import { PaymentGateway } from '@/ports/payment.gateway.port'
import { Money } from '@/value-objects/money.vo'

export interface CreateOrderCommand {
  customerId: string
  items: Array<{
    product: string
    quantity: number
    price: Money
  }>
  shippingAddress: string
}

export interface CreateOrderResult {
  order: Order
  paymentId: string
}

export interface OrderService {
  create(command: CreateOrderCommand): Promise<CreateOrderResult>
  cancel(orderId: string, reason: string): Promise<void>
  getStatus(orderId: string): Promise<Order>
}
```

### Step 2: Implement Service

```typescript
// domains/order/application/order.service.ts
import { Order } from '@/domains/order/order.entity'
import { OrderRepository } from '@/domains/order/order.repository'
import { PaymentGateway } from '@/ports/payment.gateway.port'
import { ShippingGateway } from '@/ports/shipping.gateway.port'
import { Money } from '@/value-objects/money.vo'
import { OrderCreatedEvent } from '@/events/order-created.event'

export class OrderService implements OrderService {
  constructor(
    private orderRepository: OrderRepository,
    private paymentGateway: PaymentGateway,
    private shippingGateway: ShippingGateway,
  ) {}

  async create(command: CreateOrderCommand): Promise<CreateOrderResult> {
    // 1. Create order aggregate
    const order = Order.create(command.customerId, command.items)
    
    // 2. Calculate total
    const total = order.getTotal()
    
    // 3. Process payment
    const paymentResult = await this.paymentGateway.charge({
      amount: total,
      customerId: command.customerId,
    })
    
    if (!paymentResult.success) {
      throw new Error(`Payment failed: ${paymentResult.error}`)
    }
    
    // 4. Save order
    await this.orderRepository.save(order)
    
    // 5. Arrange shipping
    await this.shippingGateway.arrange({
      orderId: order.getId(),
      address: command.shippingAddress,
    })
    
    // 6. Publish domain event
    const event = new OrderCreatedEvent(
      order.getId(),
      command.customerId,
      order.getItems(),
      paymentResult.paymentId,
    )
    await this.eventPublisher.publish(event)
    
    return {
      order,
      paymentId: paymentResult.paymentId,
    }
  }

  async cancel(orderId: string, reason: string): Promise<void> {
    const order = await this.orderRepository.findById(orderId)
    if (!order) {
      throw new Error('Order not found')
    }
    
    order.cancel()
    await this.orderRepository.save(order)
    
    // Refund payment
    await this.paymentGateway.refund(order.getId())
  }

  async getStatus(orderId: string): Promise<Order> {
    const order = await this.orderRepository.findById(orderId)
    if (!order) {
      throw new Error('Order not found')
    }
    return order
  }
}
```

### Step 3: Use in Controller

```typescript
// adapters/controllers/order.controller.ts
import { Request, Response } from 'express'
import { OrderService } from '@/domains/order/application/order.service'
import type { CreateOrderCommand } from '@/domains/order/application/create-order.service'

export class OrderController {
  constructor(private orderService: OrderService) {}

  async createOrder(req: Request, res: Response): Promise<void> {
    try {
      const command: CreateOrderCommand = {
        customerId: req.user.id,
        items: req.body.items,
        shippingAddress: req.body.shippingAddress,
      }

      const result = await this.orderService.create(command)

      res.status(201).json({
        orderId: result.order.getId(),
        paymentId: result.paymentId,
        status: result.order.getStatus(),
      })
    } catch (error) {
      res.status(400).json({ error: (error as Error).message })
    }
  }

  async getOrderStatus(req: Request, res: Response): Promise<void> {
    try {
      const order = await this.orderService.getStatus(req.params.id)
      res.json({
        id: order.getId(),
        status: order.getStatus(),
        total: order.getTotal().value,
      })
    } catch (error) {
      res.status(404).json({ error: (error as Error).message })
    }
  }
}
```

### Step 4: Wire Dependencies

```typescript
// container.ts
import { PrismaOrderRepository } from '@/infrastructure/order/prisma-order-repository'
import { StripePaymentGateway } from '@/infrastructure/payment/stripe-gateway'
import { ShippingServiceGateway } from '@/infrastructure/shipping/shipping-gateway'
import { OrderService } from '@/domains/order/application/order.service'
import { OrderController } from '@/adapters/controllers/order.controller'

export function createContainer() {
  const orderRepository = new PrismaOrderRepository()
  const paymentGateway = new StripePaymentGateway(process.env.STRIPE_SECRET_KEY)
  const shippingGateway = new ShippingServiceGateway(process.env.SHIPPING_API_KEY)
  
  const orderService = new OrderService(
    orderRepository,
    paymentGateway,
    shippingGateway,
  )
  
  const orderController = new OrderController(orderService)
  
  return { orderController, orderService }
}
```

### Step 5: Test Service

```typescript
// tests/order.service.test.ts
import { describe, it, expect, vi } from 'vitest'
import { OrderService } from '@/domains/order/application/order.service'
import { Order } from '@/domains/order/order.entity'
import type { OrderRepository } from '@/domains/order/order.repository'
import type { PaymentGateway } from '@/ports/payment.gateway.port'
import type { ShippingGateway } from '@/ports/shipping.gateway.port'
import { Money } from '@/value-objects/money.vo'

describe('OrderService', () => {
  const mockRepo = {
    save: vi.fn(),
    findById: vi.fn(),
  } as unknown as OrderRepository

  const mockPayment = {
    charge: vi.fn().mockResolvedValue({ success: true, paymentId: 'pay-123' }),
    refund: vi.fn(),
  } as unknown as PaymentGateway

  const mockShipping = {
    arrange: vi.fn(),
  } as unknown as ShippingGateway

  const service = new OrderService(mockRepo, mockPayment, mockShipping)

  it('should create order with payment', async () => {
    const command = {
      customerId: 'cust-1',
      items: [{ product: 'Widget', quantity: 2, price: new Money(10) }],
      shippingAddress: '123 Main St',
    }

    const result = await service.create(command)

    expect(result.order).toBeDefined()
    expect(result.paymentId).toBe('pay-123')
    expect(mockPayment.charge).toHaveBeenCalledWith({
      amount: new Money(20),
      customerId: 'cust-1',
    })
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Implementing application services
- Orchestrating domain aggregates
- Creating use case implementations
- Building service controllers
- Testing application services

### What to Do With This Information
1. **Orchestration**: Application services coordinate multiple aggregates
2. **Transaction boundaries**: Services manage transactions
3. **Security boundaries**: Services add authentication/authorization
4. **Domain events**: Services publish domain events
5. **Dependency injection**: Services receive dependencies via constructor

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `express` — for controllers
- **npm Package**: `vitest` — for testing services
- **Terminal Command**: `pnpm test` — run tests

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing new services
- **Code Review Agent**: Run when reviewing PRs with service changes

### Integration with Other Notes
- read [[aggregate]] for aggregate patterns
- read [[aggregate-root]] for aggregate root patterns
- read [[entity]] for entity patterns
- read [[domain-service]] for domain service patterns
- read [[use-case]] for use case patterns
- read [ddd-patterns](D/ddd-patterns.md) for domain-driven design patterns

### Common Pitfalls
- Don't put domain logic in application services (use domain methods)
- Don't create a service for every operation (only when orchestration needed)
- Don't couple to UI (services should be UI-agnostic)
- Don't skip transactions (manage boundaries properly)
- Don't ignore security (add auth checks in services)

### Quick Validation Checklist
- [ ] Does the service orchestrate multiple aggregates?
- [ ] Are domain methods used (not domain logic)?
- [ ] Are transactions managed properly?
- [ ] Is security handled in the service?
- [ ] Are domain events published?
- [ ] Is the service testable?




