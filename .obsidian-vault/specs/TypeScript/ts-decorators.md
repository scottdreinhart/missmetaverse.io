# TypeScript Decorators

> Slug: `ts-decorators`
> Source: [[https://www.typescriptlang.org/docs/handbook/decorators.html|TypeScript Handbook: Decorators]] | [[https://www.typescriptlang.org/docs/handbook/release-notes/typescript-5-0.html#decorators|TypeScript 5.0: Decorators]]
> Date: 2026-11-02

## Overview

Decorators are a special kind of declaration that can annotate or modify classes, methods, accessors, properties, and parameters. They use the form `@expression`.

## Two Decorator Flavors

| Feature | Legacy (`--experimentalDecorators`) | Standard (TS 5.0+) |
|---------|-------------------------------------|---------------------|
| Enable | Requires `--experimentalDecorators` | Enabled by default |
| Parameter decorators | ✅ Supported | ❌ Not supported |
| `--emitDecoratorMetadata` | ✅ Supported | ❌ Not compatible |
| Type checking | Limited | Full type checking |
| Emit | Different transformation | Different transformation |
| Standard status | Experimental | TC39 Stage 3 |

> **Note:** Decorator functions written for legacy mode are unlikely to work with standard mode without changes.

## Decorator Kinds

### Class Decorators

```typescript
function sealed(constructor: Function) {
  Object.seal(constructor);
  Object.seal(constructor.prototype);
}

@sealed
class BugReport {
  type = "report";
  title: string;

  constructor(t: string) {
    this.title = t;
  }
}
```

- Applied to the class constructor
- Can observe, modify, or replace the class definition
- If a value is returned, it replaces the class declaration

### Method Decorators

```typescript
function enumerable(value: boolean) {
  return function (target: any, propertyKey: string, descriptor: PropertyDescriptor) {
    descriptor.enumerable = value;
  };
}

class Greeter {
  greeting: string;

  @enumerable(false)
  greet() {
    return "Hello, " + this.greeting;
  }
}
```

- Arguments: `(target, propertyKey, descriptor)`
- Can modify the property descriptor
- Return value becomes the new descriptor

### Accessor Decorators

```typescript
function configurable(value: boolean) {
  return function (target: any, propertyKey: string, descriptor: PropertyDescriptor) {
    descriptor.configurable = value;
  };
}

class Point {
  private _x: number;

  @configurable(false)
  get x() { return this._x; }
}
```

- Applied to getter/setter pairs (decorate the first one)
- Same arguments as method decorators

### Property Decorators

```typescript
const formatMetadataKey = Symbol("format");

function format(formatString: string) {
  return function (target: any, propertyKey: string) {
    Reflect.defineMetadata(formatMetadataKey, formatString, target, propertyKey);
  };
}

class Greeter {
  @format("Hello, %s")
  greeting: string;
}
```

- Arguments: `(target, propertyKey)`
- Cannot modify the property — only observe it
- Commonly used with `reflect-metadata` for metadata

### Parameter Decorators (Legacy Only)

```typescript
function required(target: Object, propertyKey: string | symbol, parameterIndex: number) {
  // Mark parameter as required
}

class BugReport {
  print(@required verbose: boolean) {
    if (verbose) {
      return `type: ${this.type}\ntitle: ${this.title}`;
    }
    return this.title;
  }
}
```

- Arguments: `(target, propertyKey, parameterIndex)`
- Only available with `--experimentalDecorators`

## Decorator Factories

```typescript
function color(value: string) {
  return function (target: any) {
    // Decorator setup with 'value'
  };
}

// Usage
@classDecorator("myColor")
class MyClass { }
```

A decorator factory is a function that returns the decorator function.

## Decorator Composition

```typescript
class ExampleClass {
  @first()
  @second()
  method() {}
}
```

- Evaluates top-to-bottom, called bottom-to-top
- `first(): factory evaluated`
- `second(): factory evaluated`
- `second(): called`
- `first(): called`

## Well-Typed Decorators (TS 5.0+)

```typescript
function loggedMethod<This, Args extends any[], Return>(
  target: (this: This, ...args: Args) => Return,
  context: ClassMethodDecoratorContext<This, (this: This, ...args: Args) => Return>
) {
  const methodName = String(context.name);

  function replacementMethod(this: This, ...args: Args): Return {
    console.log(`LOG: Entering method '${methodName}'.`);
    const result = target.call(this, ...args);
    console.log(`LOG: Exiting method '${methodName}'.`);
    return result;
  }
  return replacementMethod;
}

class Person {
  name: string;
  constructor(name: string) { this.name = name; }

  @loggedMethod
  greet() {
    console.log(`Hello, my name is ${this.name}.`);
  }
}
```

## Decorator Context Object

The context parameter provides metadata about the decorated member:

| Property | Type | Description |
|----------|------|-------------|
| `name` | `string \| symbol` | Member name |
| `kind` | `"method" \| "getter" \| "setter" \| "accessor" \| "field"` | Member kind |
| `static` | `boolean` | Whether static |
| `private` | `boolean` | Whether private |
| `accessibility` | `"public" \| "protected" \| "private"` | Member accessibility |
| `addInitializer` | `Function` | Hook into constructor/class init |

## Decorator Evaluation Order

1. Parameter decorators → Method/Accessor/Property decorators (for each instance member)
2. Parameter decorators → Method/Accessor/Property decorators (for each static member)
3. Parameter decorators (for constructor)
4. Class decorators (for the class)

## Metadata (Legacy)

```typescript
// Requires: npm i reflect-metadata --save
// Requires: --emitDecoratorMetadata

import "reflect-metadata";

function LogMethod(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
  // With emitDecoratorMetadata, TypeScript injects:
  // __metadata("design:type", Function)
  // __metadata("design:paramtypes", [Number])
  // __metadata("design:returntype", void)
}
```

## Key Compiler Options

| Option | Description |
|--------|-------------|
| `experimentalDecorators` | Enable legacy decorators |
| `emitDecoratorMetadata` | Emit type metadata (legacy only) |

## Best Practices

1. **Prefer standard decorators** (TS 5.0+) for new code
2. **Type your decorator functions** — use `ClassMethodDecoratorContext` and generics
3. **Use `addInitializer`** for constructor-side effects
4. **Stack decorators carefully** — order matters when decorators have side effects
5. **Don't mix legacy and standard** — they have incompatible type-checking and emit
