---
slug: architecture-patterns
sources:
  - https://docs.microsoft.com/en-us/dotnet/architecture/microservices/
  - https://www.enterpriseintegrationpatterns.com/
date: 2026-11-02
tags:
  - architecture
  - microservices
  - monolith
  - cqrs
  - event-driven
  - layered-architecture
  - hexagonal
  - onion
  - vertical-slice
---

# Architecture Patterns

## Overview

Architecture patterns define how software is structured at a high level. Each pattern addresses different concerns: deployment, boundaries, data flow, and dependency direction.

---

## 1. Application Architecture

### Layered Architecture

**Separate presentation, application, domain, and infrastructure responsibilities.**

```
┌─────────────────────────────────────────┐
│  Presentation Layer                     │
│  • UI, Controllers, API endpoints       │
├─────────────────────────────────────────┤
│  Application Layer                      │
│  • Use cases, orchestration             │
├─────────────────────────────────────────┤
│  Domain Layer                           │
│  • Entities, business rules             │
├─────────────────────────────────────────┤
│  Infrastructure Layer                   │
│  • Database, external services          │
└─────────────────────────────────────────┘
         Dependencies point DOWN only
```

### Modular Monolith

**Deploy one application while maintaining explicit internal module boundaries.**

```
monolith/
├── modules/
│   ├── user/
│   │   ├── user.entity.ts
│   │   ├── user.repository.ts
│   │   └── user.usecase.ts
│   ├── order/
│   │   ├── order.entity.ts
│   │   ├── order.repository.ts
│   │   └── order.usecase.ts
│   └── payment/
│       ├── payment.entity.ts
│       ├── payment.repository.ts
│       └── payment.usecase.ts
└── shared/
    ├── common/
    └── gateway/
```

### Microservices

**Separate independently deployable services around meaningful capabilities and ownership.**

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  User Svc   │    │  Order Svc  │    │ Payment Svc │
│             │    │             │    │             │
│ - Register  │    │ - Create    │    │ - Charge    │
│ - Login     │◄──►│ - Place     │◄──►│ - Refund    │
│ - Profile   │    │ - Cancel    │    │ - Status    │
│             │    │             │    │             │
│ [DB]        │    │ [DB]        │    │ [DB]        │
└─────────────┘    └─────────────┘    └─────────────┘
        ▲                  ▲                  ▲
        │                  │                  │
        └──────────────────┴──────────────────┘
                           │
                    ┌─────────────┐
                    │ API Gateway │
                    └─────────────┘
```

### Service-Oriented Architecture (SOA)

**Organize capabilities as services with explicit contracts.**

| Feature | SOA | Microservices |
|---------|-----|---------------|
| **Communication** | Enterprise bus (ESB) | Lightweight (HTTP/gRPC) |
| **Data** | Shared databases | Own databases |
| **Deployment** | Coordinated | Independent |
| **Scope** | Enterprise-wide | Service-specific |

---

## 2. Data & Event Architecture

### Event-Driven Architecture

**Coordinate behavior through production and consumption of events.**

```typescript
// Event Producer
class OrderService {
  async placeOrder(params: PlaceOrderParams): Promise<Order> {
    const order = Order.create(params)
    await this.orderRepository.save(order)

    // Publish events
    this.eventBus.publish(new OrderCreatedEvent(order.id))
    this.eventBus.publish(new InventoryReservedEvent(order.id))

    return order
  }
}

// Event Consumers
class EmailNotifier {
  @Subscribe(OrderCreatedEvent)
  async handle(event: OrderCreatedEvent): Promise<void> {
    await this.emailService.sendConfirmation(event.aggregateId)
  }
}

class AnalyticsTracker {
  @Subscribe(OrderCreatedEvent)
  async handle(event: OrderCreatedEvent): Promise<void> {
    await this.analytics.track('order_created', event)
  }
}

class InventoryUpdater {
  @Subscribe(OrderCreatedEvent)
  async handle(event: OrderCreatedEvent): Promise<void> {
    await this.inventory.reserve(event.aggregateId)
  }
}
```

### CQRS (Command Query Responsibility Segregation)

**Separate command and query models where their needs justify the distinction.**

```typescript
// Command side (writes)
interface OrderCommand {
  type: 'CREATE_ORDER' | 'CANCEL_ORDER' | 'ADD_ITEM'
  payload: unknown
}

class OrderCommandHandler {
  async handle(command: OrderCommand): Promise<void> {
    switch (command.type) {
      case 'CREATE_ORDER':
        const order = Order.create(command.payload as CreateOrderPayload)
        await this.orderRepository.save(order)
        break
      case 'CANCEL_ORDER':
        const order = await this.orderRepository.findById(command.payload.id)
        order.cancel()
        await this.orderRepository.save(order)
        break
    }
  }
}

// Query side (reads) — optimized read model
class OrderQueryHandler {
  async getOrdersByCustomer(customerId: string): Promise<OrderDto[]> {
    // Read from optimized read model (not entities)
    return this.readModel.query('SELECT * FROM orders WHERE customer_id = ?', [customerId])
  }

  async getOrderDetails(orderId: string): Promise<OrderDetailDto> {
    return this.readModel.query('SELECT * FROM order_details WHERE order_id = ?', [orderId])
  }
}
```

### Vertical Slice Architecture

**Organize work around use cases or features across the layers they require.**

```
src/
├── features/
│   ├── authentication/
│   │   ├── login.usecase.ts
│   │   ├── register.usecase.ts
│   │   ├── login.controller.ts
│   │   └── login.dto.ts
│   ├── orders/
│   │   ├── create-order.usecase.ts
│   │   ├── cancel-order.usecase.ts
│   │   ├── create-order.controller.ts
│   │   └── order.dto.ts
│   └── payments/
│       ├── charge.usecase.ts
│       └── charge.controller.ts
└── shared/
    ├── common/
    └── gateway/
```

---

## 3. Integration Patterns

### Transactional Outbox

**Persist a business change and an event-publication intent in one transaction.**

```typescript
class OrderService {
  async placeOrder(params: PlaceOrderParams): Promise<Order> {
    return await this.db.transaction(async (tx) => {
      // 1. Create order
      const order = Order.create(params)
      await tx.insert('orders', order)

      // 2. Insert into outbox (same transaction!)
      await tx.insert('outbox', {
        aggregate_id: order.id,
        event_type: 'OrderCreated',
        payload: JSON.stringify({ orderId: order.id }),
        created_at: new Date(),
        status: 'pending',
      })

      return order
    })
  }
}

// Background worker publishes outbox events
class OutboxPublisher {
  async publishPendingEvents(): Promise<void> {
    const events = await this.db.query(
      'SELECT * FROM outbox WHERE status = \'pending\' LIMIT 100'
    )

    for (const event of events) {
      await this.eventBus.publish(event.event_type, event.payload)
      await this.db.query(
        'UPDATE outbox SET status = \'published\' WHERE id = ?',
        [event.id]
      )
    }
  }
}
```

### Saga Pattern

**Coordinate multi-step distributed work using local transactions and compensating actions.**

```typescript
class OrderSaga {
  async execute(params: PlaceOrderParams): Promise<void> {
    let reservationId: string | null = null
    let paymentId: string | null = null

    try {
      // Step 1: Reserve inventory
      reservationId = await this.inventoryService.reserve(params.items)

      // Step 2: Process payment
      paymentId = await this.paymentService.charge(params.total)

      // Step 3: Confirm order
      await this.orderService.confirm(params.orderId)

    } catch (error) {
      // Compensating actions (rollback)
      if (paymentId) {
        await this.paymentService.refund(paymentId)
      }
      if (reservationId) {
        await this.inventoryService.release(reservationId)
      }
      throw error
    }
  }
}
```

### Circuit Breaker

**Temporarily stop calls to a failing dependency.**

```typescript
class CircuitBreaker {
  private state: 'closed' | 'open' | 'half-open' = 'closed'
  private failures = 0
  private readonly threshold: number
  private readonly timeout: number

  constructor(threshold = 5, timeout = 30000) {
    this.threshold = threshold
    this.timeout = timeout
  }

  async execute<T>(fn: () => Promise<T>): Promise<T> {
    if (this.state === 'open') {
      throw new CircuitBreakerOpenError('Circuit is open')
    }

    try {
      const result = await fn()
      this.onSuccess()
      return result
    } catch (error) {
      this.onFailure()
      throw error
    }
  }

  private onSuccess(): void {
    this.failures = 0
    this.state = 'closed'
  }

  private onFailure(): void {
    this.failures++
    if (this.failures >= this.threshold) {
      this.state = 'open'
      setTimeout(() => { this.state = 'half-open' }, this.timeout)
    }
  }
}

// Usage
const breaker = new CircuitBreaker(5, 30000)
const result = await breaker.execute(() => externalApi.call())
```

### Retry with Backoff and Jitter

```typescript
async function retryWithBackoff<T>(
  fn: () => Promise<T>,
  maxRetries = 3,
  baseDelay = 1000
): Promise<T> {
  let lastError: Error

  for (let attempt = 0; attempt <= maxRetries; attempt++) {
    try {
      return await fn()
    } catch (error) {
      lastError = error as Error

      if (attempt === maxRetries) break

      // Exponential backoff with jitter
      const delay = baseDelay * Math.pow(2, attempt) * (0.5 + Math.random())
      await sleep(delay)
    }
  }

  throw lastError!
}
```

---

## 4. Architecture Comparison

| Pattern | Best For | Trade-offs |
|---------|----------|------------|
| **Layered** | Simple apps, CRUD | Tight coupling between layers |
| **Modular Monolith** | Most projects, start here | Single deployment unit |
| **Microservices** | Large teams, scaling needs | Operational complexity |
| **SOA** | Enterprise integration | ESB overhead |
| **Event-Driven** | Decoupled systems, real-time | eventual consistency |
| **CQRS** | Different read/write needs | Double data model |
| **Vertical Slice** | Feature-based teams | Code duplication across slices |
| **Hexagonal/Clean** | Testability, independence | More boilerplate |

> Clean, Hexagonal, Onion, DDD, and vertical slices can coexist. Microservices and CQRS introduce costs and should follow concrete requirements.

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./ddd-patterns.md)
- [Atomic Design](./atomic-design.md)
- [Coding Practices](./coding-practices.md)

---

## Integration with Other Notes

- Read [[clean-architecture]] for clean architecture patterns
- Read [[solid-principles]] for SOLID design principles
- Read [[ddd-patterns]] for domain-driven design patterns
- Read [[modular-monolith]] for modular monolith patterns
- Read [[microservices]] for microservices patterns
- Read [[cqrs-pattern]] for CQRS patterns
- Read [[event-driven-architecture]] for event-driven patterns

---

## Decision Tree: Architecture Pattern Selection

```mermaid
graph TD
    A[Need to choose architecture?]\n    A --> B{Team size?}
    B -->|Small| C[Monolith]
    B -->|Large| D[Modular Monolith]
    B -->|Enterprise| E[Microservices]
    C --> F{Complex domain?}
    F -->|Yes| G[DDD]
    F -->|No| H[Layered]
    D --> I{Different read/write?}
    I -->|Yes| J[CQRS]
    I -->|No| K[Modular]
    E --> L{Real-time needed?}
    L -->|Yes| M[Event-Driven]
    L -->|No| N[REST API]
```

### When to Use Each Architecture Pattern

| Pattern | When to Use | Trade-off |
|---------|-------------|-----------|
| **Layered** | Simple apps | Easy to understand |
| **Modular Monolith** | Growing teams | Easier than microservices |
| **Microservices** | Large enterprises | High complexity |
| **CQRS** | Different read/write needs | Double data model |
| **Event-Driven** | Real-time, decoupled | Eventual consistency |
| **Hexagonal** | Testability | More boilerplate |

---

## Procedural Guidance: Architecture Setup

### Step 1: Choose Architecture Pattern

```
Is the team small (< 5 developers)?
  → Layered Architecture
Is the team growing (5-15 developers)?
  → Modular Monolith with DDD
Is the organization large (> 15 developers)?
  → Microservices with DDD
Do you have different read/write requirements?
  → CQRS
Do you need real-time updates?
  → Event-Driven Architecture
```

### Step 2: Set Up Layered Architecture

```typescript
// src/controllers/user.controller.ts — Presentation Layer
import { CreateUserRequest } from '@/dtos/create-user.dto'
import { UserService } from '@/services/user.service'

export class UserController {
  constructor(private userService: UserService) {}

  async createUser(req: CreateUserRequest) {
    return this.userService.create(req)
  }
}

// src/services/user.service.ts — Application Layer
import { UserEntity } from '@/entities/user.entity'
import { UserRepository } from '@/ports/user.repository.port'

export class UserService {
  constructor(private userRepository: UserRepository) {}

  async create(data: CreateUserRequest): Promise<UserEntity> {
    // Validate and transform
    const user = new UserEntity(data.name, data.email)
    return this.userRepository.save(user)
  }
}

// src/entities/user.entity.ts — Domain Layer
export class UserEntity {
  constructor(
    public readonly name: string,
    public readonly email: string,
  ) {}
}

// src/repositories/user.repository.ts — Infrastructure Layer
import { UserEntity } from '@/entities/user.entity'
import { UserRepository } from '@/ports/user.repository.port'

export class PrismaUserRepository implements UserRepository {
  async save(user: UserEntity): Promise<UserEntity> {
    return this.prisma.user.create({
      data: { name: user.name, email: user.email },
    })
  }
}
```

### Step 3: Set Up Dependency Injection

```typescript
// src/container.ts
import { UserController } from '@/controllers/user.controller'
import { UserService } from '@/services/user.service'
import { PrismaUserRepository } from '@/repositories/user.repository'

export function createContainer() {
  const userRepository = new PrismaUserRepository()
  const userService = new UserService(userRepository)
  const userController = new UserController(userService)
  
  return { userController, userService, userRepository }
}
```

### Step 4: Set Up Modular Monolith

```
src/
├── domains/
│   ├── user/
│   │   ├── user.entity.ts
│   │   ├── user.repository.ts
│   │   └── user.service.ts
│   ├── order/
│   │   ├── order.entity.ts
│   │   ├── order.repository.ts
│   │   └── order.service.ts
│   └── product/
│       ├── product.entity.ts
│       ├── product.repository.ts
│       └── product.service.ts
```

### Step 5: Set Up CQRS

```typescript
// Commands
export class CreateUserCommand {
  constructor(
    public readonly name: string,
    public readonly email: string,
  ) {}
}

// Queries
export class GetUserQuery {
  constructor(public readonly id: string) {}
}

// Handlers
class CreateUserCommandHandler {
  async execute(command: CreateUserCommand): Promise<void> {
    const user = new UserEntity(command.name, command.email)
    await this.userRepository.save(user)
  }
}

class GetUserQueryHandler {
  async execute(query: GetUserQuery): Promise<UserDto> {
    const user = await this.userRepository.findById(query.id)
    return new UserDto(user)
  }
}
```

---

## Copilot Instructions

### When to Read This Note
- Choosing architecture pattern
- Setting up layered architecture
- Implementing modular monolith
- Implementing CQRS
- Setting up dependency injection

### What to Do With This Information
1. **Choose pattern**: Select architecture based on team size and complexity
2. **Layered architecture**: Separate presentation, application, domain, infrastructure
3. **Modular monolith**: Organize by domain boundaries
4. **CQRS**: Separate commands and queries
5. **Dependency injection**: Wire dependencies in container

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `inversify` — for dependency injection
- **Terminal Command**: `pnpm tsc --noEmit` — type check
- **Terminal Command**: `pnpm test` — run tests

### Agents to Invoke
- **Architecture Validation Agent**: Run when choosing architecture
- **Code Review Agent**: Run when reviewing PRs with architecture changes

### Integration with Other Notes
- Read [[clean-architecture]] for clean architecture patterns
- Read [[solid-principles]] for SOLID design principles
- Read [[ddd-patterns]] for domain-driven design patterns
- Read [[modular-monolith]] for modular monolith patterns
- Read [[microservices]] for microservices patterns
- Read [[cqrs-pattern]] for CQRS patterns
- Read [[event-driven-architecture]] for event-driven patterns
- Read [[project-structure-mapping]] for project structure mapping

### Common Pitfalls
- Don't over-engineer (start simple, evolve)
- Don't mix layers (enforce inward-only dependencies)
- Don't skip dependency injection (use container)
- Don't implement CQRS without need (adds complexity)
- Don't ignore modularity (organize by domain)

### Quick Validation Checklist
- [ ] Is the architecture pattern appropriate for team size?
- [ ] Are layers properly separated?
- [ ] Are dependencies inward-only?
- [ ] Is dependency injection used?
- [ ] Are domains properly bounded?
- [ ] Is CQRS justified by requirements?
