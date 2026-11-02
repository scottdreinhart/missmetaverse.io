---
slug: clean-architecture
sources:
  - https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
  - https://blog.cleancoder.com/
date: 2026-11-02
tags:
  - clean-architecture
  - hexagonal-architecture
  - ports-adapters
  - onion-architecture
  - dependency-inversion
  - architecture
---

# Clean Architecture

## Overview

Clean Architecture (also known as Hexagonal Architecture, Ports and Adapters, Onion Architecture) is an architectural style that keeps business rules independent of frameworks, databases, UIs, and external services. The overriding rule is **The Dependency Rule**: source code dependencies can only point inwards.

---

## 1. The Dependency Rule

> Source code dependencies can only point inwards. Nothing in an inner circle can know anything at all about something in an outer circle.

```
┌─────────────────────────────────────────────────────────┐
│  Frameworks & Drivers (Outermost)                       │
│  • Databases, Web frameworks, UI, 3rd-party libs        │
│  • Details, not policies                                │
├─────────────────────────────────────────────────────────┤
│  Interface Adapters                                     │
│  • Controllers, Presenters, Gateways, Use Case Port     │
│  • Data conversion: outer ↔ inner                       │
├─────────────────────────────────────────────────────────┤
│  Use Cases (Application Business Rules)                 │
│  • Orchestrate flow of data to/from entities            │
│  • Application-specific business rules                  │
├─────────────────────────────────────────────────────────┤
│  Entities (Enterprise Business Rules) (Innermost)       │
│  • Most general, least likely to change                 │
│  • Encapsulate enterprise-wide business rules           │
└─────────────────────────────────────────────────────────┘
         ▲         ▲         ▲         ▲
         │         │         │         │
         └─────────┴─────────┴─────────┘
         Dependencies point INWARDS only
```

---

## 2. The Four Circles

### Circle 1: Entities (Innermost)

**Encapsulate enterprise-wide business rules.**

```typescript
// entities/user.entity.ts
export class User {
  private constructor(
    readonly id: UserId,
    private _name: Name,
    private _email: Email,
    private _status: UserStatus
  ) {}

  static create(params: CreateUserParams): User {
    // Validation at creation
    if (params.name.length < 2) {
      throw new Error('Name must be at least 2 characters')
    }
    return new User(
      generateId(),
      new Name(params.name),
      new Email(params.email),
      UserStatus.ACTIVE
    )
  }

  // Business behavior
  deactivate(): void {
    this._status = UserStatus.INACTIVE
  }

  rename(newName: string): void {
    this._name = new Name(newName)
  }

  // Getters only (no direct mutation)
  get id() { return this.id }
  get name() { return this._name.value }
  get email() { return this._email.value }
  get status() { return this._status }
}

// entities/order.entity.ts
export class Order {
  private constructor(
    readonly id: OrderId,
    private _items: OrderItem[],
    private _status: OrderStatus,
    private _total: Money
  ) {}

  static create(params: CreateOrderParams): Order {
    if (params.items.length === 0) {
      throw new Error('Order must have at least one item')
    }
    const total = params.items.reduce(
      (sum, item) => sum.add(item.price.multiply(item.quantity)),
      Money.zero(params.currency)
    )
    return new Order(generateId(), params.items, OrderStatus.PENDING, total)
  }

  addItem(item: OrderItem): void {
    this._items.push(item)
    this._total = this._total.add(item.price.multiply(item.quantity))
  }

  cancel(): void {
    if (this._status !== OrderStatus.PENDING) {
      throw new Error('Only pending orders can be cancelled')
    }
    this._status = OrderStatus.CANCELLED
  }

  get items() { return [...this._items] }
  get status() { return this._status }
  get total() { return this._total }
}
```

### Circle 2: Use Cases (Application Business Rules)

**Encapsulate application-specific business rules. Orchestrate flow of data to/from entities.**

```typescript
// usecases/create-user.usecase.ts
import { User } from '../entities/user.entity'
import { UserRepository } from '../ports/user-repository.port'
import { EmailService } from '../ports/email-service.port'

export class CreateUserUseCase {
  constructor(
    private userRepository: UserRepository,
    private emailService: EmailService
  ) {}

  async execute(params: CreateUserParams): Promise<User> {
    // 1. Validate input
    if (!params.name || !params.email) {
      throw new ValidationError('Name and email are required')
    }

    // 2. Check business rules
    const existing = await this.userRepository.findByEmail(params.email)
    if (existing) {
      throw new ConflictError('Email already registered')
    }

    // 3. Create entity
    const user = User.create(params)

    // 4. Persist
    await this.userRepository.save(user)

    // 5. Side effects (email notification)
    await this.emailService.sendWelcome(user.email)

    return user
  }
}

// usecases/place-order.usecase.ts
export class PlaceOrderUseCase {
  constructor(
    private orderRepository: OrderRepository,
    private inventoryService: InventoryPort,
    private paymentService: PaymentPort
  ) {}

  async execute(params: PlaceOrderParams): Promise<Order> {
    // 1. Validate items exist
    const items = await this.inventoryService.checkAvailability(params.items)

    // 2. Create order
    const order = Order.create({ items, currency: params.currency })

    // 3. Process payment
    const paymentResult = await this.paymentService.charge(order.total)

    // 4. Confirm order
    order.confirm()
    await this.orderRepository.save(order)

    return order
  }
}
```

### Circle 3: Interface Adapters

**Convert data from outer format to inner format. Controllers, Presenters, Gateways.**

```typescript
// adapters/controller/user-controller.ts
import { CreateUserUseCase } from '../../usecases/create-user.usecase'
import { HttpRequest, HttpResponse } from '../../ports/http.port'

export class UserController {
  constructor(private createUserUseCase: CreateUserUseCase) {}

  async handle(request: HttpRequest): Promise<HttpResponse> {
    try {
      const params = {
        name: request.body.name,
        email: request.body.email,
      }

      const user = await this.createUserUseCase.execute(params)

      return {
        status: 201,
        body: {
          id: user.id,
          name: user.name,
          email: user.email,
        },
      }
    } catch (error) {
      if (error instanceof ConflictError) {
        return { status: 409, body: { error: error.message } }
      }
      return { status: 400, body: { error: error.message } }
    }
  }
}

// adapters/gateway/database/user-repository.adapter.ts
import { UserRepository } from '../../../ports/user-repository.port'
import { User } from '../../../entities/user.entity'
import { DbClient } from './db-client.adapter'

export class UserRepositoryAdapter implements UserRepository {
  constructor(private db: DbClient) {}

  async save(user: User): Promise<void> {
    await this.db.collection('users').insertOne({
      id: user.id,
      name: user.name,
      email: user.email,
      status: user.status,
      createdAt: new Date(),
    })
  }

  async findById(id: string): Promise<User | null> {
    const doc = await this.db.collection('users').findOne({ id })
    if (!doc) return null
    return User.create({ name: doc.name, email: doc.email })
  }

  async findByEmail(email: string): Promise<User | null> {
    const doc = await this.db.collection('users').findOne({ email })
    if (!doc) return null
    return User.create({ name: doc.name, email: doc.email })
  }
}

// adapters/presenter/dashboard-presenter.ts
import { User } from '../../entities/user.entity'

export class DashboardPresenter {
  present(user: User): DashboardViewModel {
    return {
      greeting: `Welcome, ${user.name}!`,
      status: user.status,
      email: user.email,
    }
  }
}
```

### Circle 4: Frameworks & Drivers (Outermost)

**Details: databases, web frameworks, UI, external services.**

```typescript
// frameworks/web/express-server.ts
import express from 'express'
import { UserController } from '../../adapters/controller/user-controller'
import { CreateUserUseCase } from '../../usecases/create-user.usecase'
import { UserRepositoryAdapter } from '../../adapters/gateway/database/user-repository.adapter'
import { DbClient } from '../../adapters/gateway/database/db-client.adapter'
import { EmailServiceAdapter } from '../../adapters/gateway/email/email.adapter'

const app = express()
app.use(express.json())

// Wire dependencies (Dependency Injection)
const db = new DbClient()
const userRepository = new UserRepositoryAdapter(db)
const emailService = new EmailServiceAdapter()
const createUserUseCase = new CreateUserUseCase(userRepository, emailService)
const userController = new UserController(createUserUseCase)

app.post('/api/users', (req, res) => {
  userController.handle({ body: req.body })
    .then(response => res.status(response.status).json(response.body))
})

app.listen(3000)
```

---

## 3. Crossing Boundaries

### How Control Flow vs Dependency Direction Work

```
┌──────────────────────────────────────────────────────┐
│  Flow of Control:                                    │
│  Controller → Use Case → Presenter                   │
│                                                      │
│  Source Code Dependencies (point INWARDS):           │
│  Controller depends on Use Case interface            │
│  Use Case depends on Entity interface                │
│  Use Case depends on Port interface                  │
│                                                      │
│  Result: Inner circles NEVER know about outer circles│
└──────────────────────────────────────────────────────┘
```

### Using Dependency Inversion

```typescript
// Use case defines the port (inner circle)
export interface EmailPort {
  send(to: string, subject: string, body: string): Promise<void>
}

// Use case depends on the port
class CreateUserUseCase {
  constructor(private emailPort: EmailPort) {}
  async execute(params: CreateUserParams) {
    await this.emailPort.send(params.email, 'Welcome', '...')
  }
}

// Outer circle implements the port
class EmailServiceAdapter implements EmailPort {
  async send(to: string, subject: string, body: string) {
    // Uses SendGrid, AWS SES, etc. (outer circle detail)
  }
}
```

---

## 4. What Data Crosses Boundaries

**Always use simple data structures. Never pass Entities or Database rows inward.**

```typescript
// ✅ GOOD: Simple DTO
interface CreateUserDto {
  name: string
  email: string
}

// ✅ GOOD: Simple result
interface UserResponse {
  id: string
  name: string
  email: string
}

// ❌ BAD: Passing Entity inward
async function updateUser(user: User) { /* ... */ }

// ❌ BAD: Passing DB row inward
async function processRow(doc: DbDocument) { /* ... */ }
```

---

## 5. Benefits

| Benefit | Description |
|---------|-------------|
| **Independent of Frameworks** | Frameworks are tools, not constraints |
| **Testable** | Business rules testable without UI, DB, web |
| **Independent of UI** | Replace web UI with console UI easily |
| **Independent of Database** | Swap SQL for NoSQL without changing rules |
| **Independent of External Agencies** | Business rules don't know about the outside world |

---

## 6. Architecture Comparison

| Architecture | Core Idea | Best For |
|-------------|-----------|----------|
| **Clean Architecture** | Dependency rule, 4 circles | General purpose, testability |
| **Hexagonal (Ports/Adapters)** | Ports define interfaces, adapters implement | API-driven apps |
| **Onion Architecture** | Concentric layers, dependencies inward | Similar to Clean |
| **DDD** | Domain model centered | Complex business logic |
| **Vertical Slice** | Organize by feature/use case | Small teams, fast delivery |

> Clean, Hexagonal, Onion, DDD, and vertical slices can coexist. Microservices and CQRS introduce costs and should follow concrete requirements.

---

## Cross-References

- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./ddd-patterns.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Atomic Design](./atomic-design.md)
- [Coding Practices](./coding-practices.md)
