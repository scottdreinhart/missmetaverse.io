---
slug: ts-decorators
sources:
  - https://www.typescriptlang.org/docs/handbook/2/decorators.html
date: 2026-11-02
tags:

  - maturity/experimental









  - typescript
  - decorators
  - metadata
  - reflection
# TypeScript Decorators


## Overview

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
Decorators are a special kind of declaration that can annotate or modify classes, methods, accessors, properties, and parameters. They use the form `@expression`.

## Two Decorator Flavors

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
| Feature | Legacy (`--experimentalDecorators`) | Standard (TS 5.0+) |
|---------|-------------------------------------|---------------------|
| Enable | Requires `--experimentalDecorators` | Enabled by default |
| Parameter decorators | âœ… Supported | âŒ Not supported |
| `--emitDecoratorMetadata` | âœ… Supported | âŒ Not compatible |
| Type checking | Limited | Full type checking |
| Emit | Different transformation | Different transformation |
| Standard status | Experimental | TC39 Stage 3 |

> **Note:** Decorator functions written for legacy mode are unlikely to work with standard mode without changes.

## Decorator Kinds

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
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
- Cannot modify the property â€” only observe it
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

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
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

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
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

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
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

---

## Decision Tree: Decorator Implementation

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
```mermaid
graph TD
    A[Need to modify class/member?]\n    A --> B{What to decorate?}\n    B -->|Class| C[Class decorator]\n    B -->|Method| D[Method decorator]\n    B -->|Property| E[Property decorator]\n    B -->|Accessor| F[Accessor decorator]\n    C --> G{Need config?}\n    G -->|Yes| H[Decorator factory]\n    G -->|No| I[Simple decorator]\n    D --> J{Legacy or Standard?}\n    J -->|Legacy| K[experimentalDecorators]\n    J -->|Standard| L[TS 5.0+ decorators]\n```\n\n### Decorator Selection Guide\n\n| Decorator Type | When to Use | Example |\n|----------------|-------------|---------|\n| **Class** | Modify class constructor | `@sealed class Foo {}` |\n| **Method** | Modify method behavior | `@logged method() {}` |\n| **Property** | Add metadata to property | `@format('date') prop: Date` |\n| **Accessor** | Modify getter/setter | `@configurable(false) get x()` |\n| **Factory** | Parameterized decorators | `@role('admin') class Foo {}` |\n\n---

## Procedural Guidance: Decorator Implementation

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
### Step 1: Legacy Decorators (experimentalDecorators)

```typescript
// decorators/legacy-decorators.ts
// Enable with: "experimentalDecorators": true in tsconfig.json

// Class decorator
function sealed(constructor: Function) {
  Object.seal(constructor)
  Object.seal(constructor.prototype)
}

// Method decorator factory
function enumerable(value: boolean) {
  return function (
    target: any,
    propertyKey: string,
    descriptor: PropertyDescriptor,
  ) {
    descriptor.enumerable = value
  }
}

// Property decorator
const formatMetadataKey = Symbol('format')

function format(formatString: string) {
  return function (target: any, propertyKey: string) {
    Reflect.defineMetadata(formatMetadataKey, formatString, target, propertyKey)
  }
}

// Parameter decorator (legacy only)
function required(
  target: Object,
  propertyKey: string | symbol,
  parameterIndex: number,
) {
  // Mark parameter as required
}

class Greeter {
  @format('Hello, %s')
  greeting: string

  @enumerable(false)
  greet() {
    return 'Hello, ' + this.greeting
  }

  print(@required verbose: boolean) {
    if (verbose) {
      return `type: ${this.type}\ntitle: ${this.title}`
    }
    return this.title
  }
}
```

### Step 2: Standard Decorators (TS 5.0+)

```typescript
// decorators/standard-decorators.ts

// Method decorator with typed context
function loggedMethod<This, Args extends any[], Return>(
  target: (this: This, ...args: Args) => Return,
  context: ClassMethodDecoratorContext<This, (this: This, ...args: Args) => Return>,
) {
  const methodName = String(context.name)

  function replacementMethod(this: This, ...args: Args): Return {
    console.log(`LOG: Entering method '${methodName}'.`)
    const result = target.call(this, ...args)
    console.log(`LOG: Exiting method '${methodName}'.`)
    return result
  }
  return replacementMethod
}

// Class decorator
function logClass<
  TConstructor extends new (...args: any[]) => object,
>(constructor: TConstructor) {
  return class extends constructor {
    constructor(...args: any[]) {
      super(...args)
      console.log(`Created instance of ${constructor.name}`)
    }
  }
}

// Property decorator
function logProperty(
  target: unknown,
  propertyKey: string | symbol,
  descriptor: PropertyDescriptor,
) {
  const getter = descriptor.get
  const setter = descriptor.set

  if (getter) {
    descriptor.get = function (...args: any[]) {
      console.log(`GET ${propertyKey as string}`)
      return getter.apply(this)
    }
  }

  if (setter) {
    descriptor.set = function (value: any, ...args: any[]) {
      console.log(`SET ${propertyKey as string} = ${value}`)
      return setter.apply(this, [value, ...args])
    }
  }
}

@logClass
class Person {
  @logProperty
  name: string

  constructor(name: string) {
    this.name = name
  }

  greet() {
    console.log(`Hello, my name is ${this.name}.`)
  }
}
```

### Step 3: Decorator Factories

```typescript
// decorators/factories.ts

// Parameterized decorator factory
function role(requiredRole: string) {
  return function (
    target: any,
    propertyKey: string,
    descriptor: PropertyDescriptor,
  ) {
    const originalMethod = descriptor.value

    descriptor.value = function (...args: any[]) {
      // Check role before calling method
      const userRole = this.getCurrentUserRole()
      if (userRole !== requiredRole) {
        throw new Error(`Unauthorized: requires ${requiredRole}`)
      }
      return originalMethod.apply(this, args)
    }

    return descriptor
  }
}

class AdminPanel {
  getCurrentUserRole(): string {
    return 'admin'
  }

  @role('admin')
  deleteUsers() {
    console.log('Deleting users...')
  }

  @role('manager')
  updateSettings() {
    console.log('Updating settings...')
  }
}
```

### Step 4: Decorator Composition

```typescript
// decorators/composition.ts

function first() {
  return function (
    target: any,
    propertyKey: string,
    descriptor: PropertyDescriptor,
  ) {
    console.log('first(): factory evaluated')
    const original = descriptor.value

    descriptor.value = function (...args: any[]) {
      console.log('first(): called')
      return original.apply(this, args)
    }
  }
}

function second() {
  return function (
    target: any,
    propertyKey: string,
    descriptor: PropertyDescriptor,
  ) {
    console.log('second(): factory evaluated')
    const original = descriptor.value

    descriptor.value = function (...args: any[]) {
      console.log('second(): called')
      return original.apply(this, args)
    }
  }
}

class ExampleClass {
  @first()
  @second()
  method() {
    console.log('method executed')
  }
}

// Output order:
// 1. first(): factory evaluated
// 2. second(): factory evaluated
// 3. second(): called
// 4. first(): called
// 5. method executed
```

### Step 5: Use Decorators for Validation

```typescript
// decorators/validation.ts

function validate(
  target: any,
  propertyKey: string,
  descriptor: PropertyDescriptor,
) {
  const setter = descriptor.set

  if (setter) {
    descriptor.set = function (value: any) {
      // Validate before setting
      if (value === null || value === undefined) {
        throw new Error(`${propertyKey as string} cannot be null or undefined`)
      }
      if (typeof value === 'string' && value.length === 0) {
        throw new Error(`${propertyKey as string} cannot be empty`)
      }
      return setter.call(this, value)
    }
  }

  return descriptor
}

class User {
  private _name: string

  get name(): string {
    return this._name
  }

  @validate
  set name(value: string) {
    this._name = value
  }
}
```

---

## Copilot Instructions

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
### When to Read This Note
- Creating class decorators
- Implementing method decorators
- Building decorator factories
- Adding validation decorators
- Using decorator composition

### What to Do With This Information
1. **Use class decorators**: For class-level modifications
2. **Use method decorators**: For cross-cutting concerns (logging, validation)
3. **Use factories**: For parameterized decorators
4. **Compose decorators**: For layered behavior
5. **Use validation**: For property validation

### Tools to Use
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `reflect-metadata` â€” for metadata reflection
- **npm Package**: `typescript` â€” for type checking
- **Terminal Command**: `tsc --noEmit` â€” check types
- **Terminal Command**: `pnpm test` â€” run tests

### Agents to Invoke
- **Code Review Agent**: Run when reviewing decorator implementations
- **TypeScript Agent**: Run when debugging decorator issues

### Integration with Other Notes
- read [[typescript-strict-mode]] for strict mode configuration
- read [[TypeScript/generics]] for advanced type patterns
- read [[ts-Security/web-security]] for security decorators

### Common Pitfalls
- Don't mix legacy and standard decorators
- Don't forget decorator order (bottom-to-top execution)
- Don't use decorators for business logic (use services)
- Don't skip type safety (use typed decorators in TS 5.0+)
- Don't overuse decorators (keep them simple)

### Quick Validation Checklist
- [ ] Are decorators typed correctly?
- [ ] Is decorator order documented?
- [ ] Are factories used for parameters?
- [ ] Are side effects minimal?
- [ ] Are decorators testable?
- [ ] Is legacy vs standard consistent?

## Decorator Context Object

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
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

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
1. Parameter decorators â†’ Method/Accessor/Property decorators (for each instance member)
2. Parameter decorators â†’ Method/Accessor/Property decorators (for each static member)
3. Parameter decorators (for constructor)
4. Class decorators (for the class)

## Metadata (Legacy)

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
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

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
| Option | Description |
|--------|-------------|
| `experimentalDecorators` | Enable legacy decorators |
| `emitDecoratorMetadata` | Emit type metadata (legacy only) |

## Best Practices

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
1. **Prefer standard decorators** (TS 5.0+) for new code
2. **Type your decorator functions** â€” use `ClassMethodDecoratorContext` and generics
3. **Use `addInitializer`** for constructor-side effects
4. **Stack decorators carefully** â€” order matters when decorators have side effects
5. **Don't mix legacy and standard** â€” they have incompatible type-checking and emit




---



## See Also

## concept_id
t03-ts-decorators

## title
TypeScript Decorators

## aliases
- T03-ts-decorators

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required- [[T01-TypeScript/generics]]
- [[T02-TypeScript/typescript-strict-mode]]
- [[T04-TypeScript/typescript-strict-mode]]
- [[T05-TypeScript/type-inference]]
- [[T06-TypeScript/typescript-strict-mode]]


