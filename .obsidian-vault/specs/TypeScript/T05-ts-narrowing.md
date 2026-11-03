---
slug: TypeScript/type-inference
sources:
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
date: 2026-11-02
tags:











  - typescript
  - narrowing
  - type-guards
  - discriminated-unions
# TypeScript Narrowing & Type Guards


## What is Narrowing?

Narrowing is the process by which TypeScript refines a type to a more specific type within a code block, based on runtime checks and control flow analysis.

## typeof Type Guards

```typescript
function printAll(strs: string | string[] | null) {
  if (typeof strs === "object") {
    for (const s of strs) { // strs: string[] (but still possibly null!)
      console.log(s);
    }
  } else if (typeof strs === "string") {
    console.log(strs);
  }
}
```

> **Note:** `typeof null === "object"` is a JavaScript quirk TypeScript accounts for.

## Truthiness Narrowing

```typescript
function getUsersOnlineMessage(numUsersOnline: number) {
  if (numUsersOnline) {
    return `There are ${numUsersOnline} online now!`;
  }
  return "Nobody's here. :(";
}

// Values that coerce to false: 0, NaN, "", 0n, null, undefined
// Double negation gives literal true
!!"world"; // type: true, value: true
```

> **Warning:** Truthiness on primitives can be error-prone (e.g., empty string `""` is falsy).

## Equality Narrowing

```typescript
function example(x: string | number, y: string | boolean) {
  if (x === y) {
    // Both are string here (only common type)
    x.toUpperCase();
    y.toLowerCase();
  }
}

// Checking against specific literals
function printAll(strs: string | string[] | null) {
  if (strs !== null) {
    if (typeof strs === "object") {
      for (const s of strs) { // strs: string[]
        console.log(s);
      }
    }
  }
}

// == null checks both null AND undefined
interface Container { value: number | null | undefined; }
function multiplyValue(container: Container, factor: number) {
  if (container.value != null) {
    container.value *= factor; // value: number
  }
}
```

## `in` Operator Narrowing

```typescript
type Fish = { swim: () => void };
type Bird = { fly: () => void };

function move(animal: Fish | Bird) {
  if ("swim" in animal) {
    animal.swim(); // animal: Fish
  } else {
    animal.fly();  // animal: Bird
  }
}
```

## `instanceof` Narrowing

```typescript
function logValue(x: Date | string) {
  if (x instanceof Date) {
    console.log(x.toUTCString()); // x: Date
  } else {
    console.log(x.toUpperCase()); // x: string
  }
}
```

## Type Predicates

```typescript
interface Fish { swim: () => void; }
interface Bird { fly: () => void; }

function isFish(pet: Fish | Bird): pet is Fish {
  return (pet as Fish).swim !== undefined;
}

// Usage
let pet = getSmallPet();
if (isFish(pet)) {
  pet.swim();
} else {
  pet.fly();
}

// Filter arrays
const zoo: (Fish | Bird)[] = [getSmallPet(), getSmallPet()];
const underWater: Fish[] = zoo.filter(isFish);
```

## Discriminated Unions

```typescript
interface Circle {
  kind: "circle";
  radius: number;
}

interface Square {
  kind: "square";
  sideLength: number;
}

type Shape = Circle | Square;

function getArea(shape: Shape) {
  switch (shape.kind) {
    case "circle":
      return Math.PI * shape.radius ** 2; // shape: Circle
    case "square":
      return shape.sideLength ** 2;       // shape: Square
  }
}
```

> **Key:** Every member must have a common property with literal types (the **discriminant**).

## Exhaustiveness Checking with `never`

```typescript
type Shape = Circle | Square;

function getArea(shape: Shape) {
  switch (shape.kind) {
    case "circle":
      return Math.PI * shape.radius ** 2;
    case "square":
      return shape.sideLength ** 2;
    default: {
      const _exhaustiveCheck: never = shape;
      return _exhaustiveCheck; // Error if Shape gains a new member
    }
  }
}
```

> The `never` type is assignable to every type but nothing is assignable to `never` (except `never` itself). This catches missing cases when new union members are added.

## Control Flow Analysis

TypeScript tracks types through code paths, re-narrowing at each branch:

```typescript
function example() {
  let x: string | number | boolean;

  x = Math.random() < 0.5;
  console.log(x); // x: boolean

  if (Math.random() < 0.5) {
    x = "hello";
    console.log(x); // x: string
  } else {
    x = 100;
    console.log(x); // x: number
  }

  return x; // x: string | number
}
```

## Assignments Narrow Types

```typescript
let x = Math.random() < 0.5 ? 10 : "hello world!";
// x: string | number

x = 1;
console.log(x); // x: number (narrowed by assignment)

x = "goodbye!";
console.log(x); // x: string (narrowed by assignment)
```

---

## Decision Tree: Type Narrowing

```mermaid
graph TD
    A[Need to narrow type?]\n    A --> B{Simple type?}\n    B -->|Yes| C[typeof check]\n    B -->|No| D{Has property?}\n    D -->|Yes| E[in operator]\n    D -->|No| F{Class instance?}\n    F -->|Yes| G[instanceof]\n    F -->|No| H{Discriminant?}\n    H -->|Yes| I[switch on discriminant]\n    H -->|No| J[Type predicate function]\n    C --> K[typeof x === 'string']\n    E --> L['prop' in obj]\n    G --> M[x instanceof Date]\n    I --> N[switch shape.kind]\n    J --> O[function isX(x): x is X]\n```\n\n### Narrowing Method Selection\n\n| Method | When to Use | Example |\n|--------|-------------|---------|\n| **typeof** | Primitive types | `typeof x === 'string'` |\n| **in** | Object properties | `'swim' in animal` |\n| **instanceof** | Class instances | `x instanceof Date` |\n| **switch** | Discriminated unions | `switch(shape.kind)` |\n| **Type predicate** | Custom narrowing | `function isFish(x): x is Fish` |\n| **Truthiness** | Nullable checks | `if (x)` |\n\n---

## Procedural Guidance: Type Narrowing Implementation

### Step 1: Use typeof Checks

```typescript
// narrowing/typeof-checks.ts

// Check primitive types
function printValue(value: string | number | boolean): void {
  if (typeof value === 'string') {
    console.log(value.toUpperCase()) // value: string
  } else if (typeof value === 'number') {
    console.log(value.toFixed(2)) // value: number
  } else if (typeof value === 'boolean') {
    console.log(value ? 'yes' : 'no') // value: boolean
  }
}

// Check for null/undefined
function processValue(value: string | null | undefined): string {
  if (value != null) {
    // value: string (both null and undefined excluded)
    return value.toUpperCase()
  }
  return 'N/A'
}

// Check for objects (avoid typeof null pitfall)
function processObject(obj: object | null): string {
  if (typeof obj === 'object' && obj !== null) {
    return JSON.stringify(obj)
  }
  return 'Not an object'
}
```

### Step 2: Use in Operator

```typescript
// narrowing/in-operator.ts

interface Fish {
  swim: () => void
  name: string
}

interface Bird {
  fly: () => void
  name: string
}

function move(animal: Fish | Bird): void {
  if ('swim' in animal) {
    animal.swim() // animal: Fish
    console.log(`${animal.name} is swimming`)
  } else {
    animal.fly() // animal: Bird
    console.log(`${animal.name} is flying`)
  }
}

// Check multiple properties
interface User {
  id: string
  name: string
  email?: string
}

interface Admin {
  id: string
  name: string
  role: 'admin'
  permissions: string[]
}

function processUser(user: User | Admin): void {
  if ('permissions' in user) {
    console.log(`Admin ${user.name} has ${user.permissions.length} permissions`)
    // user: Admin
  } else {
    console.log(`User ${user.name}`)
    // user: User
  }
}
```

### Step 3: Use instanceof

```typescript
// narrowing/instanceof.ts

function logValue(value: Date | string): void {
  if (value instanceof Date) {
    console.log(value.toUTCString()) // value: Date
  } else {
    console.log(value.toUpperCase()) // value: string
  }
}

// Custom class hierarchy
class Animal {
  constructor(public name: string) {}
}

class Dog extends Animal {
  constructor(name: string, public breed: string) {
    super(name)
  }

  bark(): void {
    console.log('Woof!')
  }
}

class Cat extends Animal {
  constructor(name: string, public indoor: boolean) {
    super(name)
  }

  meow(): void {
    console.log('Meow!')
  }
}

function makeSound(animal: Dog | Cat): void {
  if (animal instanceof Dog) {
    animal.bark() // animal: Dog
    console.log(`Breed: ${animal.breed}`)
  } else {
    animal.meow() // animal: Cat
    console.log(`Indoor: ${animal.indoor}`)
  }
}
```

### Step 4: Use Discriminated Unions

```typescript
// narrowing/discriminated-unions.ts

interface Circle {
  kind: 'circle'
  radius: number
}

interface Square {
  kind: 'square'
  sideLength: number
}

interface Rectangle {
  kind: 'rectangle'
  width: number
  height: number
}

type Shape = Circle | Square | Rectangle

function getArea(shape: Shape): number {
  switch (shape.kind) {
    case 'circle':
      return Math.PI * shape.radius ** 2 // shape: Circle
    case 'square':
      return shape.sideLength ** 2 // shape: Square
    case 'rectangle':
      return shape.width * shape.height // shape: Rectangle
    default: {
      const _exhaustiveCheck: never = shape
      throw new Error(`Unhandled shape: ${_exhaustiveCheck}`)
    }
  }
}

// Usage with API responses
interface SuccessResponse<T> {
  status: 'success'
  data: T
}

interface ErrorResponse {
  status: 'error'
  message: string
  code: number
}

type ApiResponse<T> = SuccessResponse<T> | ErrorResponse

function handleResponse<T>(response: ApiResponse<T>): T | never {
  if (response.status === 'success') {
    return response.data // response: SuccessResponse<T>
  } else {
    throw new Error(`API Error ${response.code}: ${response.message}`)
    // response: ErrorResponse
  }
}
```

### Step 5: Use Type Predicates

```typescript
// narrowing/type-predicates.ts

interface Fish {
  swim: () => void
  name: string
}

interface Bird {
  fly: () => void
  name: string
}

// Type predicate function
function isFish(pet: Fish | Bird): pet is Fish {
  return (pet as Fish).swim !== undefined
}

// Usage
function movePet(pet: Fish | Bird): void {
  if (isFish(pet)) {
    pet.swim() // pet: Fish
  } else {
    pet.fly() // pet: Bird
  }
}

// Filter arrays with type predicates
const zoo: (Fish | Bird)[] = [
  { name: 'Nemo', swim: () => console.log('Swimming') },
  { name: 'Tweety', fly: () => console.log('Flying') },
]

const fishOnly: Fish[] = zoo.filter(isFish) // fishOnly: Fish[]
const birdOnly: Bird[] = zoo.filter((pet): pet is Bird => !isFish(pet))

// Custom type predicate for validation
function isValidUser(obj: unknown): obj is { id: string; name: string; email: string } {
  return (
    typeof obj === 'object' &&
    obj !== null &&
    'id' in obj &&
    'name' in obj &&
    'email' in obj &&
    typeof (obj as any).id === 'string' &&
    typeof (obj as any).name === 'string' &&
    typeof (obj as any).email === 'string'
  )
}
```

### Step 6: Use Control Flow Analysis

```typescript
// narrowing/control-flow.ts

function processValue(value: string | number | boolean): void {
  // Initial type: string | number | boolean
  console.log(value) // value: string | number | boolean

  if (typeof value === 'string') {
    // Narrowed to: string
    console.log(value.toUpperCase())
  } else if (typeof value === 'number') {
    // Narrowed to: number
    console.log(value.toFixed(2))
  } else {
    // Narrowed to: boolean
    console.log(value ? 'yes' : 'no')
  }
}

// Re-narrowing with assignment
function example(): string | number {
  let x: string | number | boolean

  x = Math.random() < 0.5
  console.log(x) // x: boolean

  if (Math.random() < 0.5) {
    x = 'hello'
    console.log(x) // x: string
  } else {
    x = 100
    console.log(x) // x: number
  }

  return x // x: string | number
}
```

---

## Copilot Instructions

### When to Read This Note
- Narrowing union types
- Implementing type guards
- Using discriminated unions
- Validating object shapes
- Filtering arrays by type

### What to Do With This Information
1. **Use typeof**: For primitive type checks
2. **Use in**: For property existence checks
3. **Use instanceof**: For class instance checks
4. **Use switch**: For discriminated unions
5. **Use type predicates**: For custom narrowing

### Tools to Use
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `zod` â€” for runtime validation
- **npm Package**: `typescript` â€” for type checking
- **Terminal Command**: `tsc --noEmit` â€” check types
- **Terminal Command**: `pnpm test` â€” run tests

### Agents to Invoke
- **Code Review Agent**: Run when reviewing type guards
- **TypeScript Agent**: Run when debugging type errors

### Integration with Other Notes
- read [[typescript-strict-mode]] for strict mode configuration
- read [[TypeScript/generics]] for advanced type patterns
- read [[ts-Security/web-security]] for type security

### Common Pitfalls
- Don't forget typeof null === 'object' quirk
- Don't skip exhaustiveness checks (use never)
- Don't use type assertions instead of guards
- Don't forget to handle all union cases
- Don't mix up narrowing and type assertions

### Quick Validation Checklist
- [ ] Are all union cases handled?
- [ ] Is exhaustiveness checking used?
- [ ] Are type predicates typed correctly?
- [ ] Are instanceof checks safe?
- [ ] Are in checks specific enough?
- [ ] Is control flow analyzed correctly?



## See Also
- [[T01-TypeScript/generics]]
- [[T02-TypeScript/typescript-strict-mode]]
- [[T03-ts-decorators]]
- [[T04-TypeScript/typescript-strict-mode]]
- [[T06-TypeScript/typescript-strict-mode]]


