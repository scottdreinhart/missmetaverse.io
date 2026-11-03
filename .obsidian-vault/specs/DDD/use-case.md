---
slug: use-case-ddd
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/UseCase.html
date: 2026-11-02
tags:
  - ddd
  - use-case
  - domain-modeling
  - requirements
---

# Use Case

## Definition

Use Case is **a description of how a user interacts with a system to achieve a goal, capturing the system's behavior from the user's perspective**.

> "A use case describes a sequence of interactions between an actor and a system that produces a result of value to the actor." — Alistair Cockburn

## Problem Addressed

Without use cases:
- **Unclear requirements**: System behavior is not well defined
- **Missing scenarios**: Edge cases are not considered
- **Testing issues**: Hard to test system behavior
- **Communication**: Developers and stakeholders don't share understanding

## Scope and Boundaries

- Use Case ≠ User Story (use case is detailed and formal, user story is informal and brief)
- Use Case = Requirements (use cases capture system requirements)
- Use Case is a **requirements artifact**, not a code pattern

## When to Apply

- When gathering requirements
- when system behavior needs to be documented
- when testing scenarios need to be defined
- when communication between stakeholders and developers is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Effort** — Writing use cases takes effort |
| **Time** — Detailed use cases take time to create |
| **Over-documentation** — Don't write use cases for simple systems |

## Common Misuses

- **Every feature a use case**: Not every feature needs a detailed use case
- **Ignoring edge cases**: Use cases should cover edge cases, not happy paths
- **Confusing with user story**: Use cases are detailed, user stories are brief

## Related Concepts

- [Application Service](DDD/application-service.md) — Application services often implement use cases
- [Domain Service](DDD/domain-service.md) — Domain services support use cases
- [Event Sourcing](Data Databases/event-sourcing.md) — Use cases can be implemented with event sourcing

## Project Observations

- The project uses use cases:
  - TypeScript files can serve as use case implementations
  - The project's architecture patterns note covers DDD concepts
  - No evidence of use cases in existing code (src/ is empty)
- File naming conventions support use cases:
  - `*.use-case.ts` — Use case files
  - `*.logic.ts` — Logic files

## Sources

- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/fowler-ddd-2003|fowler-ddd-2003]]

---

## Decision Tree: Use Case Design

```mermaid
graph TD
    A[Need to define behavior?]\n    A --> B{User goal?}
    B -->|Yes| C[Use case]
    B -->|No| D[Domain method]
    C --> E{Complex?}
    E -->|Yes| F[Detailed use case]
    E -->|No| G[Simple scenario]
    F --> H{Multiple actors?}
    H -->|Yes| I[Include/Extend]
    H -->|No| J[Single flow]
    I --> K{Shared behavior?}
    K -->|Yes| L[Include]
    K -->|No| M[Extend]
```

### When to Use Use Case

| Situation | Action | Example |
|-----------|--------|---------|
| **User goal** | Use case | User registers |
| **Complex flow** | Detailed use case | Order processing |
| **Multiple actors** | Include/Extend | Payment + Notification |
| **Testing** | Test scenarios | Happy path + edge cases |

---

## Procedural Guidance: Use Case Implementation

### Step 1: Define Use Case Document

```markdown
# Use Case: Create Order

**ID:** UC-001
**Actor:** Customer
**Goal:** Place an order for products
**Preconditions:** User is logged in, cart has items
**Postconditions:** Order is created, payment is processed

## Main Flow

1. User adds items to cart
2. User proceeds to checkout
3. System validates cart items
4. User enters shipping address
5. User selects payment method
6. System calculates total
7. User confirms order
8. System processes payment
9. System creates order
10. System shows confirmation

## Alternative Flows

- A1: Invalid cart items → Show error, return to cart
- A2: Payment failed → Show error, retry payment
- A3: Out of stock → Show error, remove items

## Edge Cases

- E1: Cart is empty → Show "Add items" message
- E2: User not logged in → Redirect to login
- E3: Network failure → Show retry option
```

### Step 2: Implement Use Case as Application Service

```typescript
// usecases/create-order.usecase.ts
import { Order } from '@/domains/order/order.entity'
import { OrderRepository } from '@/domains/order/order.repository'
import { PaymentGateway } from '@/ports/payment.gateway.port'
import { ShippingGateway } from '@/ports/shipping.gateway.port'
import { Money } from '@/value-objects/money.vo'

export interface CreateOrderInput {
  customerId: string
  items: Array<{
    productId: string
    quantity: number
  }>
  shippingAddress: string
  paymentMethod: string
}

export interface CreateOrderResult {
  orderId: string
  paymentId: string
  total: Money
}

export class CreateOrderUseCase {
  constructor(
    private orderRepository: OrderRepository,
    private paymentGateway: PaymentGateway,
    private shippingGateway: ShippingGateway,
  ) {}

  async execute(input: CreateOrderInput): Promise<CreateOrderResult> {
    // 1. Validate cart items
    const items = await this.validateCartItems(input.items)
    
    // 2. Create order aggregate
    const order = Order.create(input.customerId, items)
    
    // 3. Calculate total
    const total = order.getTotal()
    
    // 4. Process payment
    const paymentResult = await this.paymentGateway.charge({
      amount: total,
      customerId: input.customerId,
      method: input.paymentMethod,
    })
    
    if (!paymentResult.success) {
      throw new Error(`Payment failed: ${paymentResult.error}`)
    }
    
    // 5. Save order
    await this.orderRepository.save(order)
    
    // 6. Arrange shipping
    await this.shippingGateway.arrange({
      orderId: order.getId(),
      address: input.shippingAddress,
    })
    
    return {
      orderId: order.getId(),
      paymentId: paymentResult.paymentId,
      total,
    }
  }

  private async validateCartItems(
    items: Array<{ productId: string; quantity: number }>,
  ): Promise<Array<{ product: string; quantity: number; price: Money }>> {
    // Validate each item exists and has sufficient stock
    return items.map(item => ({
      product: item.productId,
      quantity: item.quantity,
      price: new Money(0), // Get from product catalog
    }))
  }
}
```

### Step 3: Define Use Case Tests

```typescript
// tests/create-order.usecase.test.ts
import { describe, it, expect, vi } from 'vitest'
import { CreateOrderUseCase } from '@/usecases/create-order.usecase'
import { Order } from '@/domains/order/order.entity'
import type { OrderRepository } from '@/domains/order/order.repository'
import type { PaymentGateway } from '@/ports/payment.gateway.port'
import type { ShippingGateway } from '@/ports/shipping.gateway.port'
import { Money } from '@/value-objects/money.vo'

describe('CreateOrderUseCase', () => {
  const mockRepo = {
    save: vi.fn(),
  } as unknown as OrderRepository

  const mockPayment = {
    charge: vi.fn().mockResolvedValue({ success: true, paymentId: 'pay-123' }),
  } as unknown as PaymentGateway

  const mockShipping = {
    arrange: vi.fn(),
  } as unknown as ShippingGateway

  const useCase = new CreateOrderUseCase(mockRepo, mockPayment, mockShipping)

  describe('Main Flow', () => {
    it('should create order successfully', async () => {
      const input = {
        customerId: 'cust-1',
        items: [{ productId: 'prod-1', quantity: 2 }],
        shippingAddress: '123 Main St',
        paymentMethod: 'credit_card',
      }

      const result = await useCase.execute(input)

      expect(result.orderId).toBeDefined()
      expect(result.paymentId).toBe('pay-123')
      expect(result.total).toBeDefined()
      expect(mockRepo.save).toHaveBeenCalled()
      expect(mockPayment.charge).toHaveBeenCalled()
      expect(mockShipping.arrange).toHaveBeenCalled()
    })
  })

  describe('Alternative Flow: Payment Failed', () => {
    it('should throw error when payment fails', async () => {
      mockPayment.charge.mockResolvedValueOnce({
        success: false,
        error: 'Insufficient funds',
      })

      const input = {
        customerId: 'cust-1',
        items: [{ productId: 'prod-1', quantity: 2 }],
        shippingAddress: '123 Main St',
        paymentMethod: 'credit_card',
      }

      await expect(useCase.execute(input)).rejects.toThrow('Payment failed')
    })
  })

  describe('Edge Cases', () => {
    it('should handle empty cart', async () => {
      const input = {
        customerId: 'cust-1',
        items: [],
        shippingAddress: '123 Main St',
        paymentMethod: 'credit_card',
      }

      await expect(useCase.execute(input)).rejects.toThrow()
    })

    it('should handle invalid product ID', async () => {
      const input = {
        customerId: 'cust-1',
        items: [{ productId: 'invalid', quantity: 1 }],
        shippingAddress: '123 Main St',
        paymentMethod: 'credit_card',
      }

      await expect(useCase.execute(input)).rejects.toThrow()
    })
  })
})
```

### Step 4: Wire Use Case to Controller

```typescript
// controllers/order.controller.ts
import { Request, Response } from 'express'
import { CreateOrderUseCase } from '@/usecases/create-order.usecase'

export class OrderController {
  private createOrderUseCase: CreateOrderUseCase

  constructor(createOrderUseCase: CreateOrderUseCase) {
    this.createOrderUseCase = createOrderUseCase
  }

  async createOrder(req: Request, res: Response): Promise<void> {
    try {
      const input = {
        customerId: req.user.id,
        items: req.body.items,
        shippingAddress: req.body.shippingAddress,
        paymentMethod: req.body.paymentMethod,
      }

      const result = await this.createOrderUseCase.execute(input)

      res.status(201).json({
        orderId: result.orderId,
        paymentId: result.paymentId,
        total: result.total.value,
      })
    } catch (error) {
      res.status(400).json({ error: (error as Error).message })
    }
  }
}
```

### Step 5: Define Use Case Include/Extend Relationships

```typescript
// usecases/checkout.usecase.ts
import { ProcessPaymentUseCase } from './process-payment.usecase'
import { ArrangeShippingUseCase } from './arrange-shipping.usecase'
import { SendConfirmationUseCase } from './send-confirmation.usecase'

export class CheckoutUseCase {
  constructor(
    private processPayment: ProcessPaymentUseCase,
    private arrangeShipping: ArrangeShippingUseCase,
    private sendConfirmation: SendConfirmationUseCase,
  ) {}

  async execute(orderId: string): Promise<void> {
    // Main flow
    await this.processPayment.execute(orderId)
    await this.arrangeShipping.execute(orderId)
    await this.sendConfirmation.execute(orderId)
  }
}

// Include relationship: Checkout includes ProcessPayment
// Extend relationship: SendConfirmation extends Checkout
```

---

## Copilot Instructions

### When to Read This Note
- Defining use cases
- Implementing application services
- Writing use case tests
- Mapping use cases to code
- Documenting system behavior

### What to Do With This Information
1. **Use case documents**: Define user goals, main flow, alternative flows, edge cases
2. **Application services**: Implement use cases as application services
3. **Testing**: Test main flow, alternative flows, and edge cases
4. **Controller wiring**: Wire use cases to HTTP controllers
5. **Include/Extend**: Use relationships for shared behavior

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `vitest` — for testing use cases
- **npm Package**: `express` — for controllers
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm tsc --noEmit` — type check

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing new use cases
- **Testing Agent**: Run when writing use case tests

### Integration with Other Notes
- read [[application-service]] for application service patterns
- read [[domain-service]] for domain service patterns
- read [[use-case]] for use case patterns
- read [[event-sourcing]] for event sourcing patterns
- read [ddd-patterns](D/ddd-patterns.md) for domain-driven design patterns

### Common Pitfalls
- Don't write use cases for simple systems (keep it lightweight)
- Don't ignore edge cases (test all scenarios)
- Don't confuse use cases with user stories (use cases are detailed)
- Don't put domain logic in use cases (use domain services)
- Don't skip testing (test main flow, alternatives, edge cases)

### Quick Validation Checklist
- [ ] Are use cases documented with main flow?
- [ ] Are alternative flows defined?
- [ ] Are edge cases tested?
- [ ] Are use cases implemented as application services?
- [ ] Are use cases wired to controllers?
- [ ] Are include/extend relationships used?

