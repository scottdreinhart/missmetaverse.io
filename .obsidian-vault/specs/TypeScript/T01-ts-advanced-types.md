---
slug: TypeScript/generics
sources:
  - https://www.typescriptlang.org/docs/handbook/2/types-from-types.html
  - https://www.typescriptlang.org/docs/handbook/2/conditional-types.html
date: 2026-11-02
tags:
  - typescript   - javascript   - type-system

  - typescript
  - generics
  - conditional-types
  - utility-types

# TypeScript Advanced Types


## Generics

## concept_id
t01-ts-advanced-types

## title
TypeScript Advanced Types

## aliases
- T01-ts-advanced-types

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
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