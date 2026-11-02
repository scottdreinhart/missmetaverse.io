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

