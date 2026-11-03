---
slug: typescript-strict-mode
sources:
  - https://www.typescriptlang.org/tsconfig#strict
date: 2026-11-02
tags:














  - typescript
  - strict-mode
  - strict
  - compiler-options
---
slug: typescript-strict-mode
sources:
  - https://www.typescriptlang.org/docs/handbook/type-compatibility.html
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
  - https://typescript.tv/
date: 2026-11-02
tags:














  - typescript
  - strict-mode
  - type-safety
  - generics
  - utility-types
  - type-guards
  - discriminated-unions
  - template-literal-types
  - conditional-types
  - mapped-types
---

# TypeScript Strict Mode & Type Safety

## Overview

TypeScript's strict mode enables all strict type-checking options, providing maximum type safety at compile time.

---

## 1. Strict Compiler Options

```json
// tsconfig.json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "strictBindCallApply": true,
    "strictPropertyInitialization": true,
    "noImplicitThis": true,
    "alwaysStrict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "exactOptionalPropertyTypes": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedIndexedAccess": true,
    "noPropertyAccessFromIndexSignature": true,
    "skipLibCheck": true
  }
}
```

---

## 2. Null Safety

### Non-Null Assertion vs Optional Chaining

```typescript
interface User {
  name: string
  address?: { city: string }
}

// âŒ Non-null assertion (bypasses safety)
function getCity(user: User): string {
  return user.address!.city  // Crashes if address is undefined
}

// âœ… Optional chaining (safe)
function getCity(user: User): string | undefined {
  return user.address?.city
}

// âœ… Nullish coalescing with default
function getCity(user: User): string {
  return user.address?.city ?? 'Unknown'
}
```

### Type Guards for Null

```typescript
function processUser(input: User | null): void {
  // Explicit null check
  if (input === null) {
    throw new Error('User is required')
  }

  // TypeScript narrows the type
  console.log(input.name)  // Safe
}

// Type predicate
function isUser(value: unknown): value is User {
  return (
    typeof value === 'object' &&
    value !== null &&
    'name' in value &&
    typeof (value as User).name === 'string'
  )
}
```

---

## 3. Generics

### Generic Constraints

```typescript
interface HasId {
  id: string
}

// Generic with constraint
function findById<T extends HasId>(items: T[], id: string): T | undefined {
  return items.find(item => item.id === id)
}

// Multiple constraints
interface HasId { id: string }
interface HasName { name: string }

function process<T extends HasId & HasName>(item: T): void {
  console.log(`${item.id}: ${item.name}`)
}

// Generic with default
class Cache<T = string> {
  private store: Map<string, T> = new Map()

  set(key: string, value: T): void {
    this.store.set(key, value)
  }

  get(key: string): T | undefined {
    return this.store.get(key)
  }
}

const stringCache = new Cache<string>()
const numberCache = new Cache<number>()
const defaultCache = new Cache()  // Cache<string>
```

### Conditional Types

```typescript
// Extract type from union
type ExtractString<T> = T extends string ? T : never
type Result = ExtractString<'hello' | 42 | true>  // 'hello'

// Exclude type from union
type ExcludeNumber<T> = T extends number ? never : T
type Result2 = ExcludeNumber<'hello' | 42 | true>  // 'hello' | true

// Infer in conditional types
type ElementType<T> = T extends (infer E)[] ? E : T
type Result3 = ElementType<string[]>  // string
type Result4 = ElementType<number>   // number

// Recursive conditional types
type DeepPartial<T> = {
  [P in keyof T]?: T[P] extends object ? DeepPartial<T[P]> : T[P]
}

interface Config {
  database: {
    host: string
    port: number
  }
  features: string[]
}

type PartialConfig = DeepPartial<Config>
// {
//   database?: {
//     host?: string
//     port?: number
//   }
//   features?: string[]
// }
```

---

## 4. Utility Types

```typescript
interface User {
  id: string
  name: string
  email: string
  password?: string
}

// Partial â€” make all properties optional
type PartialUser = Partial<User>
// { id?: string; name?: string; email?: string; password?: string }

// Required â€” make all properties required
type RequiredUser = Required<User>
// { id: string; name: string; email: string; password: string }

// Readonly â€” make all properties readonly
type ReadonlyUser = Readonly<User>
// readonly id: string; readonly name: string; ...

// Pick â€” select specific properties
type UserSummary = Pick<User, 'id' | 'name'>
// { id: string; name: string }

// Omit â€” exclude specific properties
type UserWithoutPassword = Omit<User, 'password'>
// { id: string; name: string; email: string }

// Record â€” map types
type RolePermissions = Record<'admin' | 'user' | 'guest', string[]>
// { admin: string[]; user: string[]; guest: string[] }

// Extract â€” extract from union
type StringOrNumber = 'a' | 'b' | 1 | 2
type OnlyStrings = Extract<StringOrNumber, string>  // 'a' | 'b'

// Exclude â€” exclude from union
type OnlyNumbers = Exclude<StringOrNumber, string>  // 1 | 2

// Parameters â€” extract function parameters
function createUser(name: string, age: number): User { /* ... */ }
type CreateUserParams = Parameters<typeof createUser>
// [name: string, age: number]

// ReturnType â€” extract function return type
type CreateUserReturn = ReturnType<typeof createUser>
// User

// InstanceType â€” extract instance type from constructor
class UserClass {
  constructor(public name: string) {}
}
type UserInstance = InstanceType<typeof UserClass>
// { name: string }

// NonNullable â€” remove null and undefined
type NonNullableUser = NonNullable<User['password']>
// string (removes undefined)
```

---

## 5. Advanced Type Patterns

### Template Literal Types

```typescript
// Event system with typed events
type EventName = 'user:login' | 'user:logout' | 'order:created'

interface EventPayload {
  'user:login': { userId: string }
  'user:logout': { userId: string }
  'order:created': { orderId: string }
}

function emit<K extends EventName>(event: K, payload: EventPayload[K]): void {
  console.log(event, payload)
}

emit('user:login', { userId: '123' })  // âœ… Type-safe
// emit('user:login', { wrong: 'field' })  // âŒ Compile error

// Route types
type Route = '/users' | '/users/:id' | '/orders'

function navigate(route: Route): void {
  console.log(`Navigating to ${route}`)
}

// Union types
type HttpMethod = 'GET' | 'POST' | 'PUT' | 'DELETE'
type Status = 'success' | 'error'

type Response<T> = {
  status: Status
  data?: T
  error?: string
}
```

### Mapped Types

```typescript
// Make all properties optional
type Optional<T> = {
  [P in keyof T]?: T[P]
}

// Make all properties readonly
type ReadonlyAll<T> = {
  readonly [P in keyof T]: T[P]
}

// Remove optional properties
type RequiredAll<T> = {
  [P in keyof T]-?: T[P]
}

// Add prefix to all keys
type Prefixed<T, Prefix extends string> = {
  [P in keyof T as `${Prefix}${Extract<P, string>}`]: T[P]
}

interface Config {
  host: string
  port: number
}

type PrefixedConfig = Prefixed<Config, 'db_'>
// { db_host: string; db_port: number }

// Filter keys
type OnlyStrings<T> = {
  [P in keyof T as T[P] extends string ? P : never]: T[P]
}

interface Mixed {
  name: string
  age: number
  email: string
}

type StringFields = OnlyStrings<Mixed>
// { name: string; email: string }
```

---

## 6. Type-Safe APIs

### Result Type Pattern

```typescript
type Result<T, E = Error> =
  | { success: true; data: T }
  | { success: false; error: E }

async function fetchUser(id: string): Promise<Result<User, NotFoundError | NetworkError>> {
  try {
    const response = await fetch(`/api/users/${id}`)
    if (!response.ok) {
      if (response.status === 404) {
        return { success: false, error: new NotFoundError(id) }
      }
      return { success: false, error: new NetworkError(response.statusText) }
    }
    const user = await response.json()
    return { success: true, data: user }
  } catch (error) {
    return { success: false, error: error as NetworkError }
  }
}

// Usage â€” exhaustive handling
const result = await fetchUser('123')
if (result.success) {
  console.log(result.data.name)
} else {
  console.error(result.error.message)
}
```

### Type-Safe Event Emitter

```typescript
type Listener<T> = (data: T) => void

class TypedEventEmitter<TEvents extends Record<string, unknown>> {
  private listeners = new Map<keyof TEvents, Set<Listener<any>>>()

  on<K extends keyof TEvents>(event: K, listener: Listener<TEvents[K]>): void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, new Set())
    }
    this.listeners.get(event)!.add(listener as Listener<any>)
  }

  emit<K extends keyof TEvents>(event: K, data: TEvents[K]): void {
    this.listeners.get(event)?.forEach(listener => listener(data))
  }
}

// Define event map
interface AppEvents {
  'user:login': { userId: string; timestamp: Date }
  'user:logout': { userId: string }
  'order:created': { orderId: string; total: number }
}

const emitter = new TypedEventEmitter<AppEvents>()

emitter.on('user:login', (data) => {
  console.log(`${data.userId} logged in at ${data.timestamp}`)
  // TypeScript knows data has userId and timestamp
})

// emitter.on('user:login', (data) => { console.log(data.wrong) })  // âŒ Error
```

---

## Cross-References

- [React Patterns](./Architecture/react-patterns.md)
- [Testing Patterns](./Quality & Testing/test-driven-developments.md)
- [Coding Practices](./Architecture/clean-architecture.md)

---

## Integration with Other Notes

- Read [[TypeScript/typescript-strict-mode]] for TypeScript best practices
- Read [[TypeScript/typescript-strict-mode]] for TypeScript fundamentals
- Read [[TypeScript/generics]] for advanced TypeScript types
- Read [[TypeScript/type-inference]] for type narrowing patterns
- Read [[ts-Security/web-security]] for TypeScript security best practices
- Read [[TypeScript/typescript-strict-mode]] for TypeScript optimization
- Read [[TypeScript/typescript-configuration]] for tsconfig.json configuration
- Read [Architecture/react-patterns](D/Architecture/react-patterns.md) for React patterns

---

## Decision Tree: TypeScript Strict Mode

```mermaid
graph TD
    A[Need TypeScript strictness?]\n    A --> B{What level?}
    B -->|Full strict| C[strict: true]
    B -->|Partial| D[Select options]
    B -->|None| E[Not recommended]
    C --> F{Null checks?}
    F -->|Yes| G[strictNullChecks]
    F -->|No| H[Skip]
    C --> I{Property init?}
    I -->|Yes| J[strictPropertyInitialization]
    I -->|No| K[Skip]
    G --> L{Union types?}
    L -->|Yes| M[Type guards]
    L -->|No| N[Direct access]
```

### When to Use Each Strict Option

| Option | When to Use | Example |
|---------|-------------|---------|
| **strictNullChecks** | All projects | string \| null |
| **noImplicitAny** | All projects | Prevents any |
| **strictPropertyInitialization** | Classes | Ensure init |
| **strictFunctionTypes** | Function params | Contravariance |
| **strictBindCallApply** | All projects | Bind/call/apply |

---

## Procedural Guidance: TypeScript Strict Setup

### Step 1: Configure tsconfig.json

```jsonc
// tsconfig.json
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "ESNext",
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitOverride": true,
    "useUnknownInCatchVariables": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```

### Step 2: Enable Strict Null Checks

```typescript
// âŒ Without strictNullChecks
function getName(user: User): string {
  return user.name // May be undefined!
}

// âœ… With strictNullChecks
function getName(user: User): string {
  if (!user.name) throw new Error('Name required')
  return user.name
}

// Or use optional chaining
function getDisplayName(user: User): string {
  return user.name ?? 'Anonymous'
}
```

### Step 3: Type Guards

```typescript
function isUser(value: unknown): value is User {
  return (
    typeof value === 'object' &&
    value !== null &&
    'id' in value &&
    'name' in value &&
    'email' in value
  )
}

// Usage
function processUser(input: unknown) {
  if (isUser(input)) {
    // TypeScript knows input is User here
    console.log(input.name)
  } else {
    throw new Error('Invalid user')
  }
}
```

### Step 4: Discriminated Unions

```typescript
type Success = {
  status: 'success'
  data: User
}

type Error = {
  status: 'error'
  error: string
}

type Result = Success | Error

function handleResult(result: Result) {
  switch (result.status) {
    case 'success':
      return result.data.name // TypeScript knows data exists
    case 'error':
      return result.error // TypeScript knows error exists
    default: {
      const _exhaustiveCheck: never = result
      return `Unknown status: ${_exhaustiveCheck}`
    }
  }
}
```

### Step 5: Test Strict Mode

```bash
# Type check without emitting
pnpm tsc --noEmit

# Check with strict mode
pnpm tsc --strict

# Show all errors
pnpm tsc --noEmit --pretty
```

---

## Copilot Instructions

### When to Read This Note
- Setting up TypeScript strict mode
- Enabling strict null checks
- Implementing type guards
- Using discriminated unions
- Testing TypeScript types

### What to Do With This Information
1. **Enable strict mode**: Use full strict mode for all projects
2. **Strict null checks**: Always check for null/undefined
3. **Type guards**: Validate at runtime with type predicates
4. **Discriminated unions**: Use for state machines
5. **Test types**: Use expectTypeOf to verify types

### Tools to Use
- **VS Code Extension**: TypeScript Hero â€” for TypeScript shortcuts
- **VS Code Extension**: Error Lens â€” for inline TypeScript error display
- **npm Package**: `vitest` â€” for type testing with expectTypeOf
- **Terminal Command**: `pnpm tsc --noEmit` â€” type check without emitting
- **Terminal Command**: `pnpm tsc --strict` â€” enable strict mode

### Agents to Invoke
- **Code Review Agent**: Run when reviewing PRs with TypeScript changes
- **Security Review Agent**: Run when adding new types

### Integration with Other Notes
- Read [[TypeScript/typescript-strict-mode]] for TypeScript best practices
- Read [[TypeScript/typescript-strict-mode]] for TypeScript fundamentals
- Read [[TypeScript/generics]] for advanced TypeScript types
- Read [[TypeScript/type-inference]] for type narrowing patterns
- Read [[ts-Security/web-security]] for TypeScript security best practices
- Read [[TypeScript/typescript-strict-mode]] for TypeScript optimization
- Read [[TypeScript/typescript-configuration]] for tsconfig.json configuration
- Read [Architecture/react-patterns](D/Architecture/react-patterns.md) for React patterns

### Common Pitfalls
- Don't use any type (use unknown instead)
- Don't skip null checks (always check for null/undefined)
- Don't ignore strict property initialization (initialize in constructor)
- Don't use type assertions (use type guards instead)
- Don't skip exhaustiveness checking (use never)

### Quick Validation Checklist
- [ ] Is strict mode enabled?
- [ ] Are strictNullChecks enabled?
- [ ] Are type guards used for runtime validation?
- [ ] Are discriminated unions used for state?
- [ ] Are properties initialized in constructor?
- [ ] Is tsconfig configured properly?



## See Also
- [[T01-TypeScript/generics]]
- [[T02-TypeScript/typescript-strict-mode]]
- [[T03-ts-decorators]]
- [[T04-TypeScript/typescript-strict-mode]]
- [[T05-TypeScript/type-inference]]


