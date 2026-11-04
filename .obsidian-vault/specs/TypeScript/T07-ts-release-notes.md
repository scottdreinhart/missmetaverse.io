---
slug: ts-release-notes
sources:
  - https://www.typescriptlang.org/download/
date: 2026-11-02
tags:
  - typescript-javascript-type-system

  - maturity-experimental

  - typescript
  - release-notes
  - changelog
  - new-features
# TypeScript 5.0+ Release Notes


## Decorators (Standard)

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
TypeScript 5.0 introduced **standard-compliant decorators** (TC39 Stage 3), separate from the legacy `--experimentalDecorators` mode.

### Key Changes
- Decorators are now valid syntax without `--experimentalDecorators`
- Full type checking on decorators
- Different emit behavior from legacy decorators
- `--emitDecoratorMetadata` is **not compatible** with standard decorators
- Parameter decorators are **not supported** in standard mode

### Decorator Factories
```typescript
function loggedMethod(headMessage = "LOG:") {
  return function actualDecorator(
    originalMethod: any,
    context: ClassMethodDecoratorContext
  ) {
    const methodName = String(context.name);
    function replacementMethod(this: any, ...args: any[]) {
      console.log(`${headMessage} Entering method '${methodName}'.`);
      const result = originalMethod.call(this, ...args);
      console.log(`${headMessage} Exiting method '${methodName}'.`);
      return result;
    }
    return replacementMethod;
  };
}

// Usage with customization
class Person {
  @loggedMethod("âš ï¸")
  greet() { }
}
```

## `const` Type Parameters