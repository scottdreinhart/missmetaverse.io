---
slug: core-principles
sources:
  - https://docs.microsoft.com/en-us/dotnet/architecture/microservices/
  - https://www.enterpriseintegrationpatterns.com/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - type/concept
  - domain/frontend
  - domain/accessibility
  - domain/database
  - status/complete
  - type/reference
  - domain/architecture
  - dry
  - kiss
  - yagni
  - separation-of-concerns
  - high-cohesion
  - low-coupling
  - information-hiding
  - encapsulation
  - composition-over-inheritance
  - law-of-demeter
  - tell-dont-ask
  - cqs
  - design-by-contract
  - principle-of-least-astonishment
  - explicit-over-implicit
  - fail-fast
---

# Core Principles

## Overview

Core principles are the foundational rules that guide software design and implementation. They are universal and apply across all levels of the system.

---

## 1. Fundamental Principles

### DRY (Don't Repeat Yourself)

**Eliminate duplication by abstracting common behavior.**

```typescript
// ❌ Duplicated validation logic
function createUser(data: CreateUserDto): User {
  if (!data.name || data.name.length < 2) throw new Error('Invalid name')
  if (!data.email || !data.email.includes('@')) throw new Error('Invalid email')
  // ... create user
}

function updateUser(id: string, data: UpdateUserDto): User {
  if (!data.name || data.name.length < 2) throw new Error('Invalid name')
  if (!data.email || !data.email.includes('@')) throw new Error('Invalid email')
  // ... update user
}

// ✅ DRY — single source of truth
function validateUser(data: CreateUserDto | UpdateUserDto): void {
  if (!data.name || data.name.length < 2) throw new Error('Invalid name')
  if (!data.email || !data.email.includes('@')) throw new Error('Invalid email')
}

function createUser(data: CreateUserDto): User {
  validateUser(data)
  // ... create user
}

function updateUser(id: string, data: UpdateUserDto): User {
  validateUser(data)
  // ... update user
}
```

### KISS (Keep It Simple, Stupid)

**Prefer simple solutions over complex ones.**

```typescript
// ❌ Overly complex
function processOrder(order: Order): Promise<void> {
  return this.complexStateMachine
    .transition(order.status, 'processing')
    .then(() => this.complexStateMachine.transition('processing', 'completed'))
    .then(() => this.complexStateMachine.validate())
    .then(() => this.complexStateMachine.persist())
}

// ✅ Simple and clear
function processOrder(order: Order): Promise<void> {
  if (order.status !== 'pending') {
    throw new Error('Only pending orders can be processed')
  }
  order.status = 'completed'
  await this.orderRepository.save(order)
}
```

### YAGNI (You Aren't Going to Need It)

**Don't add functionality until it's needed.**

```typescript
// ❌ YAGNI — building for hypothetical future needs
class UserService {
  // Not needed yet
  async exportToCSV(): Promise<string> { /* ... */ }
  async exportToExcel(): Promise<Buffer> { /* ... */ }
  async exportToPDF(): Promise<Buffer> { /* ... */ }
  async syncWithCRM(): Promise<void> { /* ... */ }
  async syncWithERP(): Promise<void> { /* ... */ }

  // Actually needed
  async create(data: CreateUserDto): Promise<User> { /* ... */ }
  async findById(id: string): Promise<User | null> { /* ... */ }
}

// ✅ YAGNI — only what's needed now
class UserService {
  async create(data: CreateUserDto): Promise<User> { /* ... */ }
  async findById(id: string): Promise<User | null> { /* ... */ }

  // TODO: Add export when business requires it
  // TODO: Add sync when integration is needed
}
```

### Separation of Concerns

**Divide the system into distinct sections, each addressing a separate concern.**

```
┌─────────────────────────────────────────────────────────┐
│  Presentation Layer  — UI, user interaction             │
├─────────────────────────────────────────────────────────┤
│  Application Layer   — Use cases, orchestration         │
├─────────────────────────────────────────────────────────┤
│  Domain Layer        — Business rules, entities         │
├─────────────────────────────────────────────────────────┤
│  Infrastructure Layer — Database, external services     │
└─────────────────────────────────────────────────────────┘
```

### High Cohesion

**Elements within a module should be closely related and focused.**

```typescript
// ❌ Low cohesion — unrelated responsibilities
class UserService {
  createUser() { /* ... */ }
  sendEmail() { /* ... */ }
  generatePDF() { /* ... */ }
  calculateTax() { /* ... */ }
  resizeImage() { /* ... */ }
}

// ✅ High cohesion — focused modules
class UserService {
  createUser() { /* ... */ }
  updateUser() { /* ... */ }
  deleteUser() { /* ... */ }
}

class EmailService {
  sendWelcomeEmail() { /* ... */ }
  sendPasswordReset() { /* ... */ }
}

class DocumentService {
  generatePDF() { /* ... */ }
  generateInvoice() { /* ... */ }
}

class TaxService {
  calculateTax() { /* ... */ }
  applyDiscount() { /* ... */ }
}
```

### Low Coupling

**Minimize dependencies between modules.**

```typescript
// ❌ High coupling — direct dependency on concrete class
class OrderService {
  private emailService = new EmailService()  // Hard dependency

  async confirmOrder(order: Order): Promise<void> {
    this.emailService.send(order.customerEmail, 'Order confirmed')
  }
}

// ✅ Low coupling — dependency on abstraction
class OrderService {
  constructor(private emailPort: EmailPort) {}  // Abstraction

  async confirmOrder(order: Order): Promise<void> {
    this.emailPort.send(order.customerEmail, 'Order confirmed')
  }
}
```

---

## 2. Object-Oriented Principles

### Information Hiding

**Hide internal implementation details and expose only what's necessary.**

```typescript
class BankAccount {
  // Private — hidden from external access
  private balance: number = 0
  private transactions: Transaction[] = []

  // Public — controlled interface
  deposit(amount: number): void {
    if (amount <= 0) throw new Error('Amount must be positive')
    this.balance += amount
    this.transactions.push({ type: 'deposit', amount })
  }

  withdraw(amount: number): void {
    if (amount <= 0) throw new Error('Amount must be positive')
    if (amount > this.balance) throw new Error('Insufficient funds')
    this.balance -= amount
    this.transactions.push({ type: 'withdrawal', amount })
  }

  getBalance(): number {
    return this.balance  // Read-only access
  }
}

// External code cannot directly modify balance
const account = new BankAccount()
account.deposit(100)
// account.balance = 999999  // ❌ Compile error — private
```

### Encapsulation

**Bundle data and behavior together, controlling access.**

```typescript
class Order {
  // Private state
  private items: OrderItem[] = []
  private status: OrderStatus = 'pending'

  // Controlled access through methods
  addItem(item: OrderItem): void {
    if (this.status !== 'pending') {
      throw new Error('Cannot add items to non-pending order')
    }
    this.items.push(item)
  }

  removeItem(itemId: string): void {
    this.items = this.items.filter(i => i.id !== itemId)
  }

  // Read-only access
  get items(): readonly OrderItem[] {
    return [...this.items]  // Return copy
  }

  get status(): OrderStatus {
    return this.status
  }
}
```

### Composition over Inheritance

**Prefer composing objects over inheriting from base classes.**

```typescript
// ❌ Inheritance — fragile base class problem
class Employee {
  calculateSalary(): number {
    return 5000
  }
}

class Manager extends Employee {
  calculateSalary(): number {
    return 8000
  }
}

class Developer extends Employee {
  calculateSalary(): number {
    return 6000
  }
}

// Problem: Adding new types requires modifying base class
// class Contractor extends Employee { /* ... */ }

// ✅ Composition — flexible and extensible
interface SalaryCalculator {
  calculate(): number
}

class BaseSalaryCalculator implements SalaryCalculator {
  calculate(): number { return 5000 }
}

class BonusSalaryCalculator implements SalaryCalculator {
  constructor(private base: SalaryCalculator, private bonus: number) {}
  calculate(): number { return this.base.calculate() + this.bonus }
}

class Employee {
  constructor(private calculator: SalaryCalculator) {}

  getSalary(): number {
    return this.calculator.calculate()
  }
}

// Compose as needed
const employee = new Employee(new BaseSalaryCalculator())
const manager = new Employee(new BonusSalaryCalculator(new BaseSalaryCalculator(), 3000))
```

### Law of Demeter (Principle of Least Knowledge)

**Only talk to your immediate friends — don't call methods on returned objects.**

```typescript
// ❌ Violation — chaining multiple calls
const city = order.getCustomer().getAddress().getCity()

// ✅ Respect — each object knows only its immediate dependencies
class Order {
  getCustomerCity(): string {
    return this.customer.getAddress().getCity()  // Still a violation
  }
}

// Better — expose only what's needed
class Order {
  getCity(): string {
    return this.customer.getCity()  // Customer exposes city directly
  }
}
```

### Tell, Don't Ask

**Tell objects what to do, don't ask for their data and decide.**

```typescript
// ❌ Ask — client makes the decision
function processOrder(order: Order): void {
  if (order.getStatus() === 'pending') {
    order.setStatus('confirmed')
    order.getCustomer().sendEmail('Order confirmed')
  }
}

// ✅ Tell — delegate to the object
function processOrder(order: Order): void {
  order.confirm()  // Order knows how to confirm itself
}

class Order {
  confirm(): void {
    if (this.status !== 'pending') {
      throw new Error('Cannot confirm non-pending order')
    }
    this.status = 'confirmed'
    this.customer.sendEmail('Order confirmed')
  }
}
```

### CQS (Command-Query Separation)

**Methods should either do something (command) or return something (query), not both.**

```typescript
// ❌ Violation — both modifies state and returns value
class UserService {
  findOrCreate(name: string): User {
    const existing = this.findByName(name)
    if (existing) return existing
    const user = this.create({ name })
    return user  // Modifies state + returns value
  }
}

// ✅ CQS — separate command and query
class UserService {
  // Query — returns value, no side effects
  findByName(name: string): User | null {
    return this.repository.findOne({ name })
  }

  // Command — modifies state, returns void
  create(params: CreateUserParams): void {
    const user = new User(params.name)
    this.repository.save(user)
  }

  // Use both separately
  findOrCreate(name: string): User {
    const existing = this.findByName(name)
    if (existing) return existing
    this.create({ name })
    return this.findByName(name)!
  }
}
```

### Design by Contract

**Define explicit preconditions, postconditions, and invariants.**

```typescript
class BankAccount {
  // Precondition: amount must be positive
  deposit(amount: number): void {
    if (amount <= 0) {
      throw new Error('Precondition: amount must be positive')
    }
    this.balance += amount

    // Postcondition: balance must have increased
    if (this.balance <= 0) {
      throw new Error('Postcondition: balance must be positive')
    }
  }

  // Invariant: balance must never be negative
  private validateInvariant(): void {
    if (this.balance < 0) {
      throw new Error('Invariant: balance must not be negative')
    }
  }
}
```

### Principle of Least Astonishment

**Code should behave in ways that surprise users the least.**

```typescript
// ❌ Astonishing — unexpected behavior
function divide(a: number, b: number): number {
  if (b === 0) return 0  // Returns 0 instead of throwing — surprising!
  return a / b
}

// ✅ Expected — throws on invalid input
function divide(a: number, b: number): number {
  if (b === 0) {
    throw new Error('Division by zero')  // Throws — expected behavior
  }
  return a / b
}

// ❌ Astonishing — silent failure
function findUser(id: string): User {
  return this.users.find(u => u.id === id) ?? {}  // Returns empty object
}

// ✅ Expected — clear failure
function findUser(id: string): User | null {
  return this.users.find(u => u.id === id) ?? null  // Returns null
}
```

---

## 3. Design Philosophy

### Explicit over Implicit

**Prefer explicit code over implicit behavior.**

```typescript
// ❌ Implicit — hidden dependencies
function processOrder(): void {
  const user = currentUser  // Where does this come from?
  const items = cartItems  // Where does this come from?
  // ...
}

// ✅ Explicit — clear dependencies
function processOrder(user: User, items: OrderItem[]): void {
  // Dependencies are clear from the signature
  // ...
}

// ❌ Implicit — magic strings
const status = data['s']  // What does 's' mean?

// ✅ Explicit — named constants
const status = data['status']  // Clear intent
```

### Fail Fast

**Detect and report errors as early as possible.**

```typescript
// ❌ Late failure — error occurs deep in the call stack
function processOrder(order: Order): void {
  this.validate(order)  // Validation happens late
  this.save(order)
  this.notify(order)
}

// ✅ Fail fast — validate immediately
function processOrder(order: Order): void {
  if (!order.items.length) {
    throw new Error('Order must have items')  // Fail immediately
  }
  if (!order.customerId) {
    throw new Error('Order must have a customer')  // Fail immediately
  }
  // ... rest of processing
}
```

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


