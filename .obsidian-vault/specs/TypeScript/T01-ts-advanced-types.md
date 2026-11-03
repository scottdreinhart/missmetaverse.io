---
slug: ts-advanced-types
sources:
  - https://www.typescriptlang.org/docs/handbook/2/types-from-types.html
  - https://www.typescriptlang.org/docs/handbook/2/conditional-types.html
date: 2026-11-02
tags:












  - typescript
  - generics
  - conditional-types
  - utility-types

# TypeScript Advanced Types


## Generics

```typescript
// Generic function
function identity<T>(arg: T): T {
  return arg;
}

// Generic type
interface Response<T> {
  data: T;
  status: number;
}

// Generic constraints
function loggingIdentity<T extends { length: number }>(arg: T): T {
  console.log(arg.length);
  return arg;
}
```

## Keyof Type Operator

```typescript
interface Person {
  name: string;
  age: number;
  location: string;
}

type PersonKeys = keyof Person; // "name" | "age" | "location"
```

## Typeof Type Operator

```typescript
// Gets the type of a value, usable in type position
import React from "react";
type FC = typeof React.FC;

// With functions
function squire(x: number) { return x * x; }
type SquireFunc = typeof squire; // (x: number) => number
```

## Indexed Access Types

```typescript
interface Person {
  name: string;
  age: number;
}

type Name = Person["name"]; // string
type Age = Person["age"];  // number

// Using variables
type K1 = keyof Person; // "name" | "age" | "location"
type K2 = K1 & "name";  // "name"
type K3 = K1 | "job";   // "name" | "age" | "location" | "job"
```

## Conditional Types

```typescript
// Syntax: T extends U ? X : Y
type IsString<T> = T extends string ? true : false;

type Example1 = Dog extends Animal ? number : string; // number
type Example2 = RegExp extends Animal ? number : string; // string

// With generics
type MessageOf<T> = T extends { message: unknown } ? T["message"] : never;

interface Email { message: string; }
interface Dog { bark(): void; }

type EmailMessageContents = MessageOf<Email>; // string
type DogMessageContents = MessageOf<Dog>;     // never
```

### Inferring Within Conditional Types

```typescript
// Extract array element type
type Flatten<Type> = Type extends Array<infer Item> ? Item : Type;

type Str = Flatten<string[]>;  // string
type Num = Flatten<number>;    // number

// Extract return type
type GetReturnType<Type> = Type extends (...args: never[]) => infer Return
  ? Return
  : never;

type Num = GetReturnType<() => number>;        // number
type Str = GetReturnType<(x: string) => string>; // string
type Bools = GetReturnType<(a: boolean, b: boolean) => boolean[]>; // boolean[]
```

### Distributive Conditional Types

```typescript
// Distributes over union types
type ToArray<Type> = Type extends any ? Type[] : never;

type StrArrOrNumArr = ToArray<string | number>;
// Result: string[] | number[]

// Non-distributive (wrap in brackets)
type ToArrayNonDist<Type> = [Type] extends [any] ? Type[] : never;

type ArrOfStrOrNum = ToArrayNonDist<string | number>;
// Result: (string | number)[]
```

## Mapped Types

```typescript
// Make all properties optional
type Optional<T> = {
  [P in keyof T]?: T[P];
};

// Make all properties readonly
type Readonly<T> = {
  readonly [P in keyof T]: T[P];
};

// Remove properties
type Exclude<T, U> = T extends U ? never : T;
type Pick<T, K extends keyof T> = {
  [P in K]: T[P];
};

// Add prefix to keys
type PrefixKeys<T, Prefix extends string> = {
  [K in `${Prefix}${keyof T & string}`]: T[K extends keyof T ? K : never];
};
```

## Template Literal Types

```typescript
// String literal transformations
type World = "world";
type Greeting = `hello ${World}`; // "hello world"

// Union expansion
type Verb = "eat" | "drink";
type Action = `${Verb} ${World}`; // "eat world" | "drink world"

// Utility: capitalize
type Capitalize<S extends string> = S extends `${infer First}${infer Rest}`
  ? `${Uppercase<First>}${Rest}`
  : S;

// Utility: camelCase
type CamelCase<S extends string> = S extends `${infer First}_${infer Rest}`
  ? `${First}${Capitalize<CamelCase<Rest>>}`
  : S;
```

## Utility Types (Built-in)

| Type | Description |
|------|-------------|
| `Partial<T>` | All properties optional |
| `Required<T>` | All properties required |
| `Readonly<T>` | All properties readonly |
| `Pick<T, K>` | Pick subset of properties |
| `Omit<T, K>` | Omit subset of properties |
| `Record<K, T>` | Object with keys K and values T |
| `Exclude<T, U>` | Exclude types from union |
| `Extract<T, U>` | Extract types from union |
| `NonNullable<T>` | Remove null/undefined |
| `Parameters<T>` | Parameters of function type |
| `ReturnType<T>` | Return type of function type |
| `InstanceType<T>` | Instance type of constructor |
| `ThisParameterType<T>` | Type of `this` parameter |
| `OmitThisParameter<T>` | Remove `this` parameter |
| `Awaited<T>` | Awaited type (like `await` expression) |

## Type Assertions vs Type Guards

| Feature | Type Assertion | Type Guard |
|---------|---------------|------------|
| Syntax | `as Type` or `<Type>` | `x is Type` function |
| Runtime check | ❌ No | ✅ Yes |
| Compiler trust | You assert, compiler trusts | Compiler verifies logic |
| Safety | Can lie to compiler | Safe |
| Use case | Known at runtime, compiler can't see | Filter/branch based on type |

---

## Decision Tree: Advanced Type Selection

```mermaid
graph TD
    A[Need to define type?]\n    A --> B{Generic?}\n    B -->|Yes| C[Generic type]\n    B -->|No| D{Conditional?}\n    D -->|Yes| E[Conditional type]\n    D -->|No| F{Mapped?}\n    F -->|Yes| G[Mapped type]\n    F -->|No| H{Template literal?}\n    H -->|Yes| I[Template literal type]\n    H -->|No| J[Utility type]\n    C --> K[T extends constraint]\n    E --> L[T extends U ? X : Y]\n    G --> M[{[P in keyof T]: T[P]}}\n    I --> N[`${Prefix}${keyof T}`]\n```\n\n### Type Selection Guide\n\n| Type Feature | When to Use | Example |\n|--------------|-------------|---------|\n| **Generics** | Reusable types/functions | `identity<T>(arg: T): T` |\n| **Conditional** | Type depends on condition | `T extends string ? true : false` |\n| **Mapped** | Transform all properties | `Partial<T>`, `Readonly<T>` |\n| **Template Literal** | String literal types | `On${Capitalize<string>}` |\n| **Utility** | Common transformations | `Pick<T, K>`, `Omit<T, K>` |\n\n---

## Procedural Guidance: Advanced Type Implementation

### Step 1: Create Generic Types

```typescript
// types/generic-response.ts
export interface ApiResponse<T> {
  data: T
  status: number
  message: string
}

export async function fetchApi<T>(url: string): Promise<ApiResponse<T>> {
  const response = await fetch(url)
  const data = await response.json()
  return {
    data: data as T,
    status: response.status,
    message: response.statusText,
  }
}

// Usage:
// interface User { id: string; name: string; }
// const result = await fetchApi<User>('/api/users/1')
// console.log(result.data.name) // Type-safe!
```

### Step 2: Create Conditional Types

```typescript
// types/conditional-types.ts

// Extract array element type
export type Flatten<T> = T extends Array<infer Item> ? Item : T

type Str = Flatten<string[]> // string
type Num = Flatten<number> // number

// Extract return type
export type GetReturnType<T> = T extends (...args: never[]) => infer R ? R : never

type Num = GetReturnType<() => number> // number
type Str = GetReturnType<(x: string) => string> // string

// Extract parameter type
export type GetParameterType<T> = T extends (arg: infer A, ...args: never[]) => any ? A : never

type Param = GetParameterType<(x: string, y: number) => void> // string
```

### Step 3: Create Mapped Types

```typescript
// types/mapped-types.ts

// Make all properties optional
export type Optional<T> = {
  [P in keyof T]?: T[P]
}

// Make all properties readonly
export type Readonly<T> = {
  readonly [P in keyof T]: T[P]
}

// Make all properties required
export type Required<T> = {
  [P in keyof T]-?: T[P]
}

// Remove properties
export type Exclude<T, U> = T extends U ? never : U

// Pick properties
export type Pick<T, K extends keyof T> = {
  [P in K]: T[P]
}

// Omit properties
export type Omit<T, K extends keyof T> = Pick<T, Exclude<keyof T, K>>

// Usage:
// interface User { id: string; name: string; email: string; }
// type UserOptional = Optional<User> // { id?: string; name?: string; email?: string; }
// type UserReadOnly = Readonly<User> // { readonly id: string; readonly name: string; readonly email: string; }
// type UserWithoutEmail = Omit<User, 'email'> // { id: string; name: string; }
```

### Step 4: Create Template Literal Types

```typescript
// types/template-literal-types.ts

// Capitalize first letter
export type Capitalize<S extends string> = S extends `${infer First}${infer Rest}`
  ? `${Uppercase<First>}${Rest}`
  : S

type Hello = Capitalize<'hello'> // 'Hello'

// Create event types
export type OnEvent<E extends string> = `on${Capitalize<E>}`

type OnClick = OnEvent<'click'> // 'onClick'
type OnChange = OnEvent<'change'> // 'onChange'

// Create route types
export type Route<P extends string> = `/${P}`

type UserRoute = Route<'users'> // '/users'
type UserDetailRoute = Route<'users/:id'> // '/users/:id'
```

### Step 5: Create Type Guards

```typescript
// types/type-guards.ts

// Type guard function
export function isUser(obj: unknown): obj is { id: string; name: string } {
  return (
    typeof obj === 'object' &&
    obj !== null &&
    'id' in obj &&
    'name' in obj &&
    typeof (obj as any).id === 'string' &&
    typeof (obj as any).name === 'string'
  )
}

// Usage:
// function processUser(obj: unknown) {
//   if (isUser(obj)) {
//     console.log(obj.id) // Type-safe!
//     console.log(obj.name) // Type-safe!
//   } else {
//     console.log('Not a user')
//   }
// }
```

---

## Copilot Instructions

### When to Read This Note
- Creating generic types
- Implementing conditional types
- Building mapped types
- Using template literal types
- Creating type guards

### What to Do With This Information
1. **Use generics**: For reusable types and functions
2. **Use conditional types**: For type-dependent logic
3. **Use mapped types**: For property transformations
4. **Use template literals**: For string literal types
5. **Use type guards**: For safe type narrowing

### Tools to Use
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `typescript` — for type checking
- **npm Package**: `zod` — for runtime validation
- **Terminal Command**: `tsc --noEmit` — check types
- **Terminal Command**: `pnpm test` — run tests

### Agents to Invoke
- **Code Review Agent**: Run when reviewing complex types
- **TypeScript Agent**: Run when debugging type errors

### Integration with Other Notes
- read [[typescript-strict-mode]] for strict mode configuration
- read [[ts-narrowing]] for type narrowing techniques
- read [[ts-security-best-practices]] for type security

### Common Pitfalls
- Don't use type assertions when type guards will work
- Don't overuse generics (keep types simple)
- Don't forget distributive conditional types
- Don't mix up mapped and conditional types
- Don't skip runtime validation (types are compile-time only)

### Quick Validation Checklist
- [ ] Are generics used appropriately?
- [ ] Are conditional types non-distributive when needed?
- [ ] Are mapped types correctly scoped?
- [ ] Are template literal types constrained?
- [ ] Are type guards used for runtime checks?
- [ ] Are types documented?



## See Also
- [[T02-ts-best-practices]]
- [[T03-ts-decorators]]
- [[T04-ts-fundamentals]]
- [[T05-ts-narrowing]]
- [[T06-ts-optimization-performance]]


