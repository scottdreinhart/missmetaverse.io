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
# SOLID Principles

## Overview

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
SOLID is a mnemonic acronym for five principles that make source code more understandable, flexible, and maintainable. Introduced by Robert C. Martin in 2000, the acronym was coined by Michael Feathers around 2004.

---

## 1. Single Responsibility Principle (SRP)

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### Definition

A module has **one cohesive responsibility** and **one primary reason to change**.

### Key Insight

Responsibility = reason to change. If you can think of more than one reason to change a module, it has more than one responsibility.

### TypeScript Example

```typescript
// âŒ VIOLATION: Multiple reasons to change
class UserService {
  createUser(name: string, email: string) { /* ... */ }
  sendWelcomeEmail(user: User) { /* ... */ }  // Changes when email format changes
  hashPassword(password: string) { /* ... */ }  // Changes when hashing algorithm changes
  validateEmail(email: string) { /* ... */ }    // Changes when validation rules change
}

// âœ… SRP: Each class has one reason to change
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

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### Definition

Software entities should be **open for extension** but **closed for modification**.

### Key Insight

Add new behavior through stable extension points (interfaces, abstract classes, composition) rather than modifying existing code.

### TypeScript Example

```typescript
// âŒ VIOLATION: Modifying existing code for new types
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

// âœ… OCP: Extension through interfaces
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

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### Definition

Implementations must **honor the behavioral contracts** of their abstractions. Subtypes must be substitutable for their base types without altering correctness.

### Key Insight

If `S` is a subtype of `T`, then objects of type `T` should be replaceable with objects of type `S` without breaking the program.

### TypeScript Example

```typescript
// âŒ VIOLATION: Subtype breaks base contract
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

// âœ… LSP: Split interfaces, honor contracts
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

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### Definition

Expose **focused interfaces** so consumers depend only on capabilities they use. No client should be forced to depend on methods it does not use.

### Key Insight

Fat interfaces create unnecessary coupling. Split them into smaller, role-specific interfaces.

### TypeScript Example

```typescript
// âŒ VIOLATION: Fat interface
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

// âœ… ISP: Segregated interfaces
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

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### Definition

High-level policy depends on **abstractions**; implementation details satisfy those abstractions.

### Two Parts

1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
2. Abstractions should not depend on details. Details should depend on abstractions.

### TypeScript Example

```typescript
// âŒ VIOLATION: High-level depends on low-level
class OrderService {
  private db: PostgreSQLDatabase  // Direct dependency on concrete class

  async saveOrder(order: Order) {
    await this.db.insert('orders', order)  // Tied to PostgreSQL
  }
}

// âœ… DIP: Depend on abstractions
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
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚  High-Level Policy (OrderService)       â”‚
â”‚ â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”   â”‚
â”‚ â”‚  depends on abstraction           â”‚   â”‚
â”‚ â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”‚   â”‚
â”‚ â”‚  â”‚  Database (interface)       â”‚  â”‚   â”‚
â”‚ â”‚  â”‚  - insert()                 â”‚  â”‚   â”‚
â”‚ â”‚  â”‚  - query()                  â”‚  â”‚   â”‚
â”‚ â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â”‚   â”‚
â”‚ â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜   â”‚
â”‚                  â”‚ depends on           â”‚
â”‚                  â–¼                      â”‚
â”‚   Low-Level Details                     â”‚
â”‚ â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â” â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â” â”‚
â”‚ â”‚ PostgreSQL         â”‚ â”‚ MongoDB      â”‚ â”‚
â”‚ â”‚ Database implementsâ”‚ â”‚ implements   â”‚ â”‚
â”‚ â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜ â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜ â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## SOLID Integration Map

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                    SOLID PRINCIPLES                         â”‚
â”‚                                                             â”‚
â”‚  SRP â”€â”€â–º One reason to change â”€â”€â–º Small, focused modules    â”‚
â”‚  OCP â”€â”€â–º Extension over modification â”€â”€â–º Interfaces, pluginsâ”‚
â”‚  LSP â”€â”€â–º Subtypes honor contracts â”€â”€â–º No forced behavior    â”‚
â”‚  ISP â”€â”€â–º Focused interfaces â”€â”€â–º Role-specific abstractions  â”‚
â”‚  DIP â”€â”€â–º Depend on abstractions â”€â”€â–º Dependency injection    â”‚
â”‚                                                             â”‚
â”‚  Together they produce:                                     â”‚
â”‚  â€¢ Testable code (each unit has one responsibility)         â”‚
â”‚  â€¢ Extensible code (add features without breaking existing) â”‚
â”‚  â€¢ Maintainable code (changes are localized)                â”‚
â”‚  â€¢ Flexible code (swap implementations easily)              â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## Common Anti-Patterns

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Anti-Pattern                    | Violation | Fix                        |
| ------------------------------- | --------- | -------------------------- |
| **God Object**                  | SRP       | Split into focused modules |
| **Conditional Logic Explosion** | OCP       | Use Strategy pattern       |
| **Broken Subtype**              | LSP       | Split interfaces           |
| **Fat Interface**               | ISP       | Segregate by role          |
| **Concrete Dependency**         | DIP       | Use abstractions + DI      |

---

## Cross-References

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Clean Architecture](./clean-architecture.md)
- [DDD Patterns](./Application Architecture/domain-driven-design.md)
- [Design Patterns](./design-patterns.md)
- [Coding Practices](./Architecture/clean-architecture.md)
- [Architecture Patterns](./architecture-patterns.md)

---

## Copilot Instructions

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### When to Read This Note
- Writing new classes or interfaces
- Refactoring code that's hard to test
- Code review: checking for coupled or rigid code
- Designing API contracts or service interfaces
- Adding new features that might break existing code

### What to Do With This Information
1. **SRP**: Before creating a class, ask "does this have one reason to change?" If no, split it
2. **OCP**: When adding new behavior, extend through interfaces â€” don't modify existing code
3. **LSP**: When creating subtypes, verify they can be substituted for their base type
4. **ISP**: When creating interfaces, split them by role â€” no client should depend on unused methods
5. **DIP**: Always depend on abstractions (interfaces), never on concrete implementations

### Tools to Use
- **VS Code Extension**: ESLint with `@typescript-eslint` â€” for detecting code smells
- **VS Code Extension**: Error Lens â€” for inline violation detection
- **npm Package**: `eslint-plugin-simple-import-sort` â€” for import organization
- **Terminal Command**: `pnpm tsc --noEmit` â€” verify type safety after refactoring
- **Terminal Command**: `pnpm test` â€” verify refactoring didn't break tests

### Agents to Invoke
- **Code Review Agent**: Run when reviewing PRs for SOLID compliance
- **Architecture Validation Agent**: Run when designing new modules

### Integration with Other Notes
- Read [clean-architecture](https://martinfowler.com/bliki/CleanArchitecture.html) for layer-level application of SOLID
- Read [[Application Architecture/domain-driven-design]] for domain-level application of SOLID
- Read [dependency-injection](https://en.wikipedia.org/wiki/Dependency_injection) for DIP implementation patterns
- Read [[Architecture/clean-architecture]] for SOLID in daily coding

### Common Pitfalls
- Don't create interfaces just to satisfy DIP â€” only when there are multiple implementations
- Don't over-segregate interfaces (ISP) â€” keep related methods together
- Don't use inheritance when composition would work (prefer composition over inheritance)
- Don't create abstractions for single-use cases (DIP is for polymorphism, not indirection)
- Don't violate LSP to save boilerplate (subtypes must honor contracts)

### Quick Validation Checklist
- [ ] Can I test this class in isolation? (SRP)
- [ ] Can I add new behavior without modifying this class? (OCP)
- [ ] Can I substitute subtypes without breaking? (LSP)
- [ ] Does this interface have only methods the consumer needs? (ISP)
- [ ] Does this class depend on an interface, not a concrete class? (DIP)


## See Also

## concept_id
a206-solid-principles

## title
SOLID Principles

## aliases
- A206-solid-principles

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended- [[A001-abstract-factory-pattern]]
- [[Architecture/abstract-factory-pattern]]
- [[A003-accessibility-a11y]]
- [[A004-accessibility-by-design]]
- [[A005-active-record-pattern]]


