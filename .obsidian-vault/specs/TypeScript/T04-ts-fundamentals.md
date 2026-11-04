---
slug: typescript-fundamentals
sources:
  - https://www.typescriptlang.org/docs/handbook/2/basic-types.html
  - https://www.typescriptlang.org/docs/handbook/2/everyday-types.html
date: 2026-11-02
tags:
  - typescript-javascript-type-system

  - maturity/deprecated

  - typescript
  - types
  - interfaces
  - basics

# TypeScript Fundamentals â€” Types & Interfaces


## Static Type Checking

## concept_id
t04-ts-fundamentals

## title
TypeScript Fundamentals â€” Types & Interfaces

## aliases
- T04-ts-fundamentals

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
TypeScript is a **static type checker** that predicts what code will do *before* it runs. It catches bugs that dynamic JavaScript would only reveal at runtime.

### Key Benefits
- **Bug prevention**: Catches typos, uncallable values, missing properties before runtime
- **Tooling**: Powers IDE features â€” autocomplete, go-to-definition, refactoring
- **Documentation**: Types serve as living documentation for code shape

### `tsc` â€” The TypeScript Compiler
- Compiles `.ts` â†’ `.js` (erasing type annotations)
- Type annotations are **erased** at compile time â€” they don't affect runtime behavior
- Can emit with errors (`tsc hello.ts`) or block emission (`tsc --noEmitOnError hello.ts`)
- Supports **downleveling**: transpiling newer JS to older targets (ES6 â†’ ES5)

## Primitives