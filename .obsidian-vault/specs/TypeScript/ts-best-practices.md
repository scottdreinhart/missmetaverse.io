---
slug: ts-best-practices
sources:
  - https://www.typescriptlang.org/docs/handbook/2/everyday-types.html
  - https://www.typescriptlang.org/docs/handbook/2/functions.html
  - https://www.typescriptlang.org/docs/handbook/2/objects.html
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
  - https://www.typescriptlang.org/tsconfig
date: 2026-11-02
---

# TypeScript Best Practices

## Project Structure

### File Organization

```
src/
├── components/        # React components
├── services/          # API/business logic
├── types/             # Shared type definitions
├── utils/             # Helper functions
├── hooks/             # Custom React hooks
└── constants/         # Constants and enums
```

### Separate Type Definitions

```typescript
// types/user.ts — dedicated type file
export interface User {
  id: string;
  name: string;
  email: string;
  role: UserRole;
}

export enum UserRole {
  Admin = "admin",
  User = "user",
  Guest = "guest",
}

// In your component — import types explicitly
import type { User, UserRole } from "@/types/user";
```

## Type Definitions

### Prefer Interfaces for Object Shapes

```typescript
// ✅ Interface — extensible, clear intent
interface User {
  id: string;
  name: string;
  email: string;
}

// Can be extended via declaration merging
interface User {
  createdAt: Date;
}
// Result: { id, name, email, createdAt }
```

### Prefer Type Aliases for Unions and Computed Types

```typescript
// ✅ Type alias — unions, intersections, computed types
type ID = string | number;

type CreateUserInput = Omit<User, "id" | "createdAt">;

type EventHandler<T> = (event: T) => void;
```

### Use Literal Types for Constraints

```typescript
// ✅ Literal types — self-documenting, type-safe
type ButtonVariant = "primary" | "secondary" | "danger";

function Button({ variant }: { variant: ButtonVariant }) {
  // variant is restricted to the three options
}

// ❌ String — no constraints
function BadButton({ variant }: { variant: string }) {
  // variant can be anything
}
```

## Functions

### Explicit Return Types

```typescript
// ✅ Explicit return type — self-documenting
function getUser(id: string): User | undefined {
  return users.find(u => u.id === id);
}

// ✅ For complex returns, explicit is better
function processRequest(
  req: Request
): Result<{ data: UserData; meta: Metadata }> {
  // ...
}
```

### Use `Record` for Dictionary Types

```typescript
// ✅ Record — clear key-value structure
const userMap: Record<string, User> = {};

// ✅ With specific keys
type ConfigKeys = "host" | "port" | "debug";
const config: Record<ConfigKeys, string | boolean> = {
  host: "localhost",
  port: "3000",
  debug: true,
};
```

### Prefer Function Declarations for Named Functions

```typescript
// ✅ Function declaration — hoisted, clearer
function calculateTotal(items: Item[]): number {
  return items.reduce((sum, item) => sum + item.price, 0);
}

// ✅ Arrow function — for callbacks, short functions
const items = list.map(item => item.name);
```

## Generic Programming

### Keep Generics Simple

```typescript
// ✅ Simple, constrained generic
function firstElement<T extends Array<unknown>>(arr: T): T[number] {
  return arr[0];
}

// ❌ Overly complex — hard to understand
function complex<T extends U, U extends V, V extends object, K extends keyof V>(
  obj: T,
  key: K
): V[K] {
  // ...
}
```

### Use Constraints to Limit Generics

```typescript
// ✅ Constrained — only objects with id property
function findItem<T extends { id: string }>(items: T[], id: string): T | undefined {
  return items.find(item => item.id === id);
}

// ❌ Unconstrained — too broad
function findItem<T>(items: T[], id: string): T | undefined {
  // No guarantee items has id
}
```

## Error Handling

### Use Custom Error Classes

```typescript
// ✅ Custom error — preserves stack trace
class AppError extends Error {
  constructor(
    message: string,
    public code: string,
    public statusCode: number
  ) {
    super(message);
    this.name = "AppError";
  }
}

// Usage
if (!user) {
  throw new AppError("User not found", "USER_NOT_FOUND", 404);
}
```

### Never Use `any` in Error Handling

```typescript
// ❌ any — loses type safety
try {
  fetchData();
} catch (err: any) {
  console.error(err.message); // Works but unsafe
}

// ✅ unknown — must narrow
try {
  fetchData();
} catch (err: unknown) {
  if (err instanceof Error) {
    console.error(err.message);
  } else if (typeof err === "string") {
    console.error(err);
  } else {
    console.error("Unknown error");
  }
}
```

## React-Specific Best Practices

### Type React Components Properly

```typescript
// ✅ Functional component with typed props
interface ButtonProps {
  variant: "primary" | "secondary";
  disabled?: boolean;
  onClick: () => void;
  children: React.ReactNode;
}

function Button({ variant, disabled = false, onClick, children }: ButtonProps) {
  return (
    <button className={variant} disabled={disabled} onClick={onClick}>
      {children}
    </button>
  );
}
```

### Type Hooks Correctly

```typescript
// ✅ Typed useState
const [user, setUser] = useState<User | null>(null);

// ✅ Typed useReducer
type Action = { type: "SET_USER"; payload: User } | { type: "CLEAR_USER" };
const [state, dispatch] = useReducer(reducer, initialState);

// ✅ Typed useRef
const inputRef = useRef<HTMLInputElement>(null);
```

## Configuration Best Practices

### Recommended tsconfig.json

```jsonc
{
  "compilerOptions": {
    // Strictness — never compromise
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "useUnknownInCatchVariables": true,

    // Modules
    "module": "ESNext",
    "moduleResolution": "bundler",
    "esModuleInterop": true,
    "resolveJsonModule": true,
    "isolatedModules": true,

    // Emit
    "target": "ES2022",
    "lib": ["ES2022", "DOM", "DOM.Iterable"],
    "declaration": true,
    "declarationMap": true,

    // Path mapping
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    },

    // Quality
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```

## Code Quality Patterns

### Use Non-Null Assertion Sparingly

```typescript
// ❌ Non-null assertion — bypasses safety
const element = document.getElementById("app")!;
element.textContent = "Hello";

// ✅ Optional chaining — safe
const element = document.getElementById("app");
if (element) {
  element.textContent = "Hello";
}
```

### Use Exhaustiveness Checking

```typescript
type Shape = { kind: "circle"; radius: number } | { kind: "square"; side: number } | { kind: "rectangle"; width: number; height: number };

function area(shape: Shape): number {
  switch (shape.kind) {
    case "circle":
      return Math.PI * shape.radius ** 2;
    case "square":
      return shape.side ** 2;
    case "rectangle":
      return shape.width * shape.height;
    // ✅ Exhaustiveness check — error if new kind added
    default: {
      const _exhaustive: never = shape;
      return _exhaustive;
    }
  }
}
```

### Use Type Guards for Complex Logic

```typescript
// ✅ Type guard function
function isUser(obj: unknown): obj is User {
  return (
    typeof obj === "object" &&
    obj !== null &&
    "id" in obj &&
    "name" in obj &&
    "email" in obj
  );
}

// ✅ Narrowing with type guard
function process(obj: unknown) {
  if (isUser(obj)) {
    // TypeScript knows obj is User
    console.log(obj.name);
  }
}
```

## Anti-Patterns to Avoid

| Anti-Pattern | Problem | Alternative |
|--------------|---------|-------------|
| `any` type | Bypasses all type checking | Use `unknown` with narrowing |
| `as Type` assertions | Bypasses type safety | Use type guards |
| `// @ts-ignore` | Hides real errors | Fix the underlying issue |
| Empty interfaces | No type safety | Use type aliases or add properties |
| `any[]` arrays | Loses element type safety | Use `T[]` with proper generic |
| `Object` type | Too broad, no properties | Use specific interface/type |
| `this` without type | Ambiguous context | Explicit `this` parameter |
| Unchecked `switch` | Missing cases | Exhaustiveness with `never` |

## Key Takeaways

1. **Always use `strict: true`** — non-negotiable for type safety
2. **Prefer `unknown` over `any`** — forces proper handling
3. **Use literal types** — self-documenting, type-safe constraints
4. **Explicit return types** — improves readability and catches errors
5. **Type guards over assertions** — maintain type safety
6. **Exhaustiveness checking** — catch missing cases at compile time
7. **Separate type definitions** — cleaner architecture
8. **Avoid `as` and `@ts-ignore`** — fix the root cause instead
9. **Use generics with constraints** — balance flexibility and safety
10. **Configure tsconfig properly** — strictness is the foundation

---

## Decision Tree: TypeScript Type Selection

```mermaid
graph TD
    A[Need to define a type?]\n    A --> B{What type?}
    B -->|Object shape| C[interface]
    B -->|Union| D[| union]
    B -->|Intersection| E[& intersection]
    B -->|Literal| F[string literal]
    B -->|Function| G[() => T]
    B -->|Mapped| H[{[K in Keys]: T}]
    C --> I{Extension?}
    I -->|Yes| J[extends interface]
    I -->|No| K[Standalone]
    D --> L{Exhaustive?}
    L -->|Yes| M[never check]
    L -->|No| N[Simple union]
```

### When to Use Each TypeScript Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **interface** | Object shapes, extension | interface User |
| **type** | Unions, intersections, mapped | type Status = 'A' \| 'B' |
| **enum** | Named constants | enum Role { Admin, User } |
| **generic** | Reusable types | function identity<T>(arg: T) |
| **utility** | Type transformation | Partial<T>, Pick<T, K> |

---

## Procedural Guidance: TypeScript Setup

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

### Step 2: Define Types

```typescript
// types/user.ts
export interface User {
  id: string
  name: string
  email: string
  role: UserRole
  createdAt: Date
}

export enum UserRole {
  Admin = 'admin',
  User = 'user',
  Guest = 'guest',
}

export type CreateUserInput = Omit<User, 'id' | 'createdAt'>
export type UpdateUserInput = Partial<CreateUserInput>
```

### Step 3: Use Type Guards

```typescript
// utils/type-guards.ts
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

### Step 4: Add Exhaustiveness Checking

```typescript
type Status = 'pending' | 'approved' | 'rejected'

function handleStatus(status: Status) {
  switch (status) {
    case 'pending':
      return 'Waiting for review'
    case 'approved':
      return 'Approved'
    case 'rejected':
      return 'Rejected'
    default: {
      const _exhaustiveCheck: never = status
      return `Unknown status: ${_exhaustiveCheck}`
    }
  }
}
```

### Step 5: Test Types

```typescript
// types/user.test.ts
import { describe, it, expectTypeOf } from 'vitest'
import type { User, CreateUserInput } from './user'

describe('User types', () => {
  it('User should have required fields', () => {
    const user: User = {
      id: '1',
      name: 'John',
      email: 'john@example.com',
      role: 'admin',
      createdAt: new Date(),
    }
    expectTypeOf(user.id).toBeString()
    expectTypeOf(user.name).toBeString()
  })

  it('CreateUserInput should omit id and createdAt', () => {
    const input: CreateUserInput = {
      name: 'John',
      email: 'john@example.com',
      role: 'admin',
    }
    expectTypeOf(input).not.toHaveProperty('id')
    expectTypeOf(input).not.toHaveProperty('createdAt')
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Setting up TypeScript configuration
- Defining types and interfaces
- Implementing type guards
- Adding exhaustiveness checking
- Testing TypeScript types

### What to Do With This Information
1. **Enable strict mode**: Use full strict mode for all projects
2. **Separate types**: Keep type definitions in dedicated files
3. **Use type guards**: Validate at runtime with type predicates
4. **Exhaustiveness checking**: Catch missing cases with never
5. **Test types**: Use expectTypeOf to verify types

### Tools to Use
- **VS Code Extension**: TypeScript Hero — for TypeScript shortcuts
- **VS Code Extension**: Error Lens — for inline TypeScript error display
- **npm Package**: `vitest` — for type testing with expectTypeOf
- **Terminal Command**: `pnpm tsc --noEmit` — type check without emitting
- **Terminal Command**: `pnpm tsc --strict` — enable strict mode

### Agents to Invoke
- **Code Review Agent**: Run when reviewing PRs with TypeScript changes
- **Security Review Agent**: Run when adding new types

### Integration with Other Notes
- Read [[typescript-strict-mode]] for TypeScript strict mode configuration
- Read [[ts-fundamentals]] for TypeScript fundamentals
- Read [[ts-advanced-types]] for advanced TypeScript types
- Read [[ts-narrowing]] for type narrowing patterns
- Read [[ts-security-best-practices]] for TypeScript security best practices
- Read [[ts-optimization-performance]] for TypeScript optimization
- Read [[ts-tsconfig]] for tsconfig.json configuration

### Common Pitfalls
- Don't use any type (use unknown instead)
- Don't skip runtime validation (types don't replace validation)
- Don't ignore null checks (always check for null/undefined)
- Don't skip override checks (use noImplicitOverride)
- Don't use satisfies incorrectly (use for object validation)

### Quick Validation Checklist
- [ ] Is strict mode enabled?
- [ ] Are types separated into dedicated files?
- [ ] Are type guards used for runtime validation?
- [ ] Is exhaustiveness checking implemented?
- [ ] Are types tested?
- [ ] Is tsconfig configured properly?

---

## Integration with Other Notes

- Read [[typescript-strict-mode]] for TypeScript strict mode configuration
- Read [[ts-fundamentals]] for TypeScript fundamentals
- Read [[ts-advanced-types]] for advanced TypeScript types
- Read [[ts-narrowing]] for type narrowing patterns
- Read [[ts-security-best-practices]] for TypeScript security best practices
- Read [[ts-optimization-performance]] for TypeScript optimization
- Read [[ts-tsconfig]] for tsconfig.json configuration
