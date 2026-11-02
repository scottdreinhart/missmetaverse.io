---
slug: ddd-patterns
sources:
  - https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddc-caching/domain-driven-design-elements
  - https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddc-caching/implementing-value-objects
  - https://www.enterpriseintegrationpatterns.com/
date: 2026-11-02
tags:
  - ddd
  - domain-driven-design
  - entities
  - value-objects
  - aggregates
  - domain-events
  - repositories
  - ubiquitous-language
---

# DDD Patterns

## Overview

Domain-Driven Design (DDD) models software around business concepts, rules, language, and boundaries. It provides patterns for modeling complex domains effectively.

---

## 1. Core Modeling Concepts

### Ubiquitous Language

Use **consistent business terminology** in conversations, code, tests, and documentation.

```typescript
// ❌ Technical language
class UserAccount {
  createNewAccount(username: string, pwd: string) { /* ... */ }
}

// ✅ Ubiquitous language (matches business vocabulary)
class Customer {
  register(name: CustomerName, email: Email): CustomerAccount { /* ... */ }
}
```

### Bounded Context

Define **where a particular domain model and vocabulary apply**.

```typescript
// Context: Sales
class Customer {
  name: CustomerName
  email: Email
  shippingAddress: Address
}

// Context: Accounting (different model, same real-world entity)
class Customer {
  taxId: TaxId
  creditLimit: Money
  paymentTerms: PaymentTerms
}
```

### Context Map

Describe **relationships and integration boundaries** between bounded contexts.

| Relationship | Description |
|-------------|-------------|
| **Partnership** | Two teams collaborate closely |
| **Conformist** | Subordinate context adopts upstream model |
| **Shared Kernel** | Two contexts share a subset of the model |
| **Anticorruption Layer** | Translates external models to protect internal domain |
| **Open Host Service** | Publishes a formal interface for other contexts |
| **Published Language** | Documented format for message exchange |

---

## 2. Domain Model Patterns

### Entity

**Model something whose identity persists as its attributes change.**

```typescript
// Entity: Identity matters, attributes can change
export class Order {
  private constructor(
    readonly id: OrderId,           // Identity
    private _items: OrderItem[],    // Can change
    private _status: OrderStatus,   // Can change
    private _total: Money           // Can change
  ) {}

  static create(params: CreateOrderParams): Order {
    if (params.items.length === 0) {
      throw new Error('Order must have items')
    }
    return new Order(
      generateId(),
      params.items,
      OrderStatus.PENDING,
      calculateTotal(params.items)
    )
  }

  addItem(item: OrderItem): void {
    this._items.push(item)
    this._total = this._total.add(item.price.multiply(item.quantity))
  }

  cancel(): void {
    this._status = OrderStatus.CANCELLED
  }

  get items() { return [...this._items] }
  get status() { return this._status }
  get total() { return this._total }
}
```

### Value Object

**Model a value through its attributes, typically immutable.**

```typescript
// Value Object: Identity is its attributes, immutable
export class Money {
  constructor(
    readonly amount: number,
    readonly currency: CurrencyCode
  ) {}

  static zero(currency: CurrencyCode): Money {
    return new Money(0, currency)
  }

  add(other: Money): Money {
    if (this.currency !== other.currency) {
      throw new Error('Cannot add different currencies')
    }
    return new Money(this.amount + other.amount, this.currency)
  }

  multiply(multiplier: number): Money {
    return new Money(this.amount * multiplier, this.currency)
  }

  equals(other: Money): boolean {
    return this.amount === other.amount && this.currency === other.currency
  }

  // Value objects are compared by value, not reference
  toJSON() {
    return { amount: this.amount, currency: this.currency }
  }
}

// Value Object: Immutable, defined by attributes
export class Email {
  private constructor(private readonly value: string) {}

  static create(email: string): Email {
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      throw new InvalidEmailError(email)
    }
    return new Email(email.toLowerCase())
  }

  get value() { return this.value }

  equals(other: Email): boolean {
    return this.value === other.value
  }
}

// Value Object: Immutable, defined by attributes
export class CustomerName {
  private constructor(private readonly value: string) {}

  static create(name: string): CustomerName {
    if (name.length < 2 || name.length > 100) {
      throw new InvalidNameError(name)
    }
    return new CustomerName(name.trim())
  }

  get value() { return this.value }
}
```

### Aggregate / Aggregate Root

**Define a consistency boundary and the controlled entry point for changes within it.**

```typescript
// Aggregate Root: Order controls all changes to its contents
export class Order {
  private constructor(
    readonly id: OrderId,
    private _items: OrderItem[],
    private _status: OrderStatus,
    private _total: Money,
    private _events: DomainEvent[] = []  // Events from aggregate
  ) {}

  static create(params: CreateOrderParams): Order {
    const order = new Order(
      generateId(),
      params.items,
      OrderStatus.PENDING,
      calculateTotal(params.items)
    )
    order._events.push(new OrderCreatedEvent(order.id, params.items))
    return order
  }

  // Only aggregate root exposes behavior
  addItem(item: OrderItem): void {
    if (this._status !== OrderStatus.PENDING) {
      throw new Error('Cannot add items to non-pending order')
    }
    this._items.push(item)
    this._total = this._total.add(item.price.multiply(item.quantity))
    this._events.push(new ItemAddedEvent(this.id, item))
  }

  removeItem(itemId: ItemId): void {
    const index = this._items.findIndex(i => i.id === itemId)
    if (index === -1) throw new Error('Item not found')
    const item = this._items.splice(index, 1)[0]
    this._total = this._total.subtract(item.price.multiply(item.quantity))
    this._events.push(new ItemRemovedEvent(this.id, itemId))
  }

  confirm(): void {
    if (this._status !== OrderStatus.PENDING) {
      throw new Error('Only pending orders can be confirmed')
    }
    this._status = OrderStatus.CONFIRMED
    this._events.push(new OrderConfirmedEvent(this.id))
  }

  cancel(): void {
    if (this._status !== OrderStatus.PENDING) {
      throw new Error('Only pending orders can be cancelled')
    }
    this._status = OrderStatus.CANCELLED
    this._events.push(new OrderCancelledEvent(this.id))
  }

  // Access to internal items is controlled
  get items() { return [...this._items] }
  get status() { return this._status }
  get total() { return this._total }
  get events() { return [...this._events] }

  // Clear events after processing
  clearEvents() { this._events = [] }
}
```

### Domain Invariant

**Express a business rule that valid domain state must satisfy.**

```typescript
export class Order {
  // Invariant: Total must match sum of items
  private validateInvariant(): void {
    const calculatedTotal = this._items.reduce(
      (sum, item) => sum.add(item.price.multiply(item.quantity)),
      Money.zero(this._items[0]?.price.currency)
    )
    if (calculatedTotal.amount !== this._total.amount) {
      throw new InvariantViolation('Total does not match items')
    }
  }

  // Invariant: Cannot modify confirmed order
  private assertPending(): void {
    if (this._status !== OrderStatus.PENDING) {
      throw new InvariantViolation('Order must be pending')
    }
  }

  addItem(item: OrderItem): void {
    this.assertPending()
    this._items.push(item)
    this._total = this._total.add(item.price.multiply(item.quantity))
    this.validateInvariant()  // Check invariant after mutation
  }
}
```

### Domain Service

**Represent domain behavior that does not naturally belong to one entity or value object.**

```typescript
// Behavior that involves multiple entities
export class PaymentProcessingService {
  constructor(
    private paymentGateway: PaymentGateway,
    private orderRepository: OrderRepository,
    private inventoryService: InventoryService
  ) {}

  async processPayment(order: Order): Promise<PaymentResult> {
    // 1. Check inventory
    const available = await this.inventoryService.check(order.items)
    if (!available) {
      throw new InsufficientInventoryError()
    }

    // 2. Charge payment
    const result = await this.paymentGateway.charge(order.total)

    if (result.success) {
      // 3. Reserve inventory
      await this.inventoryService.reserve(order.items)
      // 4. Confirm order
      order.confirm()
      await this.orderRepository.save(order)
    }

    return result
  }
}
```

### Application Service / Use Case

**Coordinate a business operation and its dependencies.**

```typescript
export class PlaceOrderUseCase {
  constructor(
    private orderRepository: OrderRepository,
    private paymentService: PaymentProcessingService,
    private notificationService: NotificationPort
  ) {}

  async execute(params: PlaceOrderParams): Promise<Order> {
    // 1. Create order (domain logic)
    const order = Order.create({
      items: params.items,
      currency: params.currency,
    })

    // 2. Process payment (domain service)
    await this.paymentService.processPayment(order)

    // 3. Persist
    await this.orderRepository.save(order)

    // 4. Notify (side effect)
    await this.notificationService.sendOrderConfirmation(order)

    return order
  }
}
```

### Repository

**Provide a domain-oriented abstraction for retrieving and persisting aggregates.**

```typescript
// Repository interface (defined in domain layer)
export interface OrderRepository {
  findById(id: OrderId): Promise<Order | null>
  findByCustomer(customerId: CustomerId): Promise<Order[]>
  save(order: Order): Promise<void>
  remove(order: Order): Promise<void>
}

// Repository implementation (infrastructure layer)
export class OrderRepositorySql implements OrderRepository {
  constructor(private db: DatabaseClient) {}

  async findById(id: OrderId): Promise<Order | null> {
    const row = await this.db.query('SELECT * FROM orders WHERE id = $1', [id])
    if (!row) return null

    const items = await this.db.query(
      'SELECT * FROM order_items WHERE order_id = $1', [id]
    )

    return Order.create({
      items: items.map(item => ({
        id: item.item_id,
        name: item.name,
        price: new Money(item.price, item.currency),
        quantity: item.quantity,
      })),
      currency: row.currency,
    })
  }

  async save(order: Order): Promise<void> {
    await this.db.transaction(async (tx) => {
      await tx.query(
        'INSERT INTO orders (id, status, total, currency) VALUES ($1, $2, $3, $4)',
        [order.id, order.status, order.total.amount, order.total.currency]
      )
      for (const item of order.items) {
        await tx.query(
          'INSERT INTO order_items (order_id, item_id, name, price, currency, quantity) VALUES ($1, $2, $3, $4, $5, $6)',
          [order.id, item.id, item.name, item.price.amount, item.price.currency, item.quantity]
        )
      }
    })
  }
}
```

### Domain Event

**Record a meaningful business occurrence.**

```typescript
// Domain Event
export class DomainEvent {
  constructor(
    readonly aggregateId: string,
    readonly timestamp: Date = new Date()
  ) {}
}

export class OrderCreatedEvent extends DomainEvent {
  constructor(
    aggregateId: string,
    readonly items: OrderItem[]
  ) {
    super(aggregateId)
  }
}

export class OrderConfirmedEvent extends DomainEvent {
  constructor(aggregateId: string) {
    super(aggregateId)
  }
}

export class OrderCancelledEvent extends DomainEvent {
  constructor(
    aggregateId: string,
    readonly reason?: string
  ) {
    super(aggregateId)
  }
}

// Aggregate collects events
export class Order {
  private _events: DomainEvent[] = []

  confirm(): void {
    this._status = OrderStatus.CONFIRMED
    this._events.push(new OrderConfirmedEvent(this.id))
  }

  get events() { return [...this._events] }
  clearEvents() { this._events = [] }
}

// Event handler (infrastructure/application layer)
class OrderConfirmedHandler {
  async handle(event: OrderConfirmedEvent): Promise<void> {
    await this.inventoryService.reserve(event.aggregateId)
    await this.emailService.sendConfirmation(event.aggregateId)
    await this.auditLog.log(event)
  }
}
```

### Factory

**Centralize creation when constructing a valid domain object requires meaningful rules.**

```typescript
export class OrderFactory {
  static createForCustomer(
    customerId: CustomerId,
    items: OrderItem[],
    customer: Customer
  ): Order {
    // Apply customer-specific rules
    if (customer.isVip) {
      items.forEach(item => {
        item.price = item.price.multiply(0.95)  // 5% VIP discount
      })
    }

    if (items.length > 10 && !customer.hasBulkOrderPermission) {
      throw new BulkOrderPermissionError()
    }

    return Order.create({ items, currency: customer.preferredCurrency })
  }
}
```

### Specification

**Encapsulate a composable business predicate.**

```typescript
export interface Specification<T> {
  isSatisfiedBy(item: T): boolean
}

class MinimumOrderAmountSpecification implements Specification<Order> {
  constructor(private minimum: Money) {}

  isSatisfiedBy(order: Order): boolean {
    return order.total.amount >= this.minimum.amount
  }
}

class ValidShippingAddressSpecification implements Specification<Order> {
  isSatisfiedBy(order: Order): boolean {
    return order.shippingAddress !== null
  }
}

// Compose specifications
class OrderEligibilitySpecification {
  constructor(
    private specs: Specification<Order>[]
  ) {}

  isEligible(order: Order): boolean {
    return this.specs.every(spec => spec.isSatisfiedBy(order))
  }
}
```

### Anti-Corruption Layer

**Translate external models so they do not distort the internal domain.**

```typescript
// External system model (we don't want this in our domain)
interface ExternalInventoryApi {
  getStockLevel(productId: string): Promise<{ qty: number; warehouse: string }>
  reserveStock(productId: string, qty: number): Promise<{ success: boolean; ref: string }>
}

// ACL: Translates external model to our domain model
export class InventoryAntiCorruptionLayer implements InventoryPort {
  constructor(private externalApi: ExternalInventoryApi) {}

  async checkAvailability(items: OrderItem[]): Promise<boolean> {
    for (const item of items) {
      const stock = await this.externalApi.getStockLevel(item.id)
      if (stock.qty < item.quantity) {
        return false
      }
    }
    return true
  }

  async reserve(items: OrderItem[]): Promise<boolean> {
    const results = await Promise.all(
      items.map(item => this.externalApi.reserveStock(item.id, item.quantity))
    )
    return results.every(r => r.success)
  }
}
```

---

## 3. DDD Tactical Patterns Summary

| Pattern | Purpose | Example |
|---------|---------|---------|
| **Entity** | Identity-based model | `Order`, `User` |
| **Value Object** | Attribute-based, immutable | `Money`, `Email`, `Address` |
| **Aggregate Root** | Consistency boundary | `Order` controls `OrderItem` |
| **Domain Service** | Cross-entity behavior | `PaymentProcessingService` |
| **Repository** | Persistence abstraction | `OrderRepository` |
| **Domain Event** | Business occurrence | `OrderCreatedEvent` |
| **Factory** | Complex creation | `OrderFactory` |
| **Specification** | Composable predicate | `MinimumOrderSpecification` |
| **ACL** | Protect domain from external | `InventoryAntiCorruptionLayer` |

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [Architecture Patterns](./architecture-patterns.md)
- [DDD Patterns](./ddd-patterns.md)
- [Coding Practices](./coding-practices.md)

---

## Copilot Instructions

### When to Read This Note
- Designing a new domain model
- Creating entities, value objects, or aggregates
- Implementing business rules that span multiple entities
- Adding persistence for domain objects
- Handling external system integration

### What to Do With This Information
1. **Entities**: Create classes with identity, encapsulate business behavior, protect invariants
2. **Value Objects**: Create immutable classes with attribute equality, no identity
3. **Aggregates**: Use the aggregate root as the only entry point, enforce invariants within the boundary
4. **Domain Services**: Extract behavior that doesn't naturally belong to one entity
5. **Repositories**: Define interfaces in the domain layer, implement in infrastructure
6. **Domain Events**: Record meaningful business occurrences, process asynchronously
7. **Factories**: Centralize creation logic when object construction has business rules
8. **Specifications**: Encapsulate composable business predicates
9. **Anti-Corruption Layer**: Translate external models to protect the internal domain

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for type inference when creating value objects
- **VS Code Extension**: Error Lens — for inline invariant validation errors
- **npm Package**: `class-transformer` — for value object immutability patterns
- **Terminal Command**: `pnpm tsc --noEmit` — verify type safety after adding domain models
- **Terminal Command**: `pnpm test` — verify domain invariants are enforced

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing new aggregates to verify boundary correctness
- **Code Review Agent**: Run when reviewing domain model changes

### Integration with Other Notes
- Read [[clean-architecture]] for layer placement of DDD patterns
- Read [[solid-principles]] for applying SOLID within domain models
- Read [[event-driven-architecture]] for processing domain events
- Read [[repository-pattern]] for repository implementation details
- Read [[domain-event]] for domain event patterns
- Read [[bounded-context]] for defining aggregate boundaries

### Common Pitfalls
- Don't put database queries in entities (use repositories)
- Don't create value objects for simple types (use TypeScript types or primitives)
- Don't let aggregates communicate directly (use domain events)
- Don't make the aggregate root too large (split into separate aggregates)
- Don't expose internal state — use getters that return copies
- Don't put infrastructure concerns in domain events (no database calls in event handlers within the domain)
- Don't use factories for simple object creation (only when there are business rules)

### Quick Validation Checklist
- [ ] Does each entity have a unique identity?
- [ ] Are value objects immutable with attribute equality?
- [ ] Is the aggregate root the only entry point to its children?
- [ ] Are domain invariants enforced on every mutation?
- [ ] Do domain events record meaningful business occurrences?
- [ ] Are repositories defined as interfaces in the domain layer?
- [ ] Does the anti-corruption layer translate external models?
