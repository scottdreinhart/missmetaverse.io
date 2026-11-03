---
slug: coding-practices
sources:
  - https://docs.microsoft.com/en-us/dotnet/architecture/microservices/
  - https://www.enterpriseintegrationpatterns.com/
date: 2026-11-02
tags:
  - priority/high
  - maturity/deprecated
  - domain/backend
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/accessibility
  - domain/database
  - status/complete
  - type/reference
  - domain/architecture
  - coding-practices
  - strict-typing
  - parse-dont-validate
  - make-invalid-states-unrepresentable
  - discriminated-unions
  - exhaustive-handling
  - immutability
  - pure-functions
  - explicit-error-modeling
  - resource-lifecycle
  - structured-concurrency
  - boundary-validation
  - small-cohesive-modules
  - dependency-hygiene
  - accessibility-by-design
  - internationalization-by-design
---

# Coding Practices & Type-System Practices

## Overview

Coding practices and type-system practices ensure code is maintainable, reliable, and expressive. These practices leverage TypeScript's type system to catch errors at compile time rather than runtime.

---

## 1. Type-System Practices

### Strict Typing

**Use TypeScript's strict mode and avoid `any` or `unknown` when possible.**

```typescript
// ❌ Insecure: using any
function process(data: any): void {
  console.log(data.property)  // No compile-time check
}

// ✅ Secure: explicit types
function process(data: UserData): void {
  console.log(data.name)  // Compile-time check
}

// ✅ When you must accept unknown, validate
function process(data: unknown): void {
  if (isUserData(data)) {
    console.log(data.name)  // Safe after type guard
  }
}

// Type guard
function isUserData(data: unknown): data is UserData {
  return (
    typeof data === 'object' &&
    data !== null &&
    'name' in data &&
    typeof (data as any).name === 'string'
  )
}
```

### Parse Don't Validate

**Parse input into typed values rather than validating raw strings.**

```typescript
// ❌ Validate raw input
function createUser(input: CreateUserInput): User {
  if (!input.name || input.name.length < 2) {
    throw new Error('Invalid name')
  }
  if (!input.email.includes('@')) {
    throw new Error('Invalid email')
  }
  if (isNaN(input.age) || input.age < 0) {
    throw new Error('Invalid age')
  }
  return { name: input.name, email: input.email, age: input.age }
}

// ✅ Parse into typed values
class Name {
  private constructor(private value: string) {}
  static create(name: string): Name {
    if (name.length < 2 || name.length > 100) {
      throw new InvalidNameError(name)
    }
    return new Name(name.trim())
  }
  get value() { return this.value }
}

class Email {
  private constructor(private value: string) {}
  static create(email: string): Email {
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      throw new InvalidEmailError(email)
    }
    return new Email(email.toLowerCase())
  }
  get value() { return this.value }
}

class Age {
  private constructor(private value: number) {}
  static create(age: number): Age {
    if (!Number.isInteger(age) || age < 0 || age > 150) {
      throw new InvalidAgeError(age)
    }
    return new Age(age)
  }
  get value() { return this.value }
}

// Usage — parsing enforces invariants
function createUser(input: { name: string; email: string; age: number }): User {
  return {
    name: Name.create(input.name),
    email: Email.create(input.email),
    age: Age.create(input.age),
  }
}
```

### Make Invalid States Unrepresentable

**Use the type system to prevent invalid states at compile time.**

```typescript
// ❌ Invalid state possible
interface Order {
  status: 'pending' | 'confirmed' | 'shipped' | 'cancelled'
  shippedAt?: Date
  cancelledAt?: Date
  trackingNumber?: string
}

// Can have status 'shipped' without trackingNumber — invalid!
const badOrder: Order = {
  status: 'shipped',
  shippedAt: new Date(),
  // Missing trackingNumber — but TypeScript allows it
}

// ✅ Invalid states are unrepresentable
type Order =
  | { status: 'pending'; items: OrderItem[] }
  | { status: 'confirmed'; items: OrderItem[]; customerId: string }
  | { status: 'shipped'; items: OrderItem[]; trackingNumber: string; shippedAt: Date }
  | { status: 'cancelled'; items: OrderItem[]; reason: string; cancelledAt: Date }

// TypeScript enforces correct fields for each state
const goodOrder: Order = {
  status: 'shipped',
  items: [],
  trackingNumber: '1Z999AA10123456784',
  shippedAt: new Date(),
}

// This would be a compile error:
// const badOrder: Order = { status: 'shipped', items: [] }  // Missing trackingNumber
```

### Discriminated Unions

**Use a common field to distinguish between types.**

```typescript
type Result<T, E> =
  | { kind: 'success'; data: T }
  | { kind: 'error'; error: E }

async function fetchUser(id: string): Promise<Result<User, NotFoundError | NetworkError>> {
  try {
    const user = await api.getUser(id)
    if (!user) {
      return { kind: 'error', error: new NotFoundError(id) }
    }
    return { kind: 'success', data: user }
  } catch (error) {
    return { kind: 'error', error: error as NetworkError }
  }
}

// Usage — exhaustive handling
const result = await fetchUser('123')
switch (result.kind) {
  case 'success':
    console.log(result.data.name)  // TypeScript knows data exists
    break
  case 'error':
    console.error(result.error.message)  // TypeScript knows error exists
    break
}
```

### Exhaustive Handling

**Ensure all cases are handled using `never` type.**

```typescript
type Shape =
  | { type: 'circle'; radius: number }
  | { type: 'square'; side: number }
  | { type: 'rectangle'; width: number; height: number }

function area(shape: Shape): number {
  switch (shape.type) {
    case 'circle':
      return Math.PI * shape.radius ** 2
    case 'square':
      return shape.side ** 2
    case 'rectangle':
      return shape.width * shape.height
    default: {
      // TypeScript ensures all cases are handled
      const exhaustiveCheck: never = shape
      throw new Error(`Unhandled shape type: ${exhaustiveCheck}`)
    }
  }
}

// If we add a new shape type, TypeScript will flag the missing case
// type Shape = { type: 'triangle'; base: number; height: number }
// area() would now show a compile error
```

### Immutability

**Prefer immutable data structures to prevent unexpected mutations.**

```typescript
// ❌ Mutable state
class ShoppingCart {
  items: CartItem[] = []

  addItem(item: CartItem): void {
    this.items.push(item)  // Direct mutation
  }
}

// ✅ Immutable state
class ShoppingCart {
  constructor(private readonly items: readonly CartItem[] = []) {}

  addItem(item: CartItem): ShoppingCart {
    return new ShoppingCart([...this.items, item])  // New instance
  }

  removeItem(itemId: string): ShoppingCart {
    return new ShoppingCart(this.items.filter(i => i.id !== itemId))
  }

  get items(): readonly CartItem[] {
    return [...this.items]  // Return copy, not reference
  }
}

// Usage — no unexpected mutations
let cart = new ShoppingCart()
cart = cart.addItem({ id: '1', name: 'Book', price: 10 })
const previousCart = cart
cart = cart.addItem({ id: '2', name: 'Pen', price: 5 })

console.log(previousCart.items.length)  // 1 — not affected by new item
```

### Pure Functions

**Functions that always produce the same output for the same input with no side effects.**

```typescript
// ❌ Impure function
let discount = 0.1
function calculateTotal(price: number): number {
  return price * (1 - discount)  // Depends on external state
}

// ✅ Pure function
function calculateTotal(price: number, discount: number): number {
  return price * (1 - discount)  // Same input → same output
}

// Benefits of pure functions:
// 1. Predictable — no hidden state
// 2. Testable — no mocking needed
// 3. Composable — can be combined safely
// 4. Cacheable — result depends only on input
```

### Explicit Error Modeling

**Model errors as values, not exceptions.**

```typescript
// ❌ Using exceptions for control flow
function findUser(id: string): User {
  const user = db.find(id)
  if (!user) {
    throw new NotFoundError(id)  // Exception for control flow
  }
  return user
}

// ✅ Explicit error types
type Result<T> = { success: true; data: T } | { success: false; error: Error }

function findUser(id: string): Result<User> {
  const user = db.find(id)
  if (!user) {
    return { success: false, error: new NotFoundError(id) }
  }
  return { success: true, data: user }
}

// Usage — forced to handle both cases
const result = findUser('123')
if (result.success) {
  console.log(result.data.name)
} else {
  console.error(result.error.message)
}
```

---

## 2. Architecture Practices

### Resource Lifecycle

**Manage resources (connections, files, locks) with clear lifecycle management.**

```typescript
class DatabaseConnection {
  private pool: Pool | null = null

  async connect(): Promise<void> {
    this.pool = new Pool({ connectionString: process.env.DATABASE_URL })
  }

  async query<T>(text: string, params?: unknown[]): Promise<T[]> {
    if (!this.pool) {
      throw new Error('Database not connected')
    }
    const client = await this.pool.connect()
    try {
      const result = await client.query(text, params)
      return result.rows as T[]
    } finally {
      client.release()  // Always release
    }
  }

  async disconnect(): Promise<void> {
    await this.pool?.end()
    this.pool = null
  }
}

// Usage — explicit lifecycle
const db = new DatabaseConnection()
await db.connect()
try {
  const users = await db.query<User>('SELECT * FROM users')
  // ... use users
} finally {
  await db.disconnect()  // Clean up
}
```

### Structured Concurrency

**Manage concurrent operations with clear ownership and cancellation.**

```typescript
class TaskGroup {
  private tasks: Promise<void>[] = []

  spawn(promise: Promise<void>): void {
    this.tasks.push(promise.catch(() => { /* Handle but don't propagate */ }))
  }

  async all(): Promise<void> {
    await Promise.allSettled(this.tasks)
  }

  cancel(): void {
    // Cancel all tasks
    this.tasks.forEach(task => {
      // Tasks should be cancellable via AbortController
    })
  }
}

// Usage — structured concurrency
async function fetchData(): Promise<void> {
  const group = new TaskGroup()

  group.fetchUsers()
  group.fetchOrders()
  group.fetchProducts()

  await group.all()  // Wait for all, handle failures
}
```

### Boundary Validation

**Validate input at system boundaries (API, CLI, file imports).**

```typescript
// API boundary validation
app.post('/users', async (req, res) => {
  // Validate at boundary
  const result = CreateUserSchema.safeParse(req.body)
  if (!result.success) {
    return res.status(400).json({ error: result.error.errors })
  }

  // Domain logic receives validated data
  const user = await this.userService.create(result.data)
  return res.status(201).json(user)
})

// File import boundary validation
async importUsers(csv: string): Promise<User[]> {
  const rows = csv.split('\n')
  const users: User[] = []

  for (const row of rows) {
    const parsed = parseRow(row)
    if (!isValidRow(parsed)) {
      throw new InvalidImportError(`Invalid row: ${row}`)
    }
    users.push(createUser(parsed))
  }

  return users
}
```

### Small Cohesive Modules

**Keep modules focused on a single responsibility.**

```typescript
// ❌ Large, non-cohesive module
// user-service.ts — 500+ lines
class UserService {
  createUser() { /* ... */ }
  validateEmail() { /* ... */ }
  sendWelcomeEmail() { /* ... */ }
  generateToken() { /* ... */ }
  hashPassword() { /* ... */ }
  // ... many more responsibilities
}

// ✅ Small, cohesive modules
// user-service.ts — focused on user operations
class UserService {
  constructor(
    private validator: EmailValidator,
    private emailer: EmailService,
    private tokenGenerator: TokenService,
    private hasher: PasswordHasher
  ) {}

  async createUser(params: CreateUserParams): Promise<User> {
    this.validator.validate(params.email)
    const hashedPassword = await this.hasher.hash(params.password)
    const token = this.tokenGenerator.generate()
    // ... create user
  }
}

// email-validator.ts — focused on email validation
class EmailValidator {
  validate(email: string): void {
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      throw new InvalidEmailError(email)
    }
  }
}

// email-service.ts — focused on sending emails
class EmailService {
  async sendWelcomeEmail(to: string, name: string): Promise<void> {
    // ... send email
  }
}
```

### Dependency Hygiene

**Manage dependencies explicitly and avoid circular dependencies.**

```typescript
// ❌ Circular dependency
// user-service.ts
import { OrderService } from './order-service'
class UserService {
  constructor(private orderService: OrderService) {}
}

// order-service.ts
import { UserService } from './user-service'
class OrderService {
  constructor(private userService: UserService) {}
}

// ✅ Dependency injection — both depend on abstraction
// user-port.ts
export interface UserPort {
  getUser(id: string): Promise<User | null>
}

// order-port.ts
export interface OrderPort {
  getOrder(id: string): Promise<Order | null>
}

// user-service.ts
class UserService {
  constructor(private orderPort: OrderPort) {}
}

// order-service.ts
class OrderService {
  constructor(private userPort: UserPort) {}
}
```

---

## 3. Quality Practices

### Accessibility by Design

**Build accessible interfaces from the start, not as an afterthought.**

```typescript
// ✅ Accessible components
function SearchInput() {
  return (
    <div className="relative">
      <label htmlFor="search" className="sr-only">Search</label>
      <input
        id="search"
        type="search"
        placeholder="Search..."
        aria-describedby="search-help"
      />
      <span id="search-help" className="text-sm text-gray-500">
        Type to search products
      </span>
    </div>
  )
}

// ✅ Keyboard navigation
function Navigation() {
  return (
    <nav role="navigation" aria-label="Main navigation">
      <ul className="flex space-x-4">
        {navItems.map((item, index) => (
          <li key={item.id}>
            <a
              href={item.href}
              tabIndex={index === 0 ? 0 : -1}
              aria-current={item.current ? 'page' : undefined}
            >
              {item.label}
            </a>
          </li>
        ))}
      </ul>
    </nav>
  )
}
```

### Internationalization by Design

**Design for multiple languages from the start.**

```typescript
// ✅ i18n-ready application
class I18nService {
  private translations: Record<string, Record<string, string>> = {}
  private currentLocale: string = 'en'

  register(locale: string, translations: Record<string, string>): void {
    this.translations[locale] = translations
  }

  t(key: string, params?: Record<string, string | number>): string {
    let text = this.translations[this.currentLocale]?.[key] ?? key

    // Replace placeholders
    if (params) {
      for (const [key, value] of Object.entries(params)) {
        text = text.replace(`{${key}}`, String(value))
      }
    }

    return text
  }

  setLocale(locale: string): void {
    this.currentLocale = locale
  }
}

// Usage
const i18n = new I18nService()
i18n.register('en', { 'welcome': 'Welcome, {name}!' })
i18n.register('es', { 'welcome': '¡Bienvenido, {name}!' })

console.log(i18n.t('welcome', { name: 'John' }))  // "Welcome, John!"
i18n.setLocale('es')
console.log(i18n.t('welcome', { name: 'John' }))  // "¡Bienvenido, John!"
```

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./ddd-patterns.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./coding-practices.md)

---

## Integration with Other Notes

- Read [clean-architecture](https://martinfowler.com/bliki/CleanArchitecture.html) for clean architecture patterns
- Read [solid-principles](https://en.wikipedia.org/wiki/SOLID) for SOLID design principles
- Read [[ddd-patterns]] for domain-driven design patterns
- Read [architecture-patterns](https://en.wikipedia.org/wiki/Software_architecture_pattern) for architecture patterns
- Read [ts-best-practices](D/ts-best-practices.md) for TypeScript best practices
- Read [react-patterns](D/react-patterns.md) for React patterns
- Read [typescript-strict-mode](D/typescript-strict-mode.md) for TypeScript strict mode


## See Also
- [[A001-abstract-factory-pattern]]
- [[A002-abstract-factory-patterns]]
- [[A003-accessibility-a11y]]
- [[A004-accessibility-by-design]]
- [[A005-active-record-pattern]]


