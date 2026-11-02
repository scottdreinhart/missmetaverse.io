---
slug: solid-principles
sources:
  - https://en.wikipedia.org/wiki/SOLID
  - https://blog.cleancoder.com/uncle-bob/2014/05/08/SingleReponsibilityPrinciple.html
  - https://blog.cleancoder.com/uncle-bob/2014/05/12/TheOpenClosedPrinciple.html
  - https://blog.cleancoder.com/uncle-bob/2020/10/18/Solid-Relevance.html
date: 2026-11-02
tags:
  - solid
  - principles
  - design
  - oop
  - typescript
---

# SOLID Principles

## Overview

SOLID is a mnemonic acronym for five principles that make source code more understandable, flexible, and maintainable. Introduced by Robert C. Martin in 2000, the acronym was coined by Michael Feathers around 2004.

---

## 1. Single Responsibility Principle (SRP)

### Definition

A module has **one cohesive responsibility** and **one primary reason to change**.

### Key Insight

Responsibility = reason to change. If you can think of more than one reason to change a module, it has more than one responsibility.

### TypeScript Example

```typescript
// ❌ VIOLATION: Multiple reasons to change
class UserService {
  createUser(name: string, email: string) { /* ... */ }
  sendWelcomeEmail(user: User) { /* ... */ }  // Changes when email format changes
  hashPassword(password: string) { /* ... */ }  // Changes when hashing algorithm changes
  validateEmail(email: string) { /* ... */ }    // Changes when validation rules change
}

// ✅ SRP: Each class has one reason to change
class UserService {
  constructor(
    private emailService: EmailService,
    private passwordService: PasswordService,
    private validator: EmailValidator
  ) {}

  async createUser(name: string, email: string): Promise<User> {
    this.validator.validate(email)
    const hashed = await this.passwordService.hash(email)
    // ... create user
    await this.emailService.sendWelcome(user)
  }
}

class EmailService {
  sendWelcome(user: User) { /* ... */ }  // Only changes when email changes
}

class PasswordService {
  hash(password: string) { /* ... */ }   // Only changes when hashing changes
}

class EmailValidator {
  validate(email: string) { /* ... */ }  // Only changes when validation changes
}
```

### Checklist

- [ ] Can I describe the purpose of this module in one sentence?
- [ ] Will changes to X affect this module?
- [ ] Are there multiple abstractions mixed together?

---

## 2. Open/Closed Principle (OCP)

### Definition

Software entities should be **open for extension** but **closed for modification**.

### Key Insight

Add new behavior through stable extension points (interfaces, abstract classes, composition) rather than modifying existing code.

### TypeScript Example

```typescript
// ❌ VIOLATION: Modifying existing code for new types
class PriceCalculator {
  calculatePrice(item: any): number {
    if (item.type === 'book') {
      return item.price * 1.1  // Add tax
    } else if (item.type === 'electronics') {
      return item.price * 1.2  // Add warranty
    } else if (item.type === 'food') {
      return item.price * 0.9  // Discount
    }
    // Must modify this function for every new type
  }
}

// ✅ OCP: Extension through interfaces
interface PriceStrategy {
  calculate(item: Item): number
}

class BookPriceStrategy implements PriceStrategy {
  calculate(item: Item): number {
    return item.price * 1.1
  }
}

class ElectronicsPriceStrategy implements PriceStrategy {
  calculate(item: Item): number {
    return item.price * 1.2
  }
}

class FoodPriceStrategy implements PriceStrategy {
  calculate(item: Item): number {
    return item.price * 0.9
  }
}

class PriceCalculator {
  private strategies: Map<string, PriceStrategy> = new Map()

  register(type: string, strategy: PriceStrategy) {
    this.strategies.set(type, strategy)
  }

  calculatePrice(item: Item): number {
    const strategy = this.strategies.get(item.type)
    if (!strategy) throw new Error(`No strategy for ${item.type}`)
    return strategy.calculate(item)
  }
}

// Add new type without modifying existing code
calculator.register('clothing', new ClothingPriceStrategy())
```

### Extension Patterns

| Pattern | How It Works |
|---------|-------------|
| **Strategy** | Swap algorithms via interfaces |
| **Factory** | Create implementations without knowing types |
| **Decorator** | Add behavior dynamically |
| **Template Method** | Define skeleton, override steps |
| **Plugin** | Register extensions at runtime |

---

## 3. Liskov Substitution Principle (LSP)

### Definition

Implementations must **honor the behavioral contracts** of their abstractions. Subtypes must be substitutable for their base types without altering correctness.

### Key Insight

If `S` is a subtype of `T`, then objects of type `T` should be replaceable with objects of type `S` without breaking the program.

### TypeScript Example

```typescript
// ❌ VIOLATION: Subtype breaks base contract
interface Bird {
  fly(): void
  swim(): void
}

class Duck implements Bird {
  fly() { console.log('Flying') }
  swim() { console.log('Swimming') }
}

class Ostrich implements Bird {
  fly() { throw new Error('Cannot fly') }  // Breaks contract!
  swim() { throw new Error('Cannot swim') }
}

// ✅ LSP: Split interfaces, honor contracts
interface Flyable {
  fly(): void
}

interface Swimable {
  swim(): void
}

class Duck implements Flyable, Swimable {
  fly() { console.log('Flying') }
  swim() { console.log('Swimming') }
}

class Ostrich {
  run() { console.log('Running') }  // Different interface
}

class Swan implements Flyable, Swimable {
  fly() { console.log('Flying') }
  swim() { console.log('Swimming') }
}
```

### LSP Violations to Avoid

| Violation | Example |
|-----------|---------|
| **Precondition strengthening** | Subtype requires more than base |
| **Postcondition weakening** | Subtype guarantees less than base |
| **Side effects** | Subtype has unexpected behavior |
| **State invariants** | Subtype breaks state rules |

---

## 4. Interface Segregation Principle (ISP)

### Definition

Expose **focused interfaces** so consumers depend only on capabilities they use. No client should be forced to depend on methods it does not use.

### Key Insight

Fat interfaces create unnecessary coupling. Split them into smaller, role-specific interfaces.

### TypeScript Example

```typescript
// ❌ VIOLATION: Fat interface
interface Worker {
  work(): void
  eat(): void
  sleep(): void
  code(): void
  design(): void
  manage(): void
}

// Robot must implement methods it cannot do
class Robot implements Worker {
  work() { /* ... */ }
  eat() { throw new Error('Robots don\'t eat') }  // Forced dependency
  sleep() { throw new Error('Robots don\'t sleep') }
  code() { /* ... */ }
  design() { throw new Error('Robots can\'t design') }
  manage() { throw new Error('Robots can\'t manage') }
}

// ✅ ISP: Segregated interfaces
interface Workable {
  work(): void
}

interface Eatable {
  eat(): void
}

interface Sleepable {
  sleep(): void
}

interface Coder {
  code(): void
}

interface Designer {
  design(): void
}

interface Manager {
  manage(): void
}

class Human implements Workable, Eatable, Sleepable, Coder, Designer, Manager {
  work() { /* ... */ }
  eat() { /* ... */ }
  sleep() { /* ... */ }
  code() { /* ... */ }
  design() { /* ... */ }
  manage() { /* ... */ }
}

class Robot implements Workable, Coder {
  work() { /* ... */ }
  code() { /* ... */ }
  // No eat, sleep, design, manage
}
```

### Interface Roles

| Role | Methods |
|------|---------|
| `Workable` | `work()` |
| `Eatable` | `eat()` |
| `Sleepable` | `sleep()` |
| `Coder` | `code()` |
| `Designer` | `design()` |
| `Manager` | `manage()` |

---

## 5. Dependency Inversion Principle (DIP)

### Definition

High-level policy depends on **abstractions**; implementation details satisfy those abstractions.

### Two Parts

1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
2. Abstractions should not depend on details. Details should depend on abstractions.

### TypeScript Example

```typescript
// ❌ VIOLATION: High-level depends on low-level
class OrderService {
  private db: PostgreSQLDatabase  // Direct dependency on concrete class

  async saveOrder(order: Order) {
    await this.db.insert('orders', order)  // Tied to PostgreSQL
  }
}

// ✅ DIP: Depend on abstractions
interface Database {
  insert(table: string, data: unknown): Promise<void>
  query(sql: string): Promise<unknown[]>
}

class PostgreSQLDatabase implements Database {
  async insert(table: string, data: unknown) { /* ... */ }
  async query(sql: string) { /* ... */ }
}

class MongoDB implements Database {
  async insert(table: string, data: unknown) { /* ... */ }
  async query(sql: string) { /* ... */ }
}

class OrderService {
  constructor(private db: Database) {}  // Depends on abstraction

  async saveOrder(order: Order) {
    await this.db.insert('orders', order)  // Works with any DB
  }
}

// Swap implementations without changing OrderService
const service = new OrderService(new PostgreSQLDatabase())
const service2 = new OrderService(new MongoDB())
```

### Dependency Flow

```
┌─────────────────────────────────────────┐
│  High-Level Policy (OrderService)       │
│ ┌───────────────────────────────────┐   │
│ │  depends on abstraction           │   │
│ │  ┌─────────────────────────────┐  │   │
│ │  │  Database (interface)       │  │   │
│ │  │  - insert()                 │  │   │
│ │  │  - query()                  │  │   │
│ │  └─────────────┬───────────────┘  │   │
│ └────────────────┼──────────────────┘   │
│                  │ depends on           │
│                  ▼                      │
│   Low-Level Details                     │
│ ┌────────────────────┐ ┌──────────────┐ │
│ │ PostgreSQL         │ │ MongoDB      │ │
│ │ Database implements│ │ implements   │ │
│ └────────────────────┘ └──────────────┘ │
└─────────────────────────────────────────┘
```

---

## SOLID Integration Map

```
┌─────────────────────────────────────────────────────────────┐
│                    SOLID PRINCIPLES                         │
│                                                             │
│  SRP ──► One reason to change ──► Small, focused modules    │
│  OCP ──► Extension over modification ──► Interfaces, plugins│
│  LSP ──► Subtypes honor contracts ──► No forced behavior    │
│  ISP ──► Focused interfaces ──► Role-specific abstractions  │
│  DIP ──► Depend on abstractions ──► Dependency injection    │
│                                                             │
│  Together they produce:                                     │
│  • Testable code (each unit has one responsibility)         │
│  • Extensible code (add features without breaking existing) │
│  • Maintainable code (changes are localized)                │
│  • Flexible code (swap implementations easily)              │
└─────────────────────────────────────────────────────────────┘
```

---

## Common Anti-Patterns

| Anti-Pattern                    | Violation | Fix                        |
| ------------------------------- | --------- | -------------------------- |
| **God Object**                  | SRP       | Split into focused modules |
| **Conditional Logic Explosion** | OCP       | Use Strategy pattern       |
| **Broken Subtype**              | LSP       | Split interfaces           |
| **Fat Interface**               | ISP       | Segregate by role          |
| **Concrete Dependency**         | DIP       | Use abstractions + DI      |

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [DDD Patterns](./ddd-patterns.md)
- [Design Patterns](./design-patterns.md)
- [Coding Practices](./coding-practices.md)
- [Architecture Patterns](./architecture-patterns.md)
