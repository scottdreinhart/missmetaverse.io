# TypeScript Narrowing & Type Guards

> Slug: `ts-narrowing`
> Source: [[https://www.typescriptlang.org/docs/handbook/2/narrowing.html|TypeScript Handbook: Narrowing]]
> Date: 2026-11-02

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
