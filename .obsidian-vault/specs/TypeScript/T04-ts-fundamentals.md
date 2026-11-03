---
slug: ts-fundamentals
sources:
  - https://www.typescriptlang.org/docs/handbook/2/basic-types.html
  - https://www.typescriptlang.org/docs/handbook/2/everyday-types.html
date: 2026-11-02
tags:

  - maturity/deprecated









  - typescript
  - types
  - interfaces
  - basics

# TypeScript Fundamentals — Types & Interfaces


## Static Type Checking

TypeScript is a **static type checker** that predicts what code will do *before* it runs. It catches bugs that dynamic JavaScript would only reveal at runtime.

### Key Benefits
- **Bug prevention**: Catches typos, uncallable values, missing properties before runtime
- **Tooling**: Powers IDE features — autocomplete, go-to-definition, refactoring
- **Documentation**: Types serve as living documentation for code shape

### `tsc` — The TypeScript Compiler
- Compiles `.ts` → `.js` (erasing type annotations)
- Type annotations are **erased** at compile time — they don't affect runtime behavior
- Can emit with errors (`tsc hello.ts`) or block emission (`tsc --noEmitOnError hello.ts`)
- Supports **downleveling**: transpiling newer JS to older targets (ES6 → ES5)

## Primitives

| Type | Example | Description |
|------|---------|-------------|
| `string` | `"Hello"` | Text values |
| `number` | `42` | All numbers (no int/float distinction) |
| `boolean` | `true` / `false` | Boolean values (alias for `true \| false`) |
| `bigint` | `100n` | Very large integers (ES2020+) |
| `symbol` | `Symbol("name")` | Unique identifiers |
| `undefined` | `undefined` | Uninitialized values |
| `null` | `null` | Absent value |

> **Note:** `String`, `Number`, `Boolean` (capitalized) refer to special built-in wrapper objects — avoid them. Use lowercase `string`, `number`, `boolean`.

## Arrays

```typescript
// Array<T> syntax
let numbers: number[] = [1, 2, 3];
let strings: Array<string> = ["a", "b"];
```

## `any` — The Escape Hatch

```typescript
let obj: any = { x: 0 };
obj.foo();    // OK — no type checking
obj();        // OK
obj = "hello";// OK
```

- Disables all further type checking
- Use `noImplicitAny` flag to flag implicit `any` as errors
- Prefer `unknown` when you truly don't know the type

## Type Annotations

```typescript
// Variable annotations (go AFTER the variable name)
let myName: string = "Alice";

// Function parameter annotations
function greet(name: string): string {
  return "Hello, " + name.toUpperCase();
}

// Return type annotations (usually inferred)
function getFavoriteNumber(): number {
  return 26;
}

// Async functions use Promise<T>
async function getFavoriteNumber(): Promise<number> {
  return 26;
}
```

> **Rule of thumb:** Use fewer type annotations than you think — TypeScript infers most types automatically.

## Object Types

```typescript
function printCoord(pt: { x: number; y: number }) {
  console.log(pt.x);
  console.log(pt.y);
}

// Optional properties with ?
function printName(obj: { first: string; last?: string }) {
  if (obj.last !== undefined) {
    console.log(obj.last.toUpperCase());
  }
  // Modern alternative:
  console.log(obj.last?.toUpperCase());
}
```

## Union Types

```typescript
// Values that may be any one of the members
function printId(id: number | string) {
  console.log("Your ID is: " + id);
}

// Narrowing with typeof
function printId(id: number | string) {
  if (typeof id === "string") {
    console.log(id.toUpperCase()); // id is string here
  } else {
    console.log(id); // id is number here
  }
}

// Narrowing with Array.isArray
function welcomePeople(x: string[] | string) {
  if (Array.isArray(x)) {
    console.log("Hello, " + x.join(" and "));
  } else {
    console.log("Welcome lone traveler " + x);
  }
}
```

## Type Aliases

```typescript
type Point = { x: number; y: number };
type ID = number | string;
type Primitive = string | number | boolean | bigint | symbol | undefined | null;
```

- Names for **any** type (not just objects)
- Not distinct — aliases are exactly as if you wrote the aliased type
- Cannot be re-opened (unlike interfaces)

## Interfaces

```typescript
interface Point {
  x: number;
  y: number;
}

// Interfaces are extendable
interface Animal { name: string; }
interface Bear extends Animal { honey: boolean; }

// Interfaces can be re-opened (declaration merging)
interface Window { title: string; }
interface Window { ts: TypeScriptAPI; }
```

### Interface vs Type

| Feature | Interface | Type |
|---------|-----------|------|
| Extending | `extends` | Intersection `&` |
| Re-opening | ✅ Yes | ❌ No |
| Union/Intersection | ❌ No | ✅ Yes |
| Primitive aliases | ❌ No | ✅ Yes |
| Error messages | Shows interface name | May show inline type |
| Performance | Often faster for `extends` | — |

> **Heuristic:** Use `interface` until you need features from `type`.

## Type Assertions

```typescript
// "as" syntax (preferred, works in .tsx)
const myCanvas = document.getElementById("main_canvas") as HTMLCanvasElement;

// Angle-bracket syntax (NOT in .tsx files)
const myCanvas = <HTMLCanvasElement>document.getElementById("main_canvas");

// Two-step assertion for impossible coercions
const a = expr as any as T;
```

> **Warning:** Type assertions don't change runtime behavior. No exception if wrong.

## Literal Types

```typescript
// Specific string/number values as types
function printText(s: string, alignment: "left" | "right" | "center") { }
function compare(a: string, b: string): -1 | 0 | 1 {
  return a === b ? 0 : a > b ? 1 : -1;
}

// as const — makes all properties literal
const req = { url: "https://example.com", method: "GET" } as const;
// req.method has type "GET", not string
```

## Null & Undefined

```typescript
// With strictNullChecks: true (recommended)
function doSomething(x: string | null) {
  if (x === null) {
    // do nothing
  } else {
    console.log("Hello, " + x.toUpperCase()); // x is string here
  }
}

// Non-null assertion operator (!) — use with caution
function liveDangerously(x?: number | null) {
  console.log(x!.toFixed()); // asserts x is not null/undefined
}
```

## Enums

```typescript
enum Direction { Up, Down, Left, Right }
// Up = 0, Down = 1, Left = 2, Right = 3

enum Color { Red, Orange, Yellow, Green, Blue, Violet }
// Each member has its own literal type (TypeScript 5.0+)
// Can be narrowed: c is Color.Red | Color.Green | Color.Blue
```

> **Note:** Enums are a runtime feature (not just type-level). TypeScript 5.0 made all enums union enums with literal member types.

## Key Compiler Flags

| Flag | Purpose |
|------|---------|
| `strict` | Enables all strict type-checking options |
| `noImplicitAny` | Error on implicit `any` |
| `strictNullChecks` | `null`/`undefined` are distinct types |
| `strictFunctionTypes` | Correct function parameter checking |
| `strictPropertyInitialization` | Class properties must be initialized |
| `useUnknownInCatchVariables` | Catch variables are `unknown` by default |




---



## See Also
- [[T01-ts-advanced-types]]
- [[T02-ts-best-practices]]
- [[T03-ts-decorators]]
- [[T05-ts-narrowing]]
- [[T06-ts-optimization-performance]]


